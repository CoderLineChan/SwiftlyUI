//
//  UIView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/25.
//

import UIKit

// MARK: - basics
public extension UIView {
    var height: CGFloat {
        get { return frame.size.height }
        set { frame.size.height = newValue }
    }
    
    var width: CGFloat {
        get { return frame.size.width }
        set { frame.size.width = newValue }
    }
    
    var x: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
}

private let backgroundViewTag: Int = 98367682
public extension UIView {
    @discardableResult
    func border(_ color: UIColor, _ width: CGFloat = 1) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func radius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func background(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func backgroundView(_ view: @escaping () -> UIView?) -> Self {
        subviews.forEach({ if $0.tag == backgroundViewTag { $0.removeFromSuperview() } })
        if let subview = view() {
            subview.isUserInteractionEnabled = false
            subview.tag = backgroundViewTag
            insertSubview(subview, at: 0)
            subview.fillSuperview()
        }
        return self
    }
    
    @discardableResult
    func background(_ view: @escaping () -> UIView?) -> Self {
        subviews.forEach({ if $0.tag == backgroundViewTag { $0.removeFromSuperview() } })
        if let subview = view() {
            subview.isUserInteractionEnabled = false
            subview.tag = backgroundViewTag
            insertSubview(subview, at: 0)
            subview.fillSuperview()
        }
        return self
    }
    
    @discardableResult
    func shadow(
        color: UIColor = .black,
        radius: CGFloat = 3,
        opacity: Float = 0.3,
        offset: CGSize = .zero
    ) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        return self
    }
    
    @discardableResult
    func opacity(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    @discardableResult
    func hidden(_ isHidden: Bool = true) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func userInteractionEnabled(_ isEnabled : Bool = true) -> Self {
        self.isUserInteractionEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
}

// MARK: - Layout
public extension UIView {
    @discardableResult
    func fillSuperview(edge: UIEdgeInsets = .zero) -> Self {
        guard let superview = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: edge.top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edge.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edge.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edge.bottom)
        ])
        return self
    }
    
    @discardableResult
    func fill(to view: UIView, _ edge: UIEdgeInsets = .zero) -> Self {
        leading(to: view, offset: edge.left)
        trailing(to: view, offset: edge.right)
        top(to: view, offset: edge.top)
        bottom(to: view, offset: edge.bottom)
        return self
    }
    
    @discardableResult
    func frame(
        width: CGFloat? = nil,
        minWidth: CGFloat? = nil,
        maxWidth: CGFloat? = nil,
        height: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        maxHeight: CGFloat? = nil) -> Self {
        handleDimensionConstraints(
            value: width,
            minValue: minWidth,
            maxValue: maxWidth,
            dimension: widthAnchor,
            types: (.width, .minWidth, .maxWidth))
        
        handleDimensionConstraints(
            value: height,
            minValue: minHeight,
            maxValue: maxHeight,
            dimension: heightAnchor,
            types: (.height, .minHeight, .maxHeight))
        return self
    }
    
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            topAnchor.constraint(equalTo: anchor, constant: offset),
            type: .top
        )
        return self
    }
    
    @discardableResult
    func top(to view: UIView, offset: CGFloat = 0) -> Self {
        top(to: view.topAnchor, offset: offset)
    }
    
    @discardableResult
    func left(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            leftAnchor.constraint(equalTo: anchor, constant: offset),
            type: .left
        )
        return self
    }
    
    @discardableResult
    func left(to view: UIView, offset: CGFloat = 0) -> Self {
        left(to: view.leftAnchor, offset: offset)
    }
    
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            leadingAnchor.constraint(equalTo: anchor, constant: offset),
            type: .leading
        )
        return self
    }
    
    @discardableResult
    func leading(to view: UIView, offset: CGFloat = 0) -> Self {
        leading(to: view.leadingAnchor, offset: offset)
    }
    
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            bottomAnchor.constraint(equalTo: anchor, constant: -offset),
            type: .bottom
        )
        return self
    }
    
    @discardableResult
    func bottom(to view: UIView, offset: CGFloat = 0) -> Self {
        bottom(to: view.bottomAnchor, offset: offset)
    }
    
    @discardableResult
    func right(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            rightAnchor.constraint(equalTo: anchor, constant: -offset),
            type: .right
        )
        return self
    }
    
    @discardableResult
    func right(to view: UIView, offset: CGFloat = 0) -> Self {
        right(to: view.rightAnchor, offset: offset)
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            trailingAnchor.constraint(equalTo: anchor, constant: -offset),
            type: .trailing
        )
        return self
    }
    
    @discardableResult
    func trailing(to view: UIView, offset: CGFloat = 0) -> Self {
        trailing(to: view.trailingAnchor, offset: offset)
    }
    
    @discardableResult
    func width(_ value: CGFloat) -> Self {
        addConstraint(
            widthAnchor.constraint(equalToConstant: value),
            type: .width
        )
        return self
    }
    
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        addConstraint(
            widthAnchor.constraint(equalTo: anchor, multiplier: multiplier),
            type: .width
        )
        return self
    }
    
    @discardableResult
    func width(to view: UIView, multiplier: CGFloat = 1) -> Self {
        addConstraint(
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier),
            type: .width
        )
        return self
    }
    
    @discardableResult
    func height(_ value: CGFloat) -> Self {
        addConstraint(
            heightAnchor.constraint(equalToConstant: value),
            type: .height
        )
        return self
    }
    
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        addConstraint(
            heightAnchor.constraint(equalTo: anchor, multiplier: multiplier),
            type: .height
        )
        return self
    }
    
    @discardableResult
    func height(to view: UIView, multiplier: CGFloat = 1) -> Self {
        addConstraint(
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier),
            type: .height
        )
        return self
    }
    
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            centerXAnchor.constraint(equalTo: anchor, constant: offset),
            type: .centerX
        )
        return self
    }
    
    @discardableResult
    func centerX(to view: UIView, offset: CGFloat = 0) -> Self {
        centerX(to: view.centerXAnchor, offset: offset)
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        addConstraint(
            centerYAnchor.constraint(equalTo: anchor, constant: offset),
            type: .centerY
        )
        return self
    }
    
    @discardableResult
    func centerY(to view: UIView, offset: CGFloat = 0) -> Self {
        centerY(to: view.centerYAnchor, offset: offset)
    }
    
    @discardableResult
    func center(to view: UIView) -> Self {
        centerY(to: view.centerYAnchor, offset: 0)
        centerX(to: view.centerXAnchor, offset: 0)
        return self
    }
}

