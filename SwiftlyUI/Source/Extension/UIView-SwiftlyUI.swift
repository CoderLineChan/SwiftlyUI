//
//  UIView+Animation.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//
#if canImport(UIKit)
import UIKit

// MARK: - ViewBuilder
@resultBuilder
public struct SwiftlyUIBuilder {
    public static func buildBlock(_ components: [UIView]...) -> [UIView] { components.flatMap { $0 } }
    public static func buildBlock() -> [UIView] { [] }
    public static func buildOptional(_ component: [UIView]?) -> [UIView] { component ?? [] }
    public static func buildArray(_ components: [[UIView]]) -> [UIView] { components.flatMap { $0 } }
    public static func buildEither(first: [UIView]) -> [UIView] { first }
    public static func buildEither(second: [UIView]) -> [UIView] { second }
    public static func buildPartialBlock(first: [UIView]) -> [UIView] { first }
    public static func buildPartialBlock(accumulated: [UIView], next: [UIView]) -> [UIView] { accumulated + next }
    public static func buildExpression(_ expression: UIView) -> [UIView] { [expression] }
    public static func buildExpression<T: SwiftlyUIViewBuildingProtocol>(_ expression: T) -> [UIView] { expression.swiftlyUIViews }
}

// MARK: - Padding Edge
@frozen public struct EdgeSet : OptionSet, Sendable {
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

@frozen public struct UnitPoint: Hashable, Equatable {
    public var x: CGFloat
    public var y: CGFloat
    
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    public static let center = UnitPoint(x: 0.5, y: 0.5)
    public static let leading = UnitPoint(x: 0.0, y: 0.5)
    public static let trailing = UnitPoint(x: 1.0, y: 0.5)
    public static let top = UnitPoint(x: 0.5, y: 0.0)
    public static let bottom = UnitPoint(x: 0.5, y: 1.0)
    public static let topLeading = UnitPoint(x: 0.0, y: 0.0)
    public static let topTrailing = UnitPoint(x: 1.0, y: 0.0)
    public static let bottomLeading = UnitPoint(x: 0.0, y: 1.0)
    public static let bottomTrailing = UnitPoint(x: 1.0, y: 1.0)
}

@frozen public enum GradientDirection {
    case topToBottom
    case bottomToTop
    case leftToRight
    case rightToLeft
    case upleftToLowright
    case uprightToLowleft
    
    func gradientPointsForLayer() -> (start: CGPoint, end: CGPoint) {
        switch self {
        case .topToBottom:
            return (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
        case .bottomToTop:
            return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
        case .leftToRight:
            return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
        case .rightToLeft:
            return (CGPoint(x: 1, y: 0.5), CGPoint(x: 0, y: 0.5))
        case .upleftToLowright:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
        case .uprightToLowleft:
            return (CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1))
        }
    }
    
    func gradientPointsForImage(size: CGSize) -> (start: CGPoint, end: CGPoint) {
        switch self {
        case .topToBottom:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 0, y: size.height))
        case .bottomToTop:
            return (CGPoint(x: 0, y: size.height), CGPoint(x: 0, y: 0))
        case .leftToRight:
            return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: 0))
        case .rightToLeft:
            return (CGPoint(x: size.width, y: 0), CGPoint(x: 0, y: 0))
        case .upleftToLowright:
            return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: size.height))
        case .uprightToLowleft:
            return (CGPoint(x: size.width, y: 0), CGPoint(x: 0, y: size.height))
        }
    }
}


// MARK: - Animation
public struct UIKitAnimation {
    let duration: TimeInterval
    let delayInterval: TimeInterval
    let refreshAllViews: Bool
    let options: UIView.AnimationOptions
    
    private static let defaultDuration: TimeInterval = 0.3
    
