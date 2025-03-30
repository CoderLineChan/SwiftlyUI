//
//  UIControl+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

import UIKit

public extension UIControl {
    
    convenience init(_ action: @escaping () -> Void, @ViewBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    convenience init<T: UIControl>(_ action: @escaping (T) -> Void, @ViewBuilder content: () -> [UIView]) {
        self.init(content: content, action: action)
    }
    
    convenience init(@ViewBuilder content: () -> [UIView], action: @escaping () -> Void) {
        self.init(content: content) { _ in
            action()
        }
    }
    
    convenience init<T: UIControl>(@ViewBuilder content: () -> [UIView], action: @escaping (T) -> Void) {
        self.init(frame: .zero)
        let views = content()
        setCanActiveLayout(false, forViews: views)
        views.forEach {
            addSubview($0)
            $0.isUserInteractionEnabled = false
        }
        setCanActiveLayout(true, forViews: views)
        views.forEach({ $0.safeActivateConstraints() })
        views.forEach { view in
            applyAlignmentConstraints(for: view)
        }
        onAction(action: action)
    }
    
    private func setCanActiveLayout(_ enabled: Bool, forViews views: [UIView]) {
        views.forEach { view in
            view.canActiveLayout = enabled
            setCanActiveLayout(enabled, forViews: view.subviews)
        }
    }
    
    private func applyAlignmentConstraints(for view: UIView) {
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