private enum ConstraintType: String, CaseIterable {
    case left, right, top, bottom
    case leading, trailing
    case centerX, centerY
    case width, height
    case minWidth, maxWidth
    case minHeight, maxHeight
    init?(rawValue: String) {
        switch rawValue {
        case "left": self = .left
        case "right": self = .right
        default: return nil
        }
    }
}

extension UIView {
    private struct ConstraintHolder {
        var constraints: [ConstraintType: NSLayoutConstraint] = [:]
    }
    
    private static var constraintHolderKey: Void?
    
    private var constraintHolder: ConstraintHolder {
        get {
            if let holder = objc_getAssociatedObject(self, &Self.constraintHolderKey) as? ConstraintHolder {
                return holder
            }
            let holder = ConstraintHolder()
            objc_setAssociatedObject(self, &Self.constraintHolderKey, holder, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return holder
        }
        set {
            objc_setAssociatedObject(self, &Self.constraintHolderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func addConstraint(_ constraint: NSLayoutConstraint, type: ConstraintType) {
        translatesAutoresizingMaskIntoConstraints = false
        UIView.onceSwizzled()
        removeConstraint(type: type)
        var holder = constraintHolder
        if let _ = superview {
            constraint.isActive = true
            holder.constraints[type] = constraint
        }else {
            constraint.isActive = false
            holder.constraints[type] = constraint
        }
        constraintHolder = holder
    }
    
    private func removeConstraint(type: ConstraintType) {
        var holder = constraintHolder
        if let constraint = holder.constraints[type] {
            constraint.isActive = false
            holder.constraints.removeValue(forKey: type)
        }
        constraintHolder = holder
    }
    
    private func safeActivateConstraints() {
        guard superview != nil else { return }
        constraintHolder.constraints.forEach {
            $0.value.isActive = true
        }
                
    }
    
    static func layoutOnce() {
        guard self == UIView.self else { return }
        let originalSelector = #selector(didMoveToSuperview)
            let swizzledSelector = #selector(swizzled_didMoveToSuperview)
        UIView.swizzleMethod(clas: UIView.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
    
    @objc private func swizzled_didMoveToSuperview() {
        swizzled_didMoveToSuperview()
        safeActivateConstraints()
    }
    
    private func handleDimensionConstraints(
        value: CGFloat?,
        minValue: CGFloat?,
        maxValue: CGFloat?,
        dimension: NSLayoutDimension,
        types: (equal: ConstraintType, min: ConstraintType, max: ConstraintType)) {
        if value != nil { removeConstraint(type: types.equal) }
        if minValue != nil { removeConstraint(type: types.min) }
        if maxValue != nil { removeConstraint(type: types.max) }
        
        if let value = value {
            addConstraint(
                dimension.constraint(equalToConstant: value),
                type: types.equal
            )
        }
        
        if let minValue = minValue {
            addConstraint(
                dimension.constraint(greaterThanOrEqualToConstant: minValue),
                type: types.min
            )
        }
        
        if let maxValue = maxValue {
            addConstraint(
                dimension.constraint(lessThanOrEqualToConstant: maxValue),
                type: types.max
            )
        }
    }
}

// MARK: - Animation
@discardableResult
func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    _ body: () throws -> Result
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: nil)
}

func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    _ body: () throws -> Result,
    completion: ((Bool) -> Void)? = nil
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: completion)
}

func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    completion: ((Bool) -> Void)? = nil,
    _ body: () throws -> Result
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: completion)
}