    public static var `default`: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    public static func `default`(duration: TimeInterval? = nil) -> Self {
        Self(duration: duration ?? defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    public static var linear: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveLinear, .allowUserInteraction])
    }
    public static func linear(duration: TimeInterval? = nil, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration ?? defaultDuration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveLinear, .allowUserInteraction])
    }
    
    public static var easeIn: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseIn, .allowUserInteraction])
    }
    public static func easeIn(duration: TimeInterval? = nil, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration ?? defaultDuration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseIn, .allowUserInteraction])
    }
    
    public static var easeOut: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseOut, .allowUserInteraction])
    }
    public static func easeOut(duration: TimeInterval? = nil, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration ?? defaultDuration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseOut, .allowUserInteraction])
    }
    
    public static var easeInOut: Self {
        Self(duration: defaultDuration, delayInterval: 0, refreshAllViews: false, options: [.curveEaseInOut, .allowUserInteraction])
    }
    public static func easeInOut(duration: TimeInterval? = nil, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(duration: duration ?? defaultDuration, delayInterval: delay, refreshAllViews: refreshAllViews, options: [.curveEaseInOut, .allowUserInteraction])
    }
    
    public static func spring(duration: TimeInterval, dampingRatio: CGFloat, initialVelocity: CGFloat = 0, delay: TimeInterval = 0, refreshAllViews: Bool = false) -> Self {
        Self(
            duration: duration,
            delayInterval: delay, refreshAllViews: refreshAllViews,
            options: [.allowUserInteraction]
        )
        
    }
    
    public static func delay(_ delay: TimeInterval, animation: Self, refreshAllViews: Bool = false) -> Self {
        Self(
            duration: animation.duration,
            delayInterval: delay, refreshAllViews: refreshAllViews,
            options: animation.options
        )
    }
    
    public static func repeatCount(_ count: Float, autoreverses: Bool = true, animation: Self) -> Self {
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
    
    public static func repeatForever(autoreverses: Bool = true, animation: Self) -> Self {
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

// MARK: - <#desc#>
public extension UIView {
    func createGradientLayer(colors: [UIColor], direction: GradientDirection) -> CAGradientLayer {
        return CAGradientLayer.gradient(colors: colors, direction: direction)
    }
}

extension UIView {
    func setCanActiveLayout(_ enabled: Bool, forViews views: [UIView]) {
        views.forEach { view in
            view.canActiveLayout = enabled
            setCanActiveLayout(enabled, forViews: view.subviews)
        }
    }
    
    func applyAlignmentConstraints(for view: UIView) {
        let guide = self
        let leadingConstraint = leadingAnchor.constraint(greaterThanOrEqualTo: guide.layoutMarginsGuide.leadingAnchor)
        leadingConstraint.priority = .defaultLow
        view.addNewConstraint(
            leadingConstraint,
            type: .marginsLeft
        )
        let trailingConstraint = trailingAnchor.constraint(lessThanOrEqualTo: guide.layoutMarginsGuide.trailingAnchor)
        trailingConstraint.priority = .defaultLow
        view.addNewConstraint(
            trailingConstraint,
            type: .marginsRight
        )
        let topConstraint = topAnchor.constraint(greaterThanOrEqualTo: guide.layoutMarginsGuide.topAnchor)
        topConstraint.priority = .defaultLow
        view.addNewConstraint(
            topConstraint,
            type: .marginsTop
        )
        let bottomConstraint = bottomAnchor.constraint(lessThanOrEqualTo: guide.layoutMarginsGuide.bottomAnchor)
        bottomConstraint.priority = .defaultLow
        view.addNewConstraint(
            bottomConstraint,
            type: .marginsBottom
        )
    }
}

struct CornerInfo {
    let radius: CGFloat
    let corners: UIRectCorner
}

// MARK: - Gesture AssociatedKey
extension UIView {
    fileprivate struct AssociatedKeys {
        nonisolated(unsafe) static var tapActionKey: UInt8 = 0
        nonisolated(unsafe) static var doubleTapActionKey: UInt8 = 0
        nonisolated(unsafe) static var longPressActionKey: UInt8 = 0
        nonisolated(unsafe) static var panActionKey: UInt8 = 0
        nonisolated(unsafe) static var swipeActionKey: UInt8 = 0
        nonisolated(unsafe) static var pinchActionKey: UInt8 = 0
        nonisolated(unsafe) static var rotationActionKey: UInt8 = 0
        
        nonisolated(unsafe) static var gestureTypeKey: Void?
        
        nonisolated(unsafe) static let tapActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &tapActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let doubleTapActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &doubleTapActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let longPressActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &longPressActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let panActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &panActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let swipeActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &swipeActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let pinchActionKeyPtr: UnsafeRawPointer = {
            withUnsafePointer(to: &pinchActionKey) { UnsafeRawPointer($0) }
        }()
        nonisolated(unsafe) static let rotationActionKeyPtr: UnsafeRawPointer = {
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

// MARK: - Gesture Type
extension UIGestureRecognizer {
    var gestureType: UIView.GestureType? {
        get {
            objc_getAssociatedObject(self, &UIView.AssociatedKeys.gestureTypeKey) as? UIView.GestureType
        }
        set {
            objc_setAssociatedObject(
                self,
                &UIView.AssociatedKeys.gestureTypeKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

// MARK: - Disposable Once
struct __UIViewDisposableClass {
    @MainActor private static var hasExecuted = false
    @MainActor static func runOnce(block: () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}

// MARK: - Global Once Swizzled Method
extension UIView {
    static func onceSwizzled() {
        __UIViewDisposableClass.runOnce {
            UIView.layoutOnce()
        }
    }
}

// MARK: - swizzleMethod
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

#endif
