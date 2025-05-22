//
//  UIView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/25.
//
#if canImport(UIKit)
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
private let defaultPadding: CGFloat = 16
public extension UIView {
    
    @discardableResult
    func padding(_ margin: CGFloat? = nil) -> Self {
        padding(.all, margin ?? defaultPadding)
        return self
    }
    
    @discardableResult
    func padding(_ edge: EdgeSet = .all, _ length: CGFloat? = nil) -> Self {
        let margin = length ?? defaultPadding
        let insets = UIEdgeInsets(
            top: edge.contains(.top) ? margin : layoutMargins.top,
            left: edge.contains(.left) ? margin : layoutMargins.left,
            bottom: edge.contains(.bottom) ? margin : layoutMargins.bottom,
            right: edge.contains(.right) ? margin : layoutMargins.right
        )
        padding(insets)
        return self
    }
    
    @objc
    @discardableResult
    func padding(_ edge: UIEdgeInsets) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        layoutMargins = edge
        return self
    }
    
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
    func backgroundView(_ view: @escaping () -> UIView?) -> Self {
        subviews.forEach({ if $0.tag == backgroundViewTag { $0.removeFromSuperview() } })
        if let subview = view() {
            subview.isUserInteractionEnabled = false
            subview.tag = backgroundViewTag
            insertSubview(subview, at: 0)
            subview.fillSuper()
        }
        return self
    }
    
    @discardableResult
    func background(@ViewBuilder content: () -> [UIView]) -> Self {
        subviews.forEach({ if $0.tag == backgroundViewTag { $0.removeFromSuperview() } })
        let subviews = content()
        subviews.forEach { sub in
            sub.isUserInteractionEnabled = false
            sub.tag = backgroundViewTag
            insertSubview(sub, at: 0)
            sub.fillSuper()
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
    
    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}

public final class ZStackView: UIView {
    public convenience init(@ViewBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        let views = content()
        setCanActiveLayout(false, forViews: views)
        views.forEach {
            addSubview($0)
        }
        setCanActiveLayout(true, forViews: views)
        views.forEach({ $0.safeActivateConstraints() })
        views.forEach { view in
            applyAlignmentConstraints(for: view)
        }
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

// MARK: - Layout
public extension UIView {
    
    @discardableResult
    func fillSuper(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: false, offset: edge.left)
        rightToSuper(isMargins: false, offset: edge.right)
        topToSuper(isMargins: false, offset: edge.top)
        bottomToSuper(isMargins: false, offset: edge.bottom)
        return self
    }
    
    @discardableResult
    func fillSuperMargins(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: true, offset: edge.left)
        rightToSuper(isMargins: true, offset: edge.right)
        topToSuper(isMargins: true, offset: edge.top)
        bottomToSuper(isMargins: true, offset: edge.bottom)
        return self
    }
    
    @discardableResult
    func fill(toMargins view: UIView, edge: UIEdgeInsets = .zero) -> Self {
        fill(to: view, isMargins: true, edge: edge)
        return self
    }
    
    @discardableResult
    func fill(to view: UIView, isMargins: Bool = false, edge: UIEdgeInsets = .zero) -> Self {
        leading(to: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: edge.left)
        trailing(to: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: edge.right)
        top(to: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: edge.top)
        bottom(to: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: edge.bottom)
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
    func centerToSuper() -> Self {
        if let superview = superview {
            addNewConstraint(
                centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0),
                type: .centerY
            )
            addNewConstraint(
                centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0),
                type: .centerX
            )
        } else {
            let configX = ConstraintConfig(type: .centerX, targetType: .super, offset: 0)
            let configY = ConstraintConfig(type: .centerY, targetType: .super, offset: 0)
            var holder = constraintHolder
            holder.pendingConstraints[.centerX] = configX
            holder.pendingConstraints[.centerY] = configY
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func center(to view: UIView) -> Self {
        if view == superview {
            addNewConstraint(
                centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                type: .centerY
            )
            addNewConstraint(
                centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                type: .centerX
            )
        }else {
            let configX = ConstraintConfig(type: .centerX, targetType: .other, offset: 0, XAxisAnchor: view.centerXAnchor)
            let configY = ConstraintConfig(type: .centerY, targetType: .other, offset: 0, YAxisAnchor: view.centerYAnchor)
            var holder = constraintHolder
            holder.pendingConstraints[.centerX] = configX
            holder.pendingConstraints[.centerY] = configY
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func topToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                topAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: offset),
                type: .top
            )
        } else {
            let config = ConstraintConfig(type: .top, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.top] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func top(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(to: view.layoutMarginsGuide.topAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func top(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(greaterThanOrEqualTo: view.layoutMarginsGuide.topAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func top(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, relation:.greaterThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func top(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(lessThanOrEqualTo: view.layoutMarginsGuide.topAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func top(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, relation:.lessThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func leftToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                leftAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            let config = ConstraintConfig(type: .left, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.left] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func left(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func left(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(to: view.layoutMarginsGuide.leftAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func left(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(greaterThanOrEqualTo: view.layoutMarginsGuide.leftAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func left(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func left(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(lessThanOrEqualTo: view.layoutMarginsGuide.leftAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func left(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func leadingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                leadingAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: offset),
                type: .leading
            )
        } else {
            let config = ConstraintConfig(type: .leading, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.leading] = config
            constraintHolder = holder
        }
        return self
    }
        
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func leading(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(to: view.layoutMarginsGuide.leadingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func leading(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func leading(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func leading(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(lessThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func leading(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func bottomToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                bottomAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: offset),
                type: .bottom
            )
        } else {
            let config = ConstraintConfig(type: .bottom, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.bottom] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.bottom] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func bottom(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottom(to: view.layoutMarginsGuide.bottomAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func bottom(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottom(greaterThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .greaterThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func bottom(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottom(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func bottom(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .lessThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func rightToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                rightAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: offset),
                type: .right
                )
        } else {
            let config = ConstraintConfig(type: .right, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.right] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func right(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func right(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: offset),
                type: .right
            )
        }else {
            right(to: view.layoutMarginsGuide.rightAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func right(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.rightAnchor, constant: offset),
                type: .right
            )
        }else {
            right(greaterThanOrEqualTo: view.layoutMarginsGuide.rightAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func right(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func right(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.rightAnchor, constant: offset),
                type: .right
            )
        }else {
            right(lessThanOrEqualTo: view.layoutMarginsGuide.rightAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func right(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func trailingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                trailingAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: offset),
                type: .trailing
            )
        } else {
            let config = ConstraintConfig(type: .trailing, targetType: .super, offset: offset, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.trailing] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func trailing(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: offset),
                type: .trailing
            )
        }else {
            trailing(to: view.layoutMarginsGuide.trailingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func trailing(greaterThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor, constant: offset),
                type: .trailing
            )
        }else {
            trailing(greaterThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func trailing(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func trailing(lessThanOrEqualTo view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor, constant: offset),
                type: .trailing
            )
        }else {
            trailing(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func trailing(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func widthToSuper(multiplier: CGFloat = 1) -> Self {
        if let superview = superview {
            addNewConstraint(
                widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: multiplier),
                type: .widthToSuper
            )
        } else {
            let config = ConstraintConfig(type: .widthToSuper, targetType: .super, offset: 0, multiplier: multiplier)
            var holder = constraintHolder
            holder.pendingConstraints[.widthToSuper] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func width(_ value: CGFloat) -> Self {
        addNewConstraint(
            widthAnchor.constraint(equalToConstant: value),
            type: .width
        )
        return self
    }
    
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .width, targetType: .other, offset: 0, multiplier: multiplier, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.width] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func width(to view: UIView, multiplier: CGFloat = 1) -> Self {
        if view == superview {
            addNewConstraint(
                widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier),
                type: .width
            )
        }else {
            width(to: view.layoutMarginsGuide.widthAnchor, multiplier: multiplier)
        }
        return self
    }
    
    @discardableResult
    func heightToSuper(multiplier: CGFloat = 1) -> Self {
        if let superview = superview {
            addNewConstraint(
                heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: multiplier),
                type: .heightToSuper
            )
        } else {
            let config = ConstraintConfig(type: .heightToSuper, targetType: .super, offset: 0, multiplier: multiplier)
            var holder = constraintHolder
            holder.pendingConstraints[.heightToSuper] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func height(_ value: CGFloat) -> Self {
        addNewConstraint(
            heightAnchor.constraint(equalToConstant: value),
            type: .height
        )
        return self
    }
    
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .height, targetType: .other, offset: 0, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.height] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func height(to view: UIView, multiplier: CGFloat = 1) -> Self {
        if view == superview {
            addNewConstraint(
                heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier),
                type: .height
            )
        }else {
            height(to: view.layoutMarginsGuide.heightAnchor, multiplier: multiplier)
        }
        return self
    }
    
    @discardableResult
    func centerXToSuper(offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset),
                type: .centerX
            )
        } else {
            let config = ConstraintConfig(type: .centerX, targetType: .super, offset: offset)
            var holder = constraintHolder
            holder.pendingConstraints[.centerX] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .centerX, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerX] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func centerX(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset),
                type: .centerX
            )
        }else {
            centerX(to: view.layoutMarginsGuide.centerXAnchor, offset: offset)
        }
        return self
    }
    
    @discardableResult
    func centerYToSuper(offset: CGFloat = 0) -> Self {
        if let superview = superview {
            addNewConstraint(
                centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset),
                type: .centerY
            )
        } else {
            let config = ConstraintConfig(type: .centerY, targetType: .super, offset: offset)
            var holder = constraintHolder
            holder.pendingConstraints[.centerY] = config
            constraintHolder = holder
        }
        return self
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let config = ConstraintConfig(type: .centerY, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerY] = config
        constraintHolder = holder
        return self
    }
    
    @discardableResult
    func centerY(to view: UIView, offset: CGFloat = 0) -> Self {
        if view == superview {
            addNewConstraint(
                centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset),
                type: .centerY
            )
        }else {
            centerY(to: view.layoutMarginsGuide.centerYAnchor, offset: offset)
        }
        return self
    }
}

enum ConstraintType: String, CaseIterable {
    case greaterThanOrEqualTo,lessThanOrEqualTo
    case left, right, top, bottom
    case leading, trailing
    case centerX, centerY
    case width, height
    case widthToSuper, heightToSuper
    case minWidth, maxWidth
    case minHeight, maxHeight
    case marginsLeft, marginsRight, marginsTop, marginsBottom, marginsCenterX, marginsCenterY
    init?(rawValue: String) {
        switch rawValue {
        case "left": self = .left
        case "right": self = .right
        default: return nil
        }
    }
    
    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .left:
            return .left
        case .leading:
            return .leading
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .right:
            return .right
        case .trailing:
            return .trailing
        case .widthToSuper:
            return .width
        case .heightToSuper:
            return .height
        case .centerX:
            return .centerX
        case .centerY:
            return .centerY
        default:
            return .notAnAttribute
        }
    }
}

enum ConstraintTargetType {
    case `super`
    case other
}

struct ConstraintConfig {
    let type: ConstraintType
    let targetType: ConstraintTargetType
    let offset: CGFloat
    let multiplier: CGFloat
    let relation: NSLayoutConstraint.Relation
    let XAxisAnchor: NSLayoutXAxisAnchor?
    let YAxisAnchor: NSLayoutYAxisAnchor?
    let Dimension: NSLayoutDimension?
    let isMargins: Bool
    
    init(type: ConstraintType, targetType: ConstraintTargetType, offset: CGFloat, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal, XAxisAnchor: NSLayoutXAxisAnchor? = nil, YAxisAnchor: NSLayoutYAxisAnchor? = nil, Dimension: NSLayoutDimension? = nil, isMargins: Bool = false) {
        self.type = type
        self.targetType = targetType
        self.offset = offset
        self.multiplier = multiplier
        self.relation = relation
        self.XAxisAnchor = XAxisAnchor
        self.YAxisAnchor = YAxisAnchor
        self.Dimension = Dimension
        self.isMargins = isMargins
    }
    
}

private extension ConstraintType {
    static func from(attribute: NSLayoutConstraint.Attribute) -> ConstraintType? {
        switch attribute {
        case .left: return .left
        case .right: return .right
        case .top: return .top
        case .bottom: return .bottom
        case .leading: return .leading
        case .trailing: return .trailing
        case .centerY: return .centerY
        case .centerX: return .centerX
        case .width: return .widthToSuper
        case .height: return .heightToSuper
        default: return nil
        }
    }
}

extension UIView {
    static func layoutOnce() {
        guard self == UIView.self else { return }
        let originalSelector = #selector(didMoveToSuperview)
            let swizzledSelector = #selector(swizzled_didMoveToSuperview)
        UIView.swizzleMethod(clas: UIView.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
        
        let originalSelector1 = #selector(didAddSubview(_:))
        let swizzledSelector1 = #selector(swizzled_didAddSubview(_:))
        UIView.swizzleMethod(clas: UIView.self, originalSelector: originalSelector1, swizzledSelector: swizzledSelector1)
        
        let originalSelector2 = #selector(layoutSubviews)
        let swizzledSelector2 = #selector(swizzled_viewLayoutSubviews)
        UIView.swizzleMethod(clas: UIView.self, originalSelector: originalSelector2, swizzledSelector: swizzledSelector2)
    }
}

extension UIView {
    struct ConstraintHolder {
        var constraints: [ConstraintType: NSLayoutConstraint] = [:]
        var pendingConstraints: [ConstraintType: ConstraintConfig] = [:]
    }
    
    private static var constraintHolderKey: Void?
    private static var constraintCanActiveKey: Void?
    
    var canActiveLayout: Bool {
        get {
            if let active = objc_getAssociatedObject(self, &Self.constraintCanActiveKey) as? Bool {
                return active
            }
            objc_setAssociatedObject(self, &Self.constraintCanActiveKey, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return true
        }
        set {
            objc_setAssociatedObject(self, &Self.constraintCanActiveKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var constraintHolder: ConstraintHolder {
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
    
    
    func addNewConstraint(_ constraint: NSLayoutConstraint, type: ConstraintType) {
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
    
    func removeConstraint(type: ConstraintType) {
        var holder = constraintHolder
        if let constraint = holder.constraints[type] {
            constraint.isActive = false
            holder.constraints.removeValue(forKey: type)
        }
        constraintHolder = holder
    }
    
    func safeActivateConstraints() {
        if !canActiveLayout {
            return
        }
        guard let superview = superview else { return }
        for (_, config) in constraintHolder.pendingConstraints {
            switch config.type {
            case .left:
                if config.targetType == .super {
                    addNewConstraint(
                        leftAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: config.offset),
                        type: .left
                    )
                }else if let anchor = config.XAxisAnchor {
                    addNewConstraint(
                        leftAnchor.constraint(equalTo: anchor, constant: config.offset),
                        type: .left
                    )
                }
            case .right:
                if config.targetType == .super {
                    addNewConstraint(
                        rightAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -config.offset),
                        type: .right
                    )
                }else if let anchor = config.XAxisAnchor {
                    addNewConstraint(
                        rightAnchor.constraint(equalTo: anchor, constant: -config.offset),
                        type: .right
                    )
                }
            case .top:
                if config.targetType == .super {
                    addNewConstraint(
                        topAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: config.offset),
                        type: .top
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        topAnchor.constraint(equalTo: anchor, constant: config.offset),
                        type: .top
                    )
                }
            case .bottom:
                if config.targetType == .super {
                    addNewConstraint(
                        bottomAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: -config.offset),
                        type: .bottom
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        bottomAnchor.constraint(equalTo: anchor, constant: -config.offset),
                        type: .bottom
                    )
                }
            case .leading:
                if config.targetType == .super {
                    addNewConstraint(
                        leadingAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: config.offset),
                        type: .leading
                    )
                }else if let anchor = config.XAxisAnchor {
                    addNewConstraint(
                        leadingAnchor.constraint(equalTo: anchor, constant: config.offset),
                        type: .leading
                    )
                }
            case .trailing:
                if config.targetType == .super {
                    addNewConstraint(
                        trailingAnchor.constraint(equalTo: config.isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -config.offset),
                        type: .trailing
                    )
                }else if let anchor = config.XAxisAnchor {
                    addNewConstraint(
                        trailingAnchor.constraint(equalTo: anchor, constant: -config.offset),
                        type: .trailing
                    )
                }
            case .widthToSuper:
                if config.targetType == .super {
                    addNewConstraint(
                        widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: config.multiplier),
                        type: .widthToSuper
                    )
                }else if let dimension = config.Dimension {
                    addNewConstraint(
                        widthAnchor.constraint(equalTo: dimension, multiplier: config.multiplier),
                        type: .widthToSuper
                    )
                }
            case .heightToSuper:
                if config.targetType == .super {
                    addNewConstraint(
                        heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: config.multiplier),
                        type: .heightToSuper
                    )
                }else if let dimension = config.Dimension {
                    addNewConstraint(
                        heightAnchor.constraint(equalTo: dimension, multiplier: config.multiplier),
                        type: .heightToSuper
                    )
                }
            case .width:
                if let dimension = config.Dimension {
                    addNewConstraint(
                        widthAnchor.constraint(equalTo: dimension, multiplier: config.multiplier),
                        type: .width
                    )
                }
            case .height:
                if let dimension = config.Dimension {
                    addNewConstraint(
                        heightAnchor.constraint(equalTo: dimension, multiplier: config.multiplier),
                        type: .height
                    )
                }
            case .centerX:
                if config.targetType == .super {
                    addNewConstraint(
                        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: config.offset),
                        type: .centerX
                    )
                }else if let anchor = config.XAxisAnchor {
                    addNewConstraint(
                        centerXAnchor.constraint(equalTo: anchor, constant: config.offset),
                        type: .centerX
                    )
                }
            case .centerY:
                if config.targetType == .super {
                    addNewConstraint(
                        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: config.offset),
                        type: .centerY
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        centerYAnchor.constraint(equalTo: anchor, constant: config.offset),
                        type: .centerY
                    )
                }
            default:
                break
            }
        }
        
        var holder = constraintHolder
        holder.pendingConstraints = [:]
        constraintHolder = holder
        
        constraintHolder.constraints.forEach { (type, constraint) in
            constraint.isActive = true
        }
    }
    
    @objc private func swizzled_didAddSubview(_ view: UIView) {
        swizzled_didAddSubview(view)
        subviews.forEach { subview in
            view.safeActivateConstraints()
        }
    }
    
    @objc private func swizzled_didMoveToSuperview() {
        swizzled_didMoveToSuperview()
        if canActiveLayout {
            safeActivateConstraints()
        }
    }
    
    @objc func swizzled_viewLayoutSubviews() {
        swizzled_viewLayoutSubviews()
        if canActiveLayout {
            safeActivateConstraints()
        }
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
            addNewConstraint(
                dimension.constraint(equalToConstant: value),
                type: types.equal
            )
        }
        
        if let minValue = minValue {
            addNewConstraint(
                dimension.constraint(greaterThanOrEqualToConstant: minValue),
                type: types.min
            )
        }
        
        if let maxValue = maxValue {
            addNewConstraint(
                dimension.constraint(lessThanOrEqualToConstant: maxValue),
                type: types.max
            )
        }
    }
}

// MARK: - Animation
@MainActor
@discardableResult
public func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    _ body: () throws -> Result
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: nil)
}
@MainActor
@discardableResult
public func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    _ body: () throws -> Result,
    completion: ((Bool) -> Void)? = nil
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: completion)
}
@MainActor
@discardableResult
public func withAnimation<Result>(
    _ animation: UIKitAnimation = .default,
    completion: ((Bool) -> Void)? = nil,
    _ body: () throws -> Result
) rethrows -> Result {
    return try withAnimation(animation: animation, body: body, completion: completion)
}

@MainActor @discardableResult
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

#endif
