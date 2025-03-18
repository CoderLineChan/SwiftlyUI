//
//  UIView+Animation.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

import UIKit

public struct EdgeSet : OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    public static let top = EdgeSet(rawValue: 1 << 0)
    public static let left = EdgeSet(rawValue: 1 << 1)
    public static let bottom = EdgeSet(rawValue: 1 << 2)
    public static let right = EdgeSet(rawValue: 1 << 3)
    public static let horizontal: EdgeSet = [.left, .right]
    public static let vertical: EdgeSet = [.top, .bottom]
    public static let all: EdgeSet = [.top, .left, .bottom, .right]
}

private let defaultDuration: TimeInterval = 0.3
public struct UIKitAnimation {
    let duration: TimeInterval
    let delayInterval: TimeInterval
    let refreshAllViews: Bool
    let options: UIView.AnimationOptions
    
    static var `default`: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    static func `default`(duration: TimeInterval = defaultDuration) -> Self {
        Self(duration: duration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    static var linear: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveLinear, .allowUserInteraction])
    }
    static func linear(duration: TimeInterval = defaultDuration, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveLinear, .allowUserInteraction])
    }
    
    static var easeIn: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseIn, .allowUserInteraction])
    }
    static func easeIn(duration: TimeInterval = defaultDuration, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseIn, .allowUserInteraction])
    }
    
    static var easeOut: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseOut, .allowUserInteraction])
    }
    static func easeOut(duration: TimeInterval = defaultDuration, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseOut, .allowUserInteraction])
    }
    
    static var easeInOut: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    static func easeInOut(duration: TimeInterval = defaultDuration, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    static func spring(duration: TimeInterval, dampingRatio: CGFloat, initialVelocity: CGFloat = 0, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(
            duration: duration,
            delayInterval: delay, refreshAllViews: refreshAllViews,
            options: [.allowUserInteraction]
        )
        
    }
    
    static func delay(_ delay: TimeInterval, animation: Self, refreshAllViews: Bool = false) -> Self {
        Self(
            duration: animation.duration,
            delayInterval: delay, refreshAllViews: refreshAllViews,
            options: animation.options
        )
    }
    
    static func repeatCount(_ count: Float, autoreverses: Bool = true, animation: Self) -> Self {
        var options = animation.options
        if autoreverses {
            options.insert(.autoreverse)
        }
        options.insert(.repeat)
        return Self(
            duration: animation.duration,
            delayInterval: animation.delayInterval, refreshAllViews: false,
            options: options
        )
    }
    
    static func repeatForever(autoreverses: Bool = true, animation: Self) -> Self {
        var options = animation.options
        if autoreverses {
            options.insert(.autoreverse)
        }
        options.insert(.repeat)
        return Self(
            duration: animation.duration,
            delayInterval: animation.delayInterval, refreshAllViews: false,
            options: options
        )
    }
}

