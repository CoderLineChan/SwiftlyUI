//
//  UIControl+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

#if canImport(UIKit) && os(iOS)
import UIKit

public extension UIControl {
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func enabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func disabled(_ disabled: Bool = true) -> Self {
        self.isEnabled = !disabled
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func selected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func highlighted(_ highlighted: Bool) -> Self {
        self.isHighlighted = highlighted
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func contentVerticalAlignment(_ alignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = alignment
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @discardableResult
    func contentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = alignment
        return self
    }
    
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UIControl`.
    @available(iOS 14, *)
    @discardableResult
    func contextMenuInteractionEnabled(_ enable: Bool) -> Self {
        self.isContextMenuInteractionEnabled = enable
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    @available(iOS 14, *)
    @discardableResult
    func showsMenuAsPrimaryAction(_ shows: Bool) -> Self {
        self.showsMenuAsPrimaryAction = shows
        return self
    }
    
#endif
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UIControl`.
    @available(iOS 15.0, *)
    @discardableResult
    func toolTip(_ text: String?) -> Self {
        self.toolTip = text
        return self
    }
    
#endif
    
//    @discardableResult
//    func symbolAnimationEnabled(_ enabled: Bool) -> Self {
//        self.isSymbolAnimationEnabled = enabled
//        return self
//    }
}

public extension UIControl {
    
    /// SwiftlyUI extension for `UIControl`.
    convenience init(_ action: @escaping () -> Void, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    /// SwiftlyUI extension for `UIControl`.
    convenience init<T: UIControl>(_ action: @escaping (T) -> Void, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    /// SwiftlyUI extension for `UIControl`.
    convenience init(@SwiftlyUIBuilder content: () -> [UIView], action: @escaping () -> Void) {
        self.init(content: content) { _ in
            action()
        }
    }
    
    /// SwiftlyUI extension for `UIControl`.
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
    
    /// SwiftlyUI extension for `UIControl`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onAction(target: self, action: { $0.doSomething() })
    @discardableResult
    func onAction<T: AnyObject>(target: T, for event: UIControl.Event = .touchUpInside, action: @escaping (T) -> Void) -> Self {
        var actionClosure = actionClosures
        if let oldWrapper = actionClosure[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
            actionClosure.removeValue(forKey: event.rawValue)
        }
        
        if let oldHandler = actionClosure[event.rawValue] as? ActionSingleHandler<T> {
            removeTarget(oldHandler, action: nil, for: event)
            actionClosure.removeValue(forKey: event.rawValue)
        }
        
        let handler = ActionSingleHandler(target: target, action: action)
        addTarget(handler, action: #selector(ActionSingleHandler<T>.invoke), for: event)
        actionClosure[event.rawValue] = handler
        actionClosures = actionClosure
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onAction(target: self, action: { (vc: ViewController, btn: UIButton) in vc.doSomething(with: btn) })
    @discardableResult
    func onAction<T: AnyObject, ControlType: UIControl>(target: T, for event: UIControl.Event = .touchUpInside, action: @escaping (T, ControlType) -> Void) -> Self {
        var actionClosure = actionClosures
        if let oldWrapper = actionClosure[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
            actionClosure.removeValue(forKey: event.rawValue)
        }
        
        if let oldHandler = actionClosure[event.rawValue] as? ActionHandler<T, ControlType> {
            removeTarget(oldHandler, action: nil, for: event)
            actionClosure.removeValue(forKey: event.rawValue)
        }
        
        let handler = ActionHandler(target: target, action: action)
        addTarget(handler, action: #selector(ActionHandler<T, ControlType>.invoke(_:)), for: event)
        actionClosure[event.rawValue] = handler
        actionClosures = actionClosure
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// button.onAction { [weak self] in self?.doSomething() }
    @discardableResult
    func onAction(for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) -> Self {
        return onAction { _ in
            action()
        }
    }
    
    /// SwiftlyUI extension for `UIControl`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// button.onAction { [weak self] (btn: UIButton) in self?.doSomething() }
    @discardableResult
    func onAction<T: UIControl>(for event: UIControl.Event = .touchUpInside, action: @escaping (T) -> Void) -> Self {
        var actionClosure = actionClosures
        if let oldWrapper = actionClosures[event.rawValue] {
            removeTarget(oldWrapper, action: nil, for: event)
            actionClosure.removeValue(forKey: event.rawValue)
        }
        
        let wrapper = ClosureWrapper<T>(button: self as! T, closure: action)
        addTarget(wrapper, action: #selector(ClosureWrapper.invoke), for: event)
        
        var closures = actionClosure
        closures[event.rawValue] = wrapper
        actionClosures = closures
        return self
    }
    
    /// SwiftlyUI extension for `UIControl`.
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
        guard let target = target else {
            print("SwiftlyUI - Target is nil, please check if the target is deallocated.")
            return
        }
        guard let control = sender as? ControlType else {
            print("SwiftlyUI - Sender is not of type \(ControlType.self), please check the control type.")
            return
        }
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
        guard let target = target else {
            print("SwiftlyUI - Target is nil, please check if the target is deallocated.")
            return
        }
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
        guard let button = button else {
            print("SwiftlyUI - Target is nil, please check if the target is deallocated.")
            return
        }
        closure(button)
    }
}

private extension UIControl {
    struct UIControlAssociatedKeys {
        nonisolated(unsafe) static var actionClosuresKey: Void?
    }
    private var actionClosures: [UInt: Any] {
        get {
            return objc_getAssociatedObject(self, &UIControlAssociatedKeys.actionClosuresKey) as? [UInt: Any] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &UIControlAssociatedKeys.actionClosuresKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
   
}
#endif
