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
    /// SwiftlyUI extension for `UIView`.
    var height: CGFloat {
        get { return frame.size.height }
        set { frame.size.height = newValue }
    }
    /// SwiftlyUI extension for `UIView`.
    var width: CGFloat {
        get { return frame.size.width }
        set { frame.size.width = newValue }
    }
    /// SwiftlyUI extension for `UIView`.
    var x: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    /// SwiftlyUI extension for `UIView`.
    var y: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    /// SwiftlyUI extension for `UIView`.
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    /// SwiftlyUI extension for `UIView`.
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
}

private let backgroundViewTag: Int = 98367682
private let defaultPadding: CGFloat = 16
public extension UIView {
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func padding(_ margin: CGFloat? = nil) -> Self {
        padding(.all, margin ?? defaultPadding)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func padding(_ edge: EdgeSet = .all, _ length: CGFloat? = nil) -> Self {
        layoutMargins(edge, length)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func padding(_ edge: UIEdgeInsets) -> Self {
        return layoutMargins(edge)
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func layoutMargins(_ margin: CGFloat? = nil) -> Self {
        return layoutMargins(.all, margin ?? defaultPadding)
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    @objc func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        layoutMargins = edge
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func layoutMargins(_ edge: EdgeSet = .all, _ length: CGFloat? = nil) -> Self {
        let margin = length ?? defaultPadding
        let insets = UIEdgeInsets(
            top: edge.contains(.top) ? margin : layoutMargins.top,
            left: edge.contains(.left) ? margin : layoutMargins.left,
            bottom: edge.contains(.bottom) ? margin : layoutMargins.bottom,
            right: edge.contains(.right) ? margin : layoutMargins.right
        )
        return layoutMargins(insets)
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func border(_ color: UIColor, _ width: CGFloat = 1) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        self.layer.borderColor = color.cgColor
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        self.layer.borderWidth = width
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func clipsToBounds(_ isEnabled: Bool = true) -> Self {
        self.clipsToBounds = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func opaque(_ isEnabled: Bool = true) -> Self {
        self.isOpaque = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func clearsContextBeforeDrawing(_ isEnabled: Bool = true) -> Self {
        self.clearsContextBeforeDrawing = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func mask(_ mask: UIView) -> Self {
        self.mask = mask
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func tintAdjustmentMode(_ mode: UIView.TintAdjustmentMode) -> Self {
        self.tintAdjustmentMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func radius(_ radius: CGFloat, corners: UIRectCorner = .allCorners) -> Self {
        if corners == .allCorners {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }else {
            roundCorners(radius, corners: corners)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func layerCornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func masksToBounds(_ isEnabled: Bool = true) -> Self {
        self.layer.masksToBounds = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func roundCorners(_ radius: CGFloat, corners: UIRectCorner) -> Self {
        if self.bounds == .zero {
            cornerInfo = CornerInfo(radius: radius, corners: corners)
            return self
        }
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
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
    
    /// SwiftlyUI extension for `UIView`.
    /// 在View的底部 插入View
    @discardableResult
    func background(@SwiftlyUIBuilder content: () -> [UIView]) -> Self {
        let subviews = content()
        subviews.forEach { sub in
            insertSubview(sub, at: 0)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    /// 在View的顶部 覆盖View
    @discardableResult
    func overlay(@SwiftlyUIBuilder content: () -> [UIView]) -> Self {
        let subviews = content()
        subviews.forEach { sub in
            addSubview(sub)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
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
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func opacity(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func hidden(_ isHidden: Bool = true) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func userInteractionEnabled(_ isEnabled : Bool = true) -> Self {
        self.isUserInteractionEnabled = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func semanticContentAttribute(_ attribute: UISemanticContentAttribute) -> Self {
        self.semanticContentAttribute = attribute
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func scaleEffect(_ scale: CGFloat, anchor: UnitPoint = .center) -> Self {
        if anchor != .center {
            let scaleParameters = ScaleParameters(scale: scale, anchor: anchor)
            applyScaleEffect(scaleParameters)
        }else {
            self.transform(CGAffineTransform(scaleX: scale, y: scale))
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func transform3D(_ transform: CATransform3D) -> Self {
        self.transform3D = transform
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func contentScaleFactor(_ scale: CGFloat) -> Self {
        self.contentScaleFactor = scale
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func multipleTouchEnabled(_ isEnabled: Bool = true) -> Self {
        self.isMultipleTouchEnabled = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func exclusiveTouch(_ isExclusive: Bool = true) -> Self {
        self.isExclusiveTouch = isExclusive
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func autoresizesSubviews(_ isEnabled: Bool = true) -> Self {
        self.autoresizesSubviews = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func autoresizingMask(_ mask: UIView.AutoresizingMask) -> Self {
        self.autoresizingMask = mask
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func gestureRecognizers(_ recognizers: [UIGestureRecognizer]?) -> Self {
        self.gestureRecognizers = recognizers
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func motionEffects(_ effects: [UIMotionEffect]) -> Self {
        self.motionEffects = effects
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ isEnabled: Bool = false) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = isEnabled
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func restorationIdentifier(_ identifier: String?) -> Self {
        self.restorationIdentifier = identifier
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @discardableResult
    func overrideUserInterfaceStyle(_ style: UIUserInterfaceStyle) -> Self {
        self.overrideUserInterfaceStyle = style
        return self
    }
#if compiler(>=5.7)
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 16.0, *)
    @discardableResult
    func anchorPoint(_ point: CGPoint) -> Self {
        self.anchorPoint = point
        return self
    }
#endif
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 15.0, *)
    @discardableResult
    func minimumContentSizeCategory(_ category: UIContentSizeCategory?) -> Self {
        self.minimumContentSizeCategory = category
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 15.0, *)
    @discardableResult
    func maximumContentSizeCategory(_ category: UIContentSizeCategory?) -> Self {
        self.maximumContentSizeCategory = category
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 15, *)
    @discardableResult
    func focusGroupPriority(_ priority: UIFocusGroupPriority) -> Self {
        self.focusGroupPriority = priority
        return self
    }
    
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 15, *)
    @discardableResult
    func focusEffect(_ effect: UIFocusEffect?) -> Self {
        self.focusEffect = effect
        return self
    }
#endif
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UIView`.
    @available(iOS 14, *)
    @discardableResult
    func focusGroupIdentifier(_ identifier: String?) -> Self {
        self.focusGroupIdentifier = identifier
        return self
    }
#endif
}
/// SwiftlyUI extension for `UIView`.
public final class ZStackView: UIView {
    /// SwiftlyUI extension for `UIView`.
    public convenience init(@SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        let views = content()
        setCanActiveLayout(false, forViews: views)
        views.forEach {
            addSubview($0)
        }
        setCanActiveLayout(true, forViews: views)
        views.forEach({ $0.interiorActivateAllConstraints() })
        views.forEach { view in
            applyAlignmentConstraints(for: view)
        }
    }
    
}

// MARK: - Layout
public extension UIView {
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var left: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .left) {
            types.remove(at: index)
        }
        if let index = types.firstIndex(of: .leading) {
            types.remove(at: index)
        }
        types.append(.left)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var right: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .right) {
            types.remove(at: index)
        }
        if let index = types.firstIndex(of: .trailing) {
            types.remove(at: index)
        }
        types.append(.right)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var leading: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .leading) {
            types.remove(at: index)
        }
        if let index = types.firstIndex(of: .left) {
            types.remove(at: index)
        }
        types.append(.leading)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var trailing: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .trailing) {
            types.remove(at: index)
        }
        if let index = types.firstIndex(of: .right) {
            types.remove(at: index)
        }
        types.append(.trailing)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var top: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .top) {
            types.remove(at: index)
        }
        types.append(.top)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var bottom: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .bottom) {
            types.remove(at: index)
        }
        types.append(.bottom)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var centerX: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .centerX) {
            types.remove(at: index)
        }
        types.append(.centerX)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var centerY: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .centerY) {
            types.remove(at: index)
        }
        types.append(.centerY)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    var edges: Self {
        var types: [ConstraintType] = []
        types.append(.top)
        types.append(.bottom)
        types.append(.leading)
        types.append(.trailing)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func equalToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
            return self
        }
        constraintTypes = []
        if types.contains(.left) {
            leftToSuper(isMargins: isMargins, offset: offset)
        }else if types.contains(.leading) {
            leadingToSuper(isMargins: isMargins, offset: offset)
        }
        if types.contains(.right) {
            rightToSuper(isMargins: isMargins, offset: offset)
        }else if types.contains(.trailing) {
            trailingToSuper(isMargins: isMargins, offset: offset)
        }
        if types.contains(.top) {
            topToSuper(isMargins: isMargins, offset: offset)
        }
        if types.contains(.bottom) {
            bottomToSuper(isMargins: isMargins, offset: offset)
        }
        if types.contains(.centerX) {
            centerXToSuper(offset: offset)
        }
        if types.contains(.centerY) {
            centerYToSuper(offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func equal(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
            return self
        }
        constraintTypes = []
        if types.contains(.left) {
            left(to: view, isMargins: isMargins, offset: offset)
        }else if types.contains(.leading) {
            leading(to: view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.right) {
            right(to: view, isMargins: isMargins, offset: offset)
        }else if types.contains(.trailing) {
            trailing(to: view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.top) {
            top(to: view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.bottom) {
            bottom(to: view, isMargins: isMargins, offset: offset)
        }
        if types.contains(.centerX) {
            centerX(to: view, offset: offset)
        }
        if types.contains(.centerY) {
            centerY(to: view, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func fillSuper(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: false, offset: edge.left)
        rightToSuper(isMargins: false, offset: edge.right)
        topToSuper(isMargins: false, offset: edge.top)
        bottomToSuper(isMargins: false, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func fillSuperMargins(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: true, offset: edge.left)
        rightToSuper(isMargins: true, offset: edge.right)
        topToSuper(isMargins: true, offset: edge.top)
        bottomToSuper(isMargins: true, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func fill(toMargins view: UIView, edge: UIEdgeInsets = .zero) -> Self {
        fill(to: view, isMargins: true, edge: edge)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func fill(to view: UIView, isMargins: Bool = false, edge: UIEdgeInsets = .zero) -> Self {
        leading(to: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: edge.left)
        trailing(to: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: edge.right)
        top(to: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: edge.top)
        bottom(to: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func frame(size: CGSize) -> Self {
        handleDimensionConstraints(
            value: size.width,
            minValue: nil,
            maxValue: nil,
            dimension: widthAnchor,
            types: (.width, .minWidth, .maxWidth))
        
        handleDimensionConstraints(
            value: size.height,
            minValue: nil,
            maxValue: nil,
            dimension: heightAnchor,
            types: (.height, .minHeight, .maxHeight))
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerToSuper() -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func center(to view: UIView) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(to: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, relation:.greaterThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                topAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            top(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func top(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .top, targetType: .other, offset: offset, relation:.lessThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.top] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(to: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leftAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            left(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func left(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
        
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(to: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                leadingAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leading(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leading(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addNewConstraint(
                bottomAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: -offset),
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.bottom] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: -offset),
                type: .bottom
            )
        }else {
            bottom(to: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottom(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .greaterThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                bottomAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: -offset),
                type: .bottom
            )
        }else {
            bottom(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottom(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .lessThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addNewConstraint(
                rightAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -offset),
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            right(to: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            right(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                rightAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            right(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func right(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .right, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.right] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addNewConstraint(
                trailingAnchor.constraint(equalTo: isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -offset),
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailing(to: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailing(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addNewConstraint(
                trailingAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailing(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailing(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func width(_ value: CGFloat) -> Self {
        addNewConstraint(
            widthAnchor.constraint(equalToConstant: value),
            type: .width
        )
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func width(_ value: Int) -> Self {
        width(CGFloat(value))
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .width, targetType: .other, offset: 0, multiplier: multiplier, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.width] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func height(_ value: CGFloat) -> Self {
        addNewConstraint(
            heightAnchor.constraint(equalToConstant: value),
            type: .height
        )
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func height(_ value: Int) -> Self {
        height(CGFloat(value))
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .height, targetType: .other, offset: 0, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.height] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerXToSuper(offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .centerX, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerX] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerX(to view: UIView, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerYToSuper(offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .centerY, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerY] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func centerY(to view: UIView, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("Please use .equal() method to set constraints.")
            return self
        }
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
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// Returns the constraint for the specified type
    func constraint(_ constraintType: ConstraintType) -> NSLayoutConstraint? {
        return constraintHolder.constraints[constraintType]
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// removes the constraint for the specified type
    func removeConstraint(_ constraintType: ConstraintType) {
        if let constraint = constraintHolder.constraints[constraintType] {
            constraint.isActive = false
            constraintHolder.constraints.removeValue(forKey: constraintType)
        }
        if constraintHolder.pendingConstraints[constraintType] != nil {
            constraintHolder.pendingConstraints.removeValue(forKey: constraintType)
        }
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// Manually activate constraints
    @discardableResult
    func activeConstraints(_ activeSubViews: Bool = false) -> Self {
        interiorActivateAllConstraints()
        if activeSubViews {
            subviews.forEach { subview in
                subview.interiorActivateAllConstraints()
            }
        }
        return self
    }
}

public enum ConstraintType: String, CaseIterable {
    case greaterThanOrEqualTo,lessThanOrEqualTo
    case left, right, top, bottom
    case leading, trailing
    case centerX, centerY
    case width, height
    case widthToSuper, heightToSuper
    case minWidth, maxWidth
    case minHeight, maxHeight
    case marginsLeft, marginsRight, marginsTop, marginsBottom, marginsCenterX, marginsCenterY
    public init?(rawValue: String) {
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
    private static var pendingCornerInfoKey: Void?
    private static var constraintTypesKey: Void?
    
    var constraintTypes: [ConstraintType] {
        get {
            if let types = objc_getAssociatedObject(self, &Self.constraintTypesKey) as? [ConstraintType] {
                return types
            }
            return []
        }
        set {
            objc_setAssociatedObject(self, &Self.constraintTypesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var cornerInfo: CornerInfo? {
        get {
            if let info = objc_getAssociatedObject(self, &Self.pendingCornerInfoKey) as? CornerInfo {
                return info
            }else {
                return nil
            }
        }
        set {
            objc_setAssociatedObject(self, &Self.pendingCornerInfoKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
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
            UIView.onceSwizzled()
        }
    }
    
    
    func addNewConstraint(_ constraint: NSLayoutConstraint, type: ConstraintType) {
        translatesAutoresizingMaskIntoConstraints = false
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
    
    func interiorActivateAllConstraints() {
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
            subview.interiorActivateAllConstraints()
        }
    }
    
    @objc private func swizzled_didMoveToSuperview() {
        swizzled_didMoveToSuperview()
        if canActiveLayout {
            interiorActivateAllConstraints()
        }
    }
    
    @objc func swizzled_viewLayoutSubviews() {
        swizzled_viewLayoutSubviews()
        if canActiveLayout {
            interiorActivateAllConstraints()
        }
        if let cornerInfo = cornerInfo, bounds != .zero {
            roundCorners(cornerInfo.radius, corners: cornerInfo.corners)
            self.cornerInfo = nil
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
/// SwiftlyUI extension for `UIView`. Animation
@MainActor
public func withAnimation(
    _ animation: UIKitAnimation = .default,
    _ animations: @escaping () -> Void
) {
    withAnimation(animation: animation, animations: animations, completion: nil)
}

/// SwiftlyUI extension for `UIView`. Animation
@MainActor
public func withAnimation(
    _ animation: UIKitAnimation = .default,
    _ animations: @escaping () -> Void,
    completion: ((Bool) -> Void)? = nil
) {
    withAnimation(animation: animation, animations: animations, completion: completion)
}

/// SwiftlyUI extension for `UIView`. Animation
@MainActor
public func withAnimation(
    _ animation: UIKitAnimation = .default,
    completion: ((Bool) -> Void)? = nil,
    _ animations: @escaping () -> Void
) {
    withAnimation(animation: animation, animations: animations, completion: completion)
}

/// SwiftlyUI extension for `UIView`. Animation
@MainActor
private func withAnimation(
    animation: UIKitAnimation = .default,
    animations: @escaping () -> Void,
    completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: animation.duration,
            delay: animation.delayInterval,
            options: animation.options,
            animations: animations,
            completion: completion
        )
}

// MARK: - Gesture
public extension UIView {
    /// SwiftlyUI extension for `UIView`. Gesture
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onGesture(.tap , target: self, action: { $0.doSomething() })
    @discardableResult
    func onGesture<T: AnyObject>(_ type: GestureType, target: T, action: @escaping (T) -> Void) -> Self {
        isUserInteractionEnabled = true
        gestureRecognizers?.forEach({ gesture in
            if gesture.gestureType == type {
                removeGestureRecognizer(gesture)
                var handlers = gestureHandlers
                handlers.removeValue(forKey: type)
                gestureHandlers = handlers
            }
        })
        
        let handler = GestureSingleHandler(target: target, action: action)
        let gesture = createGestureRecognizer(for: type)
        gesture.addTarget(handler, action: #selector(GestureSingleHandler<T>.invoke))
        
        var handlers = gestureHandlers
        handlers[type] = handler
        gestureHandlers = handlers
        
        addGestureRecognizer(gesture)
        handleGestureDependencies(for: type, gesture: gesture)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Gesture
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onGesture(.tap , target: self, action: { (vc: ViewController, btn: UIGestureRecognizer) in vc.doSomething() })
    @discardableResult
    func onGesture<T: AnyObject, GestureRecognizer: UIGestureRecognizer>(_ type: GestureType, target: T, action: @escaping (T, GestureRecognizer) -> Void) -> Self {
        isUserInteractionEnabled = true
        gestureRecognizers?.forEach({ gesture in
            if gesture.gestureType == type {
                removeGestureRecognizer(gesture)
                var handlers = gestureHandlers
                handlers.removeValue(forKey: type)
                gestureHandlers = handlers
            }
        })
        
        let handler = GestureHandler(target: target, action: action)
        let gesture = createGestureRecognizer(for: type)
        gesture.addTarget(handler, action: #selector(GestureHandler<T, GestureRecognizer>.invoke(_:)))
        
        var handlers = gestureHandlers
        handlers[type] = handler
        gestureHandlers = handlers
        
        addGestureRecognizer(gesture)
        handleGestureDependencies(for: type, gesture: gesture)
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Gesture
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onGesture(.tap, action: {[weak self] in self?.doSomething() })
    @discardableResult
    func onGesture(_ type: GestureType, action: @escaping (UIGestureRecognizer) -> Void) -> Self {
        isUserInteractionEnabled = true
        gestureRecognizers?.forEach({ gesture in
            if gesture.gestureType == type {
                removeGestureRecognizer(gesture)
                var handlers = gestureHandlers
                handlers.removeValue(forKey: type)
                gestureHandlers = handlers
            }
        })
        
        let handler = GestureClosureWrapper<UIGestureRecognizer>(gesture: createGestureRecognizer(for: type), closure: action)
        handler.gesture.addTarget(handler, action: #selector(GestureClosureWrapper<UIGestureRecognizer>.invoke))
        
        var handlers = gestureHandlers
        handlers[type] = handler
        gestureHandlers = handlers
        
        addGestureRecognizer(handler.gesture)
        handleGestureDependencies(for: type, gesture: handler.gesture)
        return self
    }
    
    
    /// SwiftlyUI extension for `UIView`. Gesture
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    /// .onGesture(.tap, action: {[weak self] in self?.doSomething() })
    @discardableResult
    func onGesture(_ type: GestureType, action: @escaping () -> Void) -> Self {
        return onGesture(type) { _ in
            action()
        }
    }
    
    /// SwiftlyUI extension for `UIView`. Gesture
    @discardableResult
    func onGesture<T>(_ type: GestureType, target: T, action: Selector) -> Self {
        isUserInteractionEnabled = true
        gestureRecognizers?.forEach({ gesture in
            if gesture.gestureType == type {
                removeGestureRecognizer(gesture)
                var handlers = gestureHandlers
                handlers.removeValue(forKey: type)
                gestureHandlers = handlers
            }
        })
        let gesture = createGestureRecognizer(for: type)
        gesture.addTarget(target, action: action)
        addGestureRecognizer(gesture)
        handleGestureDependencies(for: type, gesture: gesture)
        return self
    }
    
    /// SwiftlyUI - get gesture by type
    /// SwiftlyUI - 获取指定类型的手势识别器
    func getGesture(for type: GestureType) -> UIGestureRecognizer? {
        return gestureRecognizers?.first(where: { $0.gestureType == type })
    }
    
    /// SwiftlyUI extension for `UIView`. Gesture
    enum GestureType: Equatable, Hashable {
        case tap
        case doubleTap
        case longPress(minimumDuration: TimeInterval = 0.5)
        case pan
        case swipe(direction: UISwipeGestureRecognizer.Direction = .right, numberOfTouchesRequired: Int = 1)
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
            case let (.swipe(leftDirection, leftNumberOfTouchesRequired), .swipe(rightDirection, rightNumberOfTouchesRequired)):
                return leftDirection == rightDirection && leftNumberOfTouchesRequired == rightNumberOfTouchesRequired
            case (.pinch, .pinch):
                return true
            case (.rotation, .rotation):
                return true
            default:
                return false
            }
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            case .tap:
                hasher.combine(0)
            case .doubleTap:
                hasher.combine(1)
            case .longPress(let duration):
                hasher.combine(2)
                hasher.combine(duration)
            case .pan:
                hasher.combine(3)
            case .swipe(let direction, let numberOfTouchesRequired):
                hasher.combine(4)
                hasher.combine(direction.rawValue)
                hasher.combine(numberOfTouchesRequired)
            case .pinch:
                hasher.combine(5)
            case .rotation:
                hasher.combine(6)
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
            case .swipe(let direction, _):
                return direction
            default:
                return .right
            }
        }
        
        var swipeTouchesValue: Int {
            switch self {
            case .swipe(_, let numberOfTouchesRequired):
                return numberOfTouchesRequired
            default:
                return 0
            }
        }
    }
}

// MARK: - private
private class GestureClosureWrapper<T: UIGestureRecognizer>: NSObject {
    let gesture: T
    private let closure: (T) -> Void
    
    init(gesture: T, closure: @escaping (T) -> Void) {
        self.gesture = gesture
        self.closure = closure
        super.init()
    }
    
    @objc func invoke() {
        closure(gesture)
    }
}

private class GestureSingleHandler<T: AnyObject>: NSObject {
    private weak var target: T?
    private let action: (T) -> Void
    
    init(target: T, action: @escaping (T) -> Void) {
        self.target = target
        self.action = action
        super.init()
    }
    
    @objc func invoke() {
        if let target = target {
            action(target)
        }
    }
}

private class GestureHandler<T: AnyObject, GestureRecognizer: UIGestureRecognizer>: NSObject {
    private weak var target: T?
    private let action: (T, GestureRecognizer) -> Void
    
    init(target: T, action: @escaping (T, GestureRecognizer) -> Void) {
        self.target = target
        self.action = action
        super.init()
    }
    
    @objc func invoke(_ gesture: UIGestureRecognizer) {
        guard let target = target, let typedGesture = gesture as? GestureRecognizer else { return }
        action(target, typedGesture)
    }
}

private struct ScaleParameters {
    var scale: CGFloat
    var anchor: UnitPoint
}

private extension UIView {
    struct AssociatedKeys {
        nonisolated(unsafe) static var gestureHandlersKey: Void?
    }
    
    private var gestureHandlers: [GestureType: Any] {
        get {
            return objc_getAssociatedObject(
                self,
                withUnsafePointer(to: &AssociatedKeys.gestureHandlersKey) { UnsafeRawPointer($0) }
            ) as? [GestureType: Any] ?? [:]
        }
        set {
            objc_setAssociatedObject(
                self,
                withUnsafePointer(to: &AssociatedKeys.gestureHandlersKey) { UnsafeRawPointer($0) },
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    
    private func applyScaleEffect(_ params: ScaleParameters) {
        
        let size: CGSize = {
            let width = constraint(.width)?.constant ?? .zero
            let height = constraint(.height)?.constant ?? .zero
            
            if !bounds.isEmpty && bounds.size != .zero {
                return bounds.size
            } else if width != .zero || height != .zero {
                return CGSize(width: width, height: height)
            } else {
                return intrinsicContentSize
            }
        }()
        
        guard size != .zero else { return }
        
        let anchorPosition = CGPoint(
                x: size.width * params.anchor.x,
                y: size.height * params.anchor.y
            )
        
        let centerPoint = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        let xOffset = anchorPosition.x - centerPoint.x
        let yOffset = anchorPosition.y - centerPoint.y
        
        let scaleTransform = CGAffineTransform.identity
            .translatedBy(x: xOffset, y: yOffset)
            .scaledBy(x: params.scale, y: params.scale)
            .translatedBy(x: -xOffset, y: -yOffset)
        
        transform = scaleTransform
    }
    
    private func createGestureRecognizer(for type: GestureType) -> UIGestureRecognizer {
        switch type {
        case .tap:
            let tap = UITapGestureRecognizer()
            tap.gestureType = type
            return tap
        case .doubleTap:
            let gesture = UITapGestureRecognizer()
            gesture.numberOfTapsRequired = 2
            gesture.gestureType = type
            return gesture
        case .longPress(let minimumDuration):
            let gesture = UILongPressGestureRecognizer()
            gesture.minimumPressDuration = minimumDuration
            gesture.gestureType = type
            return gesture
        case .pan:
            let gesture = UIPanGestureRecognizer()
            gesture.gestureType = type
            return gesture
        case .swipe(let direction, let numberOfTouchesRequired):
            let gesture = UISwipeGestureRecognizer()
            gesture.direction = direction
            gesture.numberOfTouchesRequired = numberOfTouchesRequired
            gesture.gestureType = type
            return gesture
        case .pinch:
            let gesture = UIPinchGestureRecognizer()
            gesture.gestureType = type
            return gesture
        case .rotation:
            let gesture = UIRotationGestureRecognizer()
            gesture.gestureType = type
            return gesture
        }
    }
    
    private func handleGestureDependencies(for type: GestureType, gesture: UIGestureRecognizer) {
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

#endif
