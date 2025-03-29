//
//  UIControl+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

import UIKit

// MARK: - Action
public extension UIControl {
    @discardableResult
    func onAction(for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) -> Self {
        return onAction { _ in
            action()
        }
    }
    
    @discardableResult
    func onAction<T: UIControl>(for event: UIControl.Event = .touchUpInside, action: @escaping (T) -> Void) -> Self {
        if let oldWrapper = actionClosures[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
        }
        
        let wrapper = ClosureWrapper<T>(button: self as! T, closure: action)
        addTarget(wrapper, action: #selector(ClosureWrapper.invoke), for: event)
        
        var closures = actionClosures
        closures[event.rawValue] = wrapper
        actionClosures = closures
        return self
    }
    
    @discardableResult
    func onAction(_ target: Any?, action:Selector, event: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: action, for: event)
        return self
    }
}

// MARK: - private
private class ClosureWrapper<T: UIControl>: NSObject {
    private weak var button: T?
    private let closure: (T) -> Void
    
    init(button: T, closure: @escaping (T) -> Void) {
        self.button = button
        self.closure = closure
    }
    
    @objc func invoke() {
        guard let button = button else { return }
        closure(button)
    }
}

private extension UIControl {
    struct AssociatedKeys {
        nonisolated(unsafe) static var actionClosuresKey: Void?
    }
    private var actionClosures: [UInt: Any] {
        get {
            return objc_getAssociatedObject(
                self,
                withUnsafePointer(to: &AssociatedKeys.actionClosuresKey) { UnsafeRawPointer($0) }
            ) as? [UInt: ClosureWrapper] ?? [:]
        }
        set {
            objc_setAssociatedObject(
                self,
                withUnsafePointer(to: &AssociatedKeys.actionClosuresKey) { UnsafeRawPointer($0) },
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}
