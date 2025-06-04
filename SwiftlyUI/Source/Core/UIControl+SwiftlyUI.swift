//
//  UIControl+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//
#if canImport(UIKit) && os(iOS)
import UIKit

public extension UIControl {
    
    convenience init(_ action: @escaping () -> Void, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    convenience init<T: UIControl>(_ action: @escaping (T) -> Void, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    convenience init(@SwiftlyUIBuilder content: () -> [UIView], action: @escaping () -> Void) {
        self.init(content: content) { _ in
            action()
        }
    }
    
    convenience init<T: UIControl>(@SwiftlyUIBuilder content: () -> [UIView], action: @escaping (T) -> Void) {
        self.init(frame: .zero)
        let views = content()
        setCanActiveLayout(false, forViews: views)
        views.forEach {
            addSubview($0)
            $0.isUserInteractionEnabled = false
        }
        setCanActiveLayout(true, forViews: views)
        views.forEach({ $0.interiorActivateAllConstraints() })
        views.forEach { view in
            applyAlignmentConstraints(for: view)
        }
        onAction(action: action)
    }
}

// MARK: - Action
public extension UIControl {
    
    /// .onAction(target: self, action: { $0.doSomething() })
    @discardableResult
    func onAction<T: AnyObject>(target: T, for event: UIControl.Event = .touchUpInside, action: @escaping (T) -> Void) -> Self {
        if let oldWrapper = actionClosures[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
        }
        
        if let oldHandler = actionClosures[event.rawValue] as? ActionSingleHandler<T> {
            removeTarget(oldHandler, action: nil, for: event)
        }
        
        let handler = ActionSingleHandler(target: target, action: action)
        addTarget(handler, action: #selector(ActionSingleHandler<T>.invoke), for: event)
        actionClosures[event.rawValue] = handler
        return self
    }
    
    /// .onAction(target: self, action: { (vc: ViewController, btn: UIButton) in vc.doSomething(with: btn) })
    @discardableResult
    func onAction<T: AnyObject, ControlType: UIControl>(target: T, for event: UIControl.Event = .touchUpInside, action: @escaping (T, ControlType) -> Void) -> Self {
        if let oldWrapper = actionClosures[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
        }
        
        if let oldHandler = actionClosures[event.rawValue] as? ActionHandler<T, ControlType> {
            removeTarget(oldHandler, action: nil, for: event)
        }
        
        let handler = ActionHandler(target: target, action: action)
        addTarget(handler, action: #selector(ActionHandler<T, ControlType>.invoke(_:)), for: event)
        actionClosures[event.rawValue] = handler
        return self
    }
    
    /// button.onAction { [weak self] in self?.doSomething() }
    @discardableResult
    func onAction(for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) -> Self {
        return onAction { _ in
            action()
        }
    }
    /// button.onAction { [weak self] (btn: UIButton) in self?.doSomething() }
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
    func onAction(target: Any?, action:Selector, event: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: action, for: event)
        return self
    }
}

private class ActionHandler<T: AnyObject, ControlType: UIControl>: NSObject {
    private weak var target: T?
    private let action: (T, ControlType) -> Void
    
    init(target: T, action: @escaping (T, ControlType) -> Void) {
        self.target = target
        self.action = action
        super.init()
    }
    
    @objc func invoke(_ sender: UIControl) {
        guard let target = target, let control = sender as? ControlType else { return }
        action(target, control)
    }
}

private class ActionSingleHandler<T: AnyObject>: NSObject {
    private weak var target: T?
    private let action: (T) -> Void
    
    init(target: T, action: @escaping (T) -> Void) {
        self.target = target
        self.action = action
        super.init()
    }
    
    @objc func invoke() {
        guard let target = target else { return }
        action(target)
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
#endif