extension UIView {
    static func swizzleMethod(clas: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(clas, originalSelector),
              let swizzledMethod = class_getInstanceMethod(clas, swizzledSelector) else {
            fatalError("Failed to swizzleMethod")
        }
        
        let didAddMethod = class_addMethod(clas,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod))
        if didAddMethod {
            class_replaceMethod(clas,swizzledSelector,method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

extension UIView {
    func createGestureRecognizer<T: UIGestureRecognizer>(
        for type: GestureType,
        action: @escaping (T) -> Void
    ) -> (T, ViewGestureActionClosure<T>, UnsafeRawPointer?) {
        let closure = ViewGestureActionClosure(action: action)
        var key: UnsafeRawPointer?
        var gesture: UIGestureRecognizer
        
        switch type {
        case .tap:
            let tap = UITapGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            tap.numberOfTapsRequired = 1
            gesture = tap
            key = type.associatedKey
            
        case .doubleTap:
            let tap = UITapGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            tap.numberOfTapsRequired = 2
            gesture = tap
            key = type.associatedKey
            
        case .longPress(let duration):
            let press = UILongPressGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            press.minimumPressDuration = duration
            gesture = press
            key = type.associatedKey
            
        case .pan:
            gesture = UIPanGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            key = type.associatedKey
            
        case .swipe(let direction):
            let swipe = UISwipeGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            swipe.direction = direction
            gesture = swipe
            key = type.associatedKey
            
        case .pinch:
            gesture = UIPinchGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            key = type.associatedKey
            
        case .rotation:
            gesture = UIRotationGestureRecognizer(target: closure, action: #selector(ViewGestureActionClosure.invoke))
            key = type.associatedKey
        }
        return (gesture as! T, closure, key)
    }
    
    func handleGestureDependencies(for type: GestureType, gesture: UIGestureRecognizer) {
        switch type {
        case .doubleTap:
            gestureRecognizers?
                    .compactMap { $0 as? UITapGestureRecognizer }
                    .filter { $0.numberOfTapsRequired == 1 }
                    .forEach { singleTapGesture in
                        singleTapGesture.require(toFail: gesture)
                    }
        case .tap:
            gestureRecognizers?
                    .compactMap { $0 as? UITapGestureRecognizer }
                    .filter { $0.numberOfTapsRequired == 2 }
                    .forEach { doubleTapGesture in
                        gesture.require(toFail: doubleTapGesture)
                    }
        case .longPress:
            gestureRecognizers?
                    .compactMap { $0 as? UITapGestureRecognizer }
                    .filter { $0.numberOfTapsRequired == 1 }
                    .forEach { singleTapGesture in
                        singleTapGesture.require(toFail: gesture)
                    }
        default:
            break
        }
    }
}

extension UIView {
    private struct AssociatedKeys {
        static var tapActionKey: UInt8 = 0
        static var doubleTapActionKey: UInt8 = 0
        static var longPressActionKey: UInt8 = 0
        static var panActionKey: UInt8 = 0
        static var swipeActionKey: UInt8 = 0
        static var pinchActionKey: UInt8 = 0
        static var rotationActionKey: UInt8 = 0
        
        static let tapActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &tapActionKey) { UnsafeRawPointer($0) }
        }()
        static let doubleTapActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &doubleTapActionKey) { UnsafeRawPointer($0) }
        }()
        static let longPressActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &longPressActionKey) { UnsafeRawPointer($0) }
        }()
        static let panActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &panActionKey) { UnsafeRawPointer($0) }
        }()
        static let swipeActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &swipeActionKey) { UnsafeRawPointer($0) }
        }()
        static let pinchActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &pinchActionKey) { UnsafeRawPointer($0) }
        }()
        static let rotationActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &rotationActionKey) { UnsafeRawPointer($0) }
        }()
    }
}

extension UIView.GestureType {
    var associatedKey: UnsafeRawPointer {
        switch self {
        case .tap: return UIView.AssociatedKeys.tapActionKeyPtr
        case .doubleTap: return UIView.AssociatedKeys.doubleTapActionKeyPtr
        case .longPress: return UIView.AssociatedKeys.longPressActionKeyPtr
        case .pan: return UIView.AssociatedKeys.panActionKeyPtr
        case .swipe: return UIView.AssociatedKeys.swipeActionKeyPtr
        case .pinch: return UIView.AssociatedKeys.pinchActionKeyPtr
        case .rotation: return UIView.AssociatedKeys.rotationActionKeyPtr
        }
    }
}

class ViewGestureActionClosure<T: UIGestureRecognizer> {
    var action: (T) -> Void
    init(action: @escaping (T) -> Void) {
        self.action = action
    }
    @objc func invoke(_ gesture: UIGestureRecognizer) {
        switch gesture {
        case is UITapGestureRecognizer:
            guard gesture.state == .ended else { return }
        case is UILongPressGestureRecognizer:
            guard gesture.state == .began else { return }
        default:
            break
        }
        action(gesture as! T)
    }
}
               
extension UIGestureRecognizer {
    private struct AssociatedKeys {
        static var gestureTypeKey: Void?
    }
    
    var gestureType: UIView.GestureType? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.gestureTypeKey) as? UIView.GestureType
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.gestureTypeKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

struct __UIViewDisposableClass {
    private static var hasExecuted = false
    static func runOnce(block: () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}

extension UIView {
    static func onceSwizzled() {
        __UIViewDisposableClass.runOnce {
            UIView.layoutOnce()
        }
    }
}