@discardableResult
private func withAnimation<Result>(
    animation: UIKitAnimation = .default,
    body: () throws -> Result,
    completion: ((Bool) -> Void)? = nil) rethrows -> Result {
    let result = try body()
    if animation.refreshAllViews {
        // 提交隐式动画
        UIView.animate(
            withDuration: animation.duration,
            delay: animation.delayInterval,
            options: animation.options,
            animations: {
                // 刷新所有需要动画的视图
                UIApplication.shared.windows.forEach {
                    $0.layoutIfNeeded()
                }
            },
            completion: completion
        )
    }
    return result
}

// MARK: - Gesture
public extension UIView {
    
    @discardableResult
    func onGesture(_ type: GestureType, action: @escaping () -> Void) -> Self {
        onGesture(type) { _ in
            action()
        }
        return self
    }
    
    @discardableResult
    func onGesture<T: UIGestureRecognizer>(_ type: GestureType, action: @escaping (T) -> Void) -> Self {
        isUserInteractionEnabled = true
        gestureRecognizers?.forEach({ gesture in
            if gesture.gestureType == type {
                removeGestureRecognizer(gesture)
            }
        })
        let (gesture, closure, key) = createGestureRecognizer(for: type, action: action)
        handleGestureDependencies(for: type, gesture: gesture)
        if let key = key {
            objc_setAssociatedObject(
                self,
                key,
                closure,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
        addGestureRecognizer(gesture)
        return self
    }
    
    enum GestureType: Equatable {
        case tap
        case doubleTap
        case longPress(minimumDuration: TimeInterval = 0.5)
        case pan
        case swipe(direction: UISwipeGestureRecognizer.Direction = .right)
        case pinch
        case rotation
        
        public static func == (lhs: GestureType, rhs: GestureType) -> Bool {
            switch (lhs, rhs) {
            case (.tap, .tap):
                return true
            case (.doubleTap, .doubleTap):
                return true
            case let (.longPress(leftDuration), .longPress(rightDuration)):
                return leftDuration == rightDuration
            case (.pan, .pan):
                return true
            case let (.swipe(leftDirection), .swipe(rightDirection)):
                return leftDirection == rightDirection
            case (.pinch, .pinch):
                return true
            case (.rotation, .rotation):
                return true
            default:
                return false
            }
        }
        
        var longPressValue: TimeInterval {
            switch self {
            case .longPress(let minimumDuration):
                return minimumDuration
            default: return 0
            }
        }
        
        var swipeValue: UISwipeGestureRecognizer.Direction {
            switch self {
            case .swipe(let direction):
                return direction
            default:
                return .right
            }
        }
    }
}

