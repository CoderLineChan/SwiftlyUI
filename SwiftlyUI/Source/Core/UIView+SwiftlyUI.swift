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
    /// SwiftlyUI - 获取高度frame.size.height
    var height: CGFloat {
        get { return frame.size.height }
        set { frame.size.height = newValue }
    }
    /// SwiftlyUI - 获取宽度frame.size.width
    var width: CGFloat {
        get { return frame.size.width }
        set { frame.size.width = newValue }
    }
    /// SwiftlyUI - 获取X坐标frame.origin.x
    var x: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    /// SwiftlyUI - 获取Y坐标frame.origin.y
    var y: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    /// SwiftlyUI - 获取size frame.size
    var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    /// SwiftlyUI - 获取位置frame.origin
    var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
}

/// SwiftlyUI - 拉伸UI
public final class UISpacer: UIView {
    /// SwiftlyUI - 初始化一个UISpacer
    public init(_ axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        self.axis(axis)
    }
    /// SwiftlyUI - 初始化一个UISpacer
    public init(axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        self.axis(axis)
    }
    
    /// SwiftlyUI - 设置轴向
    @discardableResult
    private func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        contentHuggingPriority(.defaultLow, for: axis)
        contentCompressionResistancePriority(.defaultLow, for: axis)
        if axis == .horizontal {
            width(1)
        } else {
            height(1)
        }
        return self
    }
    
    /// SwiftlyUI - 设置最小宽度
    @discardableResult
    public func minWidth(_ value: CGFloat) -> Self {
        frame(minWidth: value)
        return self
    }
    
    /// SwiftlyUI - 设置最小高度
    @discardableResult
    public func minHeight(_ value: CGFloat) -> Self {
        frame(minHeight: value)
        return self
    }
    
    /// SwiftlyUI - 设置最大宽度
    @discardableResult
    public func maxWidth(_ value: CGFloat) -> Self {
        frame(maxWidth: value)
        return self
    }
    
    /// SwiftlyUI - 设置最大高度
    @discardableResult
    public func maxHeight(_ value: CGFloat) -> Self {
        frame(maxHeight: value)
        return self
    }
    
    /// SwiftlyUI - Use init(axis:) instead.
    private convenience init() {
        fatalError("UISpacer cannot be initialized with init(). Use init(axis:) instead.")
    }

    /// SwiftlyUI - Use init(axis:) instead.
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// SwiftlyUI - Use init(axis:) instead.
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private let backgroundViewTag: Int = 98367682
private let defaultPadding: CGFloat = 16
public extension UIView {
    /// SwiftlyUI - 设置边距
    /// 设置 layoutMargins
    /// - Parameters:
    ///  - margin: 边距大小，默认16
    @discardableResult
    func padding(_ margin: CGFloat? = nil) -> Self {
        padding(.all, margin ?? defaultPadding)
        return self
    }
    
    /// SwiftlyUI - 设置边距
    /// 设置 layoutMargins
    /// - Parameters:
    /// - edge: 边距方向，默认.all
    /// - length: 边距大小，默认16
    @discardableResult
    func padding(_ edge: EdgeSet = .all, _ length: CGFloat? = nil) -> Self {
        layoutMargins(edge, length)
        return self
    }
    
    /// SwiftlyUI - 设置边距
    /// 设置 layoutMargins
    /// - Parameters:
    /// - edge: 设置UIEdgeInsets
    @discardableResult
    func padding(_ edge: UIEdgeInsets) -> Self {
        return layoutMargins(edge)
    }
    
    /// SwiftlyUI - 设置边距
    /// 与padding相同
    /// - Parameters:
    /// - margin: 边距大小，默认16
    @discardableResult
    func layoutMargins(_ margin: CGFloat? = nil) -> Self {
        return layoutMargins(.all, margin ?? defaultPadding)
    }
    
    /// SwiftlyUI - 设置边距
    /// 与padding相同
    /// - Parameters:
    /// - edge: 设置UIEdgeInsets
    @discardableResult
    @objc func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        layoutMargins = edge
        return self
    }
    
    /// SwiftlyUI - 设置边距
    /// 与padding相同
    /// - Parameters:
    /// - edge: 边距方向，默认.all
    /// - length: 边距大小，默认16
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
    
    /// SwiftlyUI - 设置边框
    /// 设置 layer.borderColor 和 layer.borderWidth
    /// - Parameters:
    /// - color: 边框颜色
    /// - width: 边框宽度，默认1
    @discardableResult
    func border(_ color: UIColor, _ width: CGFloat = 1) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    /// SwiftlyUI - 设置边框颜色
    /// 设置 layer.borderColor
    /// - Parameters:
    /// - color: 边框颜色
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        self.layer.borderColor = color.cgColor
        return self
    }
    
    /// SwiftlyUI - 设置边框宽度
    /// 设置 layer.borderWidth
    /// - Parameters:
    /// - width: 边框宽度
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        self.layer.borderWidth = width
        return self
    }
    
    /// SwiftlyUI - 设置是否裁剪超出父视图的部分
    @discardableResult
    func clipsToBounds(_ isEnabled: Bool = true) -> Self {
        self.clipsToBounds = isEnabled
        return self
    }
    
    /// SwiftlyUI - 设置是否透明
    @discardableResult
    func opaque(_ isEnabled: Bool = true) -> Self {
        self.isOpaque = isEnabled
        return self
    }
    
    /// SwiftlyUI - 设置是否清除上下文
    @discardableResult
    func clearsContextBeforeDrawing(_ isEnabled: Bool = true) -> Self {
        self.clearsContextBeforeDrawing = isEnabled
        return self
    }
    
    /// SwiftlyUI - 设置内容模式
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    /// SwiftlyUI - 设置蒙版
    @discardableResult
    func mask(_ mask: UIView) -> Self {
        self.mask = mask
        return self
    }
    
    /// SwiftlyUI - 设置主题颜色
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
    
    /// SwiftlyUI - 设置圆角半径
    /// 设置 layer.cornerRadius
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        return self
    }
    
    /// SwiftlyUI - 设置圆角，可指定圆角方向
    ///
    /// - Parameters:
    /// - radius: 圆角半径
    /// - corners: 圆角方向，默认.allCorners
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
    
    /// SwiftlyUI - 设置圆角
    /// 设置masksToBounds
    @discardableResult
    func layerCornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    /// SwiftlyUI - 设置是否裁剪超出父视图的部分
    @discardableResult
    func masksToBounds(_ isEnabled: Bool = true) -> Self {
        self.layer.masksToBounds = isEnabled
        return self
    }
    
    /// SwiftlyUI - 设置圆角，可指定圆角方向
    ///
    /// - Parameters:
    /// - radius: 圆角半径
    /// - corners: 圆角方向，默认.allCorners
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
    
    /// SwiftlyUI - 设置背景颜色
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    /// SwiftlyUI - 添加一个View作为背景
    /// 设置一个View作为背景视图，默认与当前View一样大小
    @discardableResult
    func backgroundView(_ view: @escaping () -> UIView?) -> Self {
        subviews.forEach({ if $0.tag == backgroundViewTag { $0.removeFromSuperview() } })
        if let subview = view() {
            subview.isUserInteractionEnabled = false
            subview.tag = backgroundViewTag
            insertSubview(subview, at: 0)
            subview.fillToSuper()
        }
        return self
    }
    
    /// SwiftlyUI - 在最底部添加Views
    /// 在View的底部 插入Views，默认没有布局
    @discardableResult
    func background(@SwiftlyUIBuilder content: () -> [UIView]) -> Self {
        let subviews = content()
        setCanActiveLayout(false, forViews: subviews)
        subviews.forEach { sub in
            insertSubview(sub, at: 0)
        }
        setCanActiveLayout(true, forViews: subviews)
        subviews.forEach({ $0.interiorActivateAllConstraints() })
        return self
    }
    
    /// SwiftlyUI - 添加子视图
    /// 添加子视图，默认没有布局
    @discardableResult
    func overlay(@SwiftlyUIBuilder content: () -> [UIView]) -> Self {
        addContents(content: content)
        return self
    }
    
    
    /// SwiftlyUI - 添加子视图
    /// 添加子视图，默认没有布局
    @discardableResult
    func addContents(@SwiftlyUIBuilder content: () -> [UIView]) -> Self {
        let subviews = content()
        setCanActiveLayout(false, forViews: subviews)
        subviews.forEach { sub in
            addSubview(sub)
        }
        setCanActiveLayout(true, forViews: subviews)
        subviews.forEach({ $0.interiorActivateAllConstraints() })
        return self
    }
    
    /// SwiftlyUI - 设置阴影
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
    
    /// SwiftlyUI - 设置透明度
    /// 设置 alpha 属性
    @discardableResult
    func opacity(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    /// SwiftlyUI - 设置透明度
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        self.alpha = value
        return self
    }
    
    /// SwiftlyUI - 设置是否隐藏
    @discardableResult
    func hidden(_ isHidden: Bool = true) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    /// SwiftlyUI - 设置是否允许用户交互
    @discardableResult
    func userInteractionEnabled(_ isEnabled : Bool = true) -> Self {
        self.isUserInteractionEnabled = isEnabled
        return self
    }
    
    /// SwiftlyUI - 设置Tag
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    /// SwiftlyUI - 设置​​抗拉伸能力
    ///
    /// - Parameters:
    /// - priority: 抗拉伸优先级，越大越不容易被拉伸
    @discardableResult
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    /// SwiftlyUI - 设置抗压缩能力
    ///
    /// - Parameters:
    /// - priority: 抗压缩优先级，越大越不容易被压缩
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
    
    /// swiftlyUI 扩展 设置忽略自身点击。
    @discardableResult
    func ignoreSelfHit(_ isIgnore: Bool = true) -> Self {
        self.ignoreSelfHit = isIgnore
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
    }
    
}

// MARK: - Layout Chained Equal
public extension UIView {
    /// SwiftlyUI - 设置左边约束，需要配合equalTo方法
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
    
    /// SwiftlyUI - 设置右边约束，需要配合equalTo方法
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
    
    /// SwiftlyUI - 设置左边约束，需要配合equalTo方法
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
    
    /// SwiftlyUI - 设置右边约束，需要配合equalTo方法
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
    
    /// SwiftlyUI - 设置顶部约束，需要配合equalTo方法
    var top: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .top) {
            types.remove(at: index)
        }
        types.append(.top)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI - 设置底部约束，需要配合equalTo方法
    var bottom: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .bottom) {
            types.remove(at: index)
        }
        types.append(.bottom)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI - 设置中心X约束，需要配合equalTo方法
    var centerX: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .centerX) {
            types.remove(at: index)
        }
        types.append(.centerX)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI - 设置中心Y约束，需要配合equalTo方法
    var centerY: Self {
        var types = constraintTypes
        if let index = types.firstIndex(of: .centerY) {
            types.remove(at: index)
        }
        types.append(.centerY)
        constraintTypes = types
        return self
    }
    
    /// SwiftlyUI - 设置所有边缘约束，需要配合equalTo方法
    var edges: Self {
        var types: [ConstraintType] = []
        types.append(.top)
        types.append(.bottom)
        types.append(.leading)
        types.append(.trailing)
        constraintTypes = types
        return self
    }
    
    
    /// SwiftlyUI - 与Super设置约束
    /// - Parameters:
    /// - isMargins: 是否相对于layoutMarginsGuide布局
    /// - offset: 偏移量
    @discardableResult
    func equalToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("SwiftlyUI - No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
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
    
    /// SwiftlyUI - 指定View约束
    /// - Parameters:
    /// - view: 需要约束的View
    /// - isMargins: 是否相对于layoutMarginsGuide布局
    /// - offset: 偏移量
    @discardableResult
    func equalTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("SwiftlyUI - No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
            return self
        }
        constraintTypes = []
        if types.contains(.left) {
            leftTo(view, isMargins: isMargins, offset: offset)
        }else if types.contains(.leading) {
            leadingTo(view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.right) {
            rightTo(view, isMargins: isMargins, offset: offset)
        }else if types.contains(.trailing) {
            trailingTo(view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.top) {
            topTo(view, isMargins: isMargins, offset: offset)
        }
        
        if types.contains(.bottom) {
            bottomTo(view, isMargins: isMargins, offset: offset)
        }
        if types.contains(.centerX) {
            centerXTo(view, offset: offset)
        }
        if types.contains(.centerY) {
            centerYTo(view, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI - 指定Y锚点约束
    /// - Parameters:
    /// - yAnchor: Y轴锚点（上，下，中心Y）
    /// - offset: 偏移量
    @discardableResult
    func equalTo(_ yAnchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("SwiftlyUI - No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
            return self
        }
        if !types.contains(.top) && !types.contains(.bottom) && !types.contains(.centerY) {
            assertionFailure("SwiftlyUI - Only Set .top, .bottom or .centerY constraints to Y axis anchor.")
            return self
        }
        constraintTypes = []
        if types.contains(.top) {
            topTo(yAnchor, offset: offset)
        }
        
        if types.contains(.bottom) {
            bottomTo(yAnchor, offset: offset)
        }
        if types.contains(.centerY) {
            centerYTo(yAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI - 指定X锚点约束
    /// - Parameters:
    /// - xAnchor: X轴锚点（左，右，中心X）
    /// - offset: 偏移量
    @discardableResult
    func equalTo(_ xAnchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        let types = constraintTypes
        if types.isEmpty {
            assertionFailure("SwiftlyUI - No constraints specified. Use .top, .bottom, .leading, .trailing, .centerX or .centerY to specify constraints.")
            return self
        }
        if !types.contains(.left) && !types.contains(.right) && !types.contains(.leading) && !types.contains(.trailing) && !types.contains(.centerX) {
            assertionFailure("SwiftlyUI - Only Set .left, .right, .leading, .trailing or .centerX constraints to X axis anchor.")
            return self
        }
        constraintTypes = []
        if types.contains(.left) {
            leftTo(xAnchor, offset: offset)
        }else if types.contains(.leading) {
            leadingTo(xAnchor, offset: offset)
        }
        
        if types.contains(.right) {
            rightTo(xAnchor, offset: offset)
        }else if types.contains(.trailing) {
            trailingTo(xAnchor, offset: offset)
        }
        if types.contains(.centerX) {
            centerXTo(xAnchor, offset: offset)
        }
        return self
    }
    
}

// MARK: - Layout Fill & center
public extension UIView {
    
    /// SwiftlyUI - 填满父视图
    /// - Parameters:
    ///  - edge: 边距
    @discardableResult
    func fillToSuper(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: false, offset: edge.left)
        rightToSuper(isMargins: false, offset: edge.right)
        topToSuper(isMargins: false, offset: edge.top)
        bottomToSuper(isMargins: false, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI - 填满父视图的Margins
    /// - Parameters:
    ///  - edge: 边距
    @discardableResult
    func fillToSuperMargins(edge: UIEdgeInsets = .zero) -> Self {
        leftToSuper(isMargins: true, offset: edge.left)
        rightToSuper(isMargins: true, offset: edge.right)
        topToSuper(isMargins: true, offset: edge.top)
        bottomToSuper(isMargins: true, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI - 填满指定视图
    /// - Parameters:
    ///  - view: 指定视图
    ///  - edge: 边距
    @discardableResult
    func fillToMargins(_ view: UIView, edge: UIEdgeInsets = .zero) -> Self {
        fillTo(view, isMargins: true, edge: edge)
        return self
    }
    
    /// SwiftlyUI - 填满指定视图
    /// - Parameters:
    ///  - view: 指定视图
    ///  - isMargins: 是否相对于layoutMarginsGuide布局，默认false
    ///  - edge: 边距
    @discardableResult
    func fillTo(_ view: UIView, isMargins: Bool = false, edge: UIEdgeInsets = .zero) -> Self {
        leadingTo(isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: edge.left)
        trailingTo(isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: edge.right)
        topTo(isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: edge.top)
        bottomTo(isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: edge.bottom)
        return self
    }
    
    /// SwiftlyUI - 中心对齐到父视图
    @discardableResult
    func centerToSuper() -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0),
                type: .centerY
            )
            addAndActiveConstraint(
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
    
    /// SwiftlyUI - 中心对齐到指定视图
    @discardableResult
    func centerTo(_ view: UIView) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                type: .centerY
            )
            addAndActiveConstraint(
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
    
    /// SwiftlyUI - 中心对齐到父视图
    /// - Parameters:
    ///  - offset: 偏移量
    @discardableResult
    func centerXToSuper(offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    
    /// SwiftlyUI - 中心对齐到指定X轴锚点
    /// - Parameters:
    /// - anchor: X轴锚点
    /// - offset: 偏移量
    @discardableResult
    func centerXTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .centerX, targetType: .other, offset: offset, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerX] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI - 中心对齐到指定视图
    /// - Parameters:
    /// - view: 指定视图
    /// - offset: 偏移量
    @discardableResult
    func centerXTo(_ view: UIView, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset),
                type: .centerX
            )
        }else {
            centerXTo(view.layoutMarginsGuide.centerXAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI - 中心对齐到父视图
    /// - Parameters:
    /// - offset: 偏移量
    @discardableResult
    func centerYToSuper(offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    
    /// SwiftlyUI - 中心对齐到指定Y轴锚点
    /// - Parameters:
    /// - anchor: Y轴锚点
    /// - offset: 偏移量
    @discardableResult
    func centerYTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .centerY, targetType: .other, offset: offset, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.centerY] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI - 中心对齐到指定视图
    /// - Parameters:
    /// - view: 指定视图
    /// - offset: 偏移量
    @discardableResult
    func centerYTo(_ view: UIView, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset),
                type: .centerY
            )
        }else {
            centerYTo(view.layoutMarginsGuide.centerYAnchor, offset: offset)
        }
        return self
    }
    
}

// MARK: - Layout Width & Height
public extension UIView {
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
    func widthToSuper(multiplier: CGFloat = 1) -> Self {
        if let superview = superview {
            addAndActiveConstraint(
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
        addAndActiveConstraint(
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
    func widthTo(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .width, targetType: .other, offset: 0, multiplier: multiplier, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.width] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func widthTo(_ view: UIView, multiplier: CGFloat = 1) -> Self {
        if view == superview {
            addAndActiveConstraint(
                widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier),
                type: .width
            )
        }else {
            widthTo(view.layoutMarginsGuide.widthAnchor, multiplier: multiplier)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func heightToSuper(multiplier: CGFloat = 1) -> Self {
        if let superview = superview {
            addAndActiveConstraint(
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
        addAndActiveConstraint(
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
    func heightTo(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        let config = ConstraintConfig(type: .height, targetType: .other, offset: 0, multiplier: multiplier, Dimension: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.height] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 heightTo()方法代替
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        heightTo(anchor, multiplier: multiplier)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func heightTo(_ view: UIView, multiplier: CGFloat = 1) -> Self {
        if view == superview {
            addAndActiveConstraint(
                heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier),
                type: .height
            )
        }else {
            height(to: view.layoutMarginsGuide.heightAnchor, multiplier: multiplier)
        }
        return self
    }
}

// MARK: - Layout Top
public extension UIView {
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func topTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func topTo(_ view: UIView, isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                topAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            topTo(isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                topAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            topGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topGreaterThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func topLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                topAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, constant: offset),
                type: .top
            )
        }else {
            topLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topLessThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func topLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                topAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: offset),
                type: .top
            )
        } else {
            let config = ConstraintConfig(type: .top, targetType: .super, offset: offset, relation: .lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.top] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func topGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                topAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: offset),
                type: .top
            )
        } else {
            let config = ConstraintConfig(type: .top, targetType: .super, offset: offset, relation: .greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.top] = config
            constraintHolder = holder
        }
        return self
    }
    
}

// MARK: - Layout Left & leading
public extension UIView {
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func leadingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func leftGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                leftAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: offset),
                type: .left
            )
        } else {
            let config = ConstraintConfig(type: .left, targetType: .super, offset: offset, relation:.greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.left] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                leadingAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: offset),
                type: .leading
            )
        } else {
            let config = ConstraintConfig(type: .leading, targetType: .super, offset: offset, relation:.greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.leading] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                leftAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: offset),
                type: .left
            )
        } else {
            let config = ConstraintConfig(type: .left, targetType: .super, offset: offset, relation:.lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.left] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                leadingAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: offset),
                type: .leading
            )
        } else {
            let config = ConstraintConfig(type: .leading, targetType: .super, offset: offset, relation:.lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.leading] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func leftTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leftAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            leftTo(isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leftAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            leftGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leftAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, constant: offset),
                type: .left
            )
        }else {
            leftLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.leftAnchor : view.leftAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftLessThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func leadingTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func leadingTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leadingAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leadingTo(isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leadingAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leadingGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingGreaterThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func leadingLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                leadingAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, constant: offset),
                type: .leading
            )
        }else {
            leadingLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leadingLessThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .leading, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.leading] = config
        constraintHolder = holder
        return self
    }
    
}

// MARK: - Layout Bottom
public extension UIView {
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func bottomLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                bottomAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: offset),
                type: .bottom
            )
        } else {
            let config = ConstraintConfig(type: .bottom, targetType: .super, offset: offset, relation: .lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.bottom] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                bottomAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: offset),
                type: .bottom
            )
        } else {
            let config = ConstraintConfig(type: .bottom, targetType: .super, offset: offset, relation: .greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.bottom] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func bottomTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                bottomAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottomTo(isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                bottomAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottomGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomGreaterThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .greaterThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.bottom] = config
        constraintHolder = holder
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                bottomAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, constant: offset),
                type: .bottom
            )
        }else {
            bottomLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func bottomLessThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .bottom, targetType: .other, offset: offset, relation: .lessThanOrEqual, YAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.bottom] = config
        constraintHolder = holder
        return self
    }
    
}

// MARK: - Layout Right & trailing
public extension UIView {
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func trailingToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
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
    func trailingLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                trailingAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -offset),
                type: .trailing
            )
        } else {
            let config = ConstraintConfig(type: .trailing, targetType: .super, offset: offset, relation: .lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.trailing] = config
            constraintHolder = holder
        }
        return self
    }

    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightLessThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                rightAnchor.constraint(lessThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -offset),
                type: .right
            )
        } else {
            let config = ConstraintConfig(type: .right, targetType: .super, offset: offset, relation: .lessThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.right] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailingGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                trailingAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -offset),
                type: .trailing
            )
        } else {
            let config = ConstraintConfig(type: .trailing, targetType: .super, offset: offset, relation: .greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.trailing] = config
            constraintHolder = holder
        }
        return self
    }

    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightGreaterThanOrEqualToSuper(isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if let superview = superview {
            addAndActiveConstraint(
                rightAnchor.constraint(greaterThanOrEqualTo: isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -offset),
                type: .right
            )
        } else {
            let config = ConstraintConfig(type: .right, targetType: .super, offset: offset, relation: .greaterThanOrEqual, isMargins: isMargins)
            var holder = constraintHolder
            holder.pendingConstraints[.right] = config
            constraintHolder = holder
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func rightTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                rightAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            rightTo(isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailingTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func trailingTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                trailingAnchor.constraint(equalTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailingTo(isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                rightAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            rightGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightGreaterThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func rightLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                rightAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, constant: -offset),
                type: .right
            )
        }else {
            rightLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.rightAnchor : view.rightAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func rightLessThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func trailingGreaterThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                trailingAnchor.constraint(greaterThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailingGreaterThanOrEqualTo(isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailingGreaterThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
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
    func trailingLessThanOrEqualTo(_ view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        if view == superview {
            addAndActiveConstraint(
                trailingAnchor.constraint(lessThanOrEqualTo: isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, constant: -offset),
                type: .trailing
            )
        }else {
            trailingLessThanOrEqualTo(isMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor, offset: offset)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func trailingLessThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .trailing, targetType: .other, offset: offset, relation: .lessThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.trailing] = config
        constraintHolder = holder
        return self
    }
}

// MARK: - deprecated
public extension UIView {
    
    
    /// SwiftlyUI - 指定View约束
    /// 这是旧接口，请使用 equalTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use equalTo() instead.")
    @discardableResult
    func equal(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        return equalTo(view, isMargins: isMargins, offset: offset)
    }
    /// SwiftlyUI - 指定Y锚点约束
    /// 这是旧接口，请使用 equalTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use equalTo() instead.")
    @discardableResult
    func equal(to yAnchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        return equalTo(yAnchor, offset: offset)
    }
    
    /// SwiftlyUI - 指定X锚点约束
    /// 这是旧接口，请使用 equalTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use equalTo() instead.")
    @discardableResult
    func equal(to xAnchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        equalTo(xAnchor, offset: offset)
    }
    
    /// SwiftlyUI - 填满父视图
    /// - Parameters:
    ///  - edge: 边距
    /// 这是旧接口，请使用 fillToSuper()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use fillToSuper() instead.")
    @discardableResult
    func fillSuper(edge: UIEdgeInsets = .zero) -> Self {
        fillToSuper(edge: edge)
    }
    
    /// SwiftlyUI - 填满父视图的Margins
    /// - Parameters:
    ///  - edge: 边距
    /// 这是旧接口，请使用 fillToSuperMargins()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use fillToSuperMargins() instead.")
    @discardableResult
    func fillSuperMargins(edge: UIEdgeInsets = .zero) -> Self {
        fillToSuperMargins(edge: edge)
    }
    
    /// SwiftlyUI - 填满指定视图
    /// 这是旧接口，请使用 fillToMargins()方法代替
    /// - Parameters:
    ///  - view: 指定视图
    ///  - edge: 边距
    @available(*, deprecated, message: "SwiftlyUI - Use fillToMargins() instead.")
    @discardableResult
    func fill(toMargins view: UIView, edge: UIEdgeInsets = .zero) -> Self {
        fill(to: view, isMargins: true, edge: edge)
        return self
    }
    
    /// SwiftlyUI - 填满指定视图
    /// 这是旧接口，请使用 fillTo()方法代替
    /// - Parameters:
    ///  - view: 指定视图
    ///  - isMargins: 是否相对于layoutMarginsGuide布局，默认false
    @available(*, deprecated, message: "SwiftlyUI - Use fillTo() instead.")
    @discardableResult
    func fill(to view: UIView, isMargins: Bool = false, edge: UIEdgeInsets = .zero) -> Self {
        fillTo(view, isMargins: isMargins, edge: edge)
    }
    
    /// SwiftlyUI - 中心对齐到指定视图
    /// 这是旧接口，请使用 centerTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use centerTo() instead.")
    @discardableResult
    func center(to view: UIView) -> Self {
        centerTo(view)
    }
    
    /// SwiftlyUI - 中心对齐到指定X轴锚点
    /// 这是旧接口，请使用 centerXTo()方法代替
    /// - Parameters:
    /// - anchor: X轴锚点
    /// - offset: 偏移量
    @available(*, deprecated, message: "SwiftlyUI - Use centerXTo() instead.")
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        centerXTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI - 中心对齐到指定视图
    /// 这是旧接口，请使用 centerXTo()方法代替
    /// - Parameters:
    /// - view: 指定视图
    /// - offset: 偏移量
    @available(*, deprecated, message: "SwiftlyUI - Use centerXTo() instead.")
    @discardableResult
    func centerX(to view: UIView, offset: CGFloat = 0) -> Self {
        centerXTo(view, offset: offset)
    }
    
    /// SwiftlyUI - 中心对齐到指定Y轴锚点
    /// 这是旧接口，请使用 centerYTo()方法代替
    /// - Parameters:
    /// - anchor: Y轴锚点
    /// - offset: 偏移量
    @available(*, deprecated, message: "SwiftlyUI - Use centerYTo() instead.")
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        centerYTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI - 中心对齐到指定视图
    /// 这是旧接口，请使用 centerYTo()方法代替
    /// - Parameters:
    /// - view: 指定视图
    /// - offset: 偏移量
    @available(*, deprecated, message: "SwiftlyUI - Use centerYTo() instead.")
    @discardableResult
    func centerY(to view: UIView, offset: CGFloat = 0) -> Self {
        centerYTo(view, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 widthTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use widthTo() method instead.")
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
        widthTo(anchor, multiplier: multiplier)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 widthTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use widthTo() method instead.")
    @discardableResult
    func width(to view: UIView, multiplier: CGFloat = 1) -> Self {
        widthTo(view, multiplier: multiplier)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 heightTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use heightTo() method instead.")
    @discardableResult
    func height(to view: UIView, multiplier: CGFloat = 1) -> Self {
        heightTo(view, multiplier: multiplier)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 topTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use topTo() method instead.")
    @discardableResult
    func top(to view: UIView, isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        topTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 topTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use topTo() method instead.")
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        topTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    @available(*, deprecated, message: "SwiftlyUI - Use topGreaterThanOrEqualTo instead.")
    func top(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        return topGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    @available(*, deprecated, message: "SwiftlyUI - Use topGreaterThanOrEqualTo instead.")
    func top(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        return topGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    @available(*, deprecated, message: "SwiftlyUI - Use topLessThanOrEqualTo instead.")
    func top(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        return topLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    @available(*, deprecated, message: "SwiftlyUI - Use topLessThanOrEqualTo instead.")
    func top(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        return topLessThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftGreaterThanOrEqualTo instead.")
    @discardableResult
    func left(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leftGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    @discardableResult
    func leftGreaterThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        if !constraintTypes.isEmpty {
            assertionFailure("SwiftlyUI - Please use .equal() method to set constraints.")
            return self
        }
        let config = ConstraintConfig(type: .left, targetType: .other, offset: offset, relation: .greaterThanOrEqual, XAxisAnchor: anchor)
        var holder = constraintHolder
        holder.pendingConstraints[.left] = config
        constraintHolder = holder
        return self
    }
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftGreaterThanOrEqualTo instead.")
    @discardableResult
    func left(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leftGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftTo() method instead.")
    @discardableResult
    func left(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leftTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftTo() method instead.")
    @discardableResult
    func left(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leftTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftLessThanOrEqualTo instead.")
    @discardableResult
    func left(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leftLessThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leftLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leftLessThanOrEqualTo instead.")
    @discardableResult
    func left(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leftLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingTo instead.")
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leadingTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingGreaterThanOrEqualTo instead.")
    @discardableResult
    func leading(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leadingGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingTo instead.")
    @discardableResult
    func leading(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leadingTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingLessThanOrEqualTo instead.")
    @discardableResult
    func leading(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        leadingLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingGreaterThanOrEqualTo instead.")
    @discardableResult
    func leading(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leadingGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 leadingLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use leadingLessThanOrEqualTo instead.")
    @discardableResult
    func leading(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        leadingLessThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomTo instead.")
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        bottomTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomTo instead.")
    @discardableResult
    func bottom(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        bottomTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomGreaterThanOrEqualTo instead.")
    @discardableResult
    func bottom(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        bottomGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomGreaterThanOrEqualTo instead.")
    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        bottomGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomLessThanOrEqualTo instead.")
    @discardableResult
    func bottom(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        bottomLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 bottomLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use bottomLessThanOrEqualTo instead.")
    @discardableResult
    func bottom(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
        bottomLessThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 rightTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightTo() instead.")
    @discardableResult
    func right(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        rightTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI 设置右边约束
    /// 这是旧接口，请使用 rightTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightTo() instead.")
    @discardableResult
    func right(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        rightTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingTo() instead.")
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        trailingTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingTo() instead.")
    @discardableResult
    func trailing(to view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        trailingTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 rightGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightGreaterThanOrEqualTo instead.")
    @discardableResult
    func right(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        rightGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 rightGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightGreaterThanOrEqualTo instead.")
    @discardableResult
    func right(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        rightGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 rightLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightLessThanOrEqualTo instead.")
    @discardableResult
    func right(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        rightLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 rightLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use rightLessThanOrEqualTo instead.")
    @discardableResult
    func right(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        rightLessThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingGreaterThanOrEqualTo instead.")
    @discardableResult
    func trailing(greaterThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        trailingGreaterThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingGreaterThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingGreaterThanOrEqualTo instead.")
    @discardableResult
    func trailing(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        trailingGreaterThanOrEqualTo(anchor, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingLessThanOrEqualTo instead.")
    @discardableResult
    func trailing(lessThanOrEqualTo view: UIView,isMargins: Bool = false, offset: CGFloat = 0) -> Self {
        trailingLessThanOrEqualTo(view, isMargins: isMargins, offset: offset)
    }
    
    /// SwiftlyUI extension for `UIView`. Set Layout
    /// 这是旧接口，请使用 trailingLessThanOrEqualTo()方法代替
    @available(*, deprecated, message: "SwiftlyUI - Use trailingLessThanOrEqualTo instead.")
    @discardableResult
    func trailing(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
        trailingLessThanOrEqualTo(anchor, offset: offset)
    }
}

// MARK: - Layout Constraint
public extension UIView {
    
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
    case left, right, top, bottom, leading, trailing
    case leftLessThanOrEqualTo, leadingLessThanOrEqualTo, rightLessThanOrEqualTo, trailingLessThanOrEqualTo, topLessThanOrEqualTo, bottomLessThanOrEqualTo
    case leftGreaterThanOrEqualTo, leadingGreaterThanOrEqualTo, rightGreaterThanOrEqualTo, trailingGreaterThanOrEqualTo, topGreaterThanOrEqualTo, bottomGreaterThanOrEqualTo
    case centerX, centerY
    case width, height
    case widthToSuper, heightToSuper
    case minWidth, maxWidth
    case minHeight, maxHeight
    case marginsLeft, marginsRight, marginsTop, marginsBottom
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
        
        
        let originalSelector3 = #selector(hitTest(_: with:))
        let swizzledSelector3 = #selector(swizzled_hitTest(_: with:))
        UIView.swizzleMethod(clas: UIView.self, originalSelector: originalSelector3, swizzledSelector: swizzledSelector3)
    }
}

extension UIView {
    var ignoreSelfHit: Bool {
        get {
            objc_getAssociatedObject(self, &Self.ignoreSelfHitKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &Self.ignoreSelfHitKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    struct ConstraintHolder {
        var constraints: [ConstraintType: NSLayoutConstraint] = [:]
        var pendingConstraints: [ConstraintType: ConstraintConfig] = [:]
    }
    
    private static var constraintHolderKey: Void?
    private static var constraintCanActiveKey: Void?
    private static var pendingCornerInfoKey: Void?
    private static var constraintTypesKey: Void?
    private static var ignoreSelfHitKey: Void?
    
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
    
    func addAndActiveConstraint(_ constraint: NSLayoutConstraint, type: ConstraintType) {
        translatesAutoresizingMaskIntoConstraints = false
        removeConstraint(type: type)
        NSLayoutConstraint.activate([constraint])
        var holder = constraintHolder
        holder.constraints[type] = constraint
        constraintHolder = holder
    }
    
    func addNewConstraint(_ constraint: NSLayoutConstraint, type: ConstraintType) {
        translatesAutoresizingMaskIntoConstraints = false
        removeConstraint(type: type)
        var holder = constraintHolder
        if let _ = superview {
            if checkCanActive(constraint: constraint) {
                constraint.isActive = true
            }
            holder.constraints[type] = constraint
        }else {
            if constraint.isActive {
                NSLayoutConstraint.deactivate([constraint])
            }
            holder.constraints[type] = constraint
        }
        constraintHolder = holder
    }
    
    func removeConstraint(type: ConstraintType) {
        var holder = constraintHolder
        if let constraint = holder.constraints[type] {
            NSLayoutConstraint.deactivate([constraint])
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
            case .leftLessThanOrEqualTo, .leadingLessThanOrEqualTo:
                if config.targetType == .super {
                    if config.type == .leadingLessThanOrEqualTo {
                        addNewConstraint(
                            leadingAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: config.offset),
                            type: .leadingLessThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            leftAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: config.offset),
                            type: .leftLessThanOrEqualTo
                        )
                    }
                }else if let anchor = config.XAxisAnchor {
                    if config.type == .leadingLessThanOrEqualTo {
                        addNewConstraint(
                            leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: config.offset),
                            type: .leadingLessThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: config.offset),
                            type: .leftLessThanOrEqualTo
                        )
                    }
                }
            case .leftGreaterThanOrEqualTo, .leadingGreaterThanOrEqualTo:
                if config.targetType == .super {
                    if config.type == .leadingGreaterThanOrEqualTo {
                        addNewConstraint(
                            leadingAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.leadingAnchor : superview.leadingAnchor, constant: config.offset),
                            type: .leadingGreaterThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            leftAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.leftAnchor : superview.leftAnchor, constant: config.offset),
                            type: .leftGreaterThanOrEqualTo
                        )
                    }
                }else if let anchor = config.XAxisAnchor {
                    if config.type == .leadingGreaterThanOrEqualTo {
                        addNewConstraint(
                            leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: config.offset),
                            type: .leadingGreaterThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: config.offset),
                            type: .leftGreaterThanOrEqualTo
                        )
                    }
                }
            case .rightLessThanOrEqualTo, .trailingLessThanOrEqualTo:
                if config.targetType == .super {
                    if config.type == .trailingLessThanOrEqualTo {
                        addNewConstraint(
                            trailingAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -config.offset),
                            type: .trailingLessThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            rightAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -config.offset),
                            type: .rightLessThanOrEqualTo
                        )
                    }
                }else if let anchor = config.XAxisAnchor {
                    if config.type == .trailingLessThanOrEqualTo {
                        addNewConstraint(
                            trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -config.offset),
                            type: .trailingLessThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: -config.offset),
                            type: .rightLessThanOrEqualTo
                        )
                    }
                }
            case .rightGreaterThanOrEqualTo, .trailingGreaterThanOrEqualTo:
                if config.targetType == .super {
                    if config.type == .trailingGreaterThanOrEqualTo {
                        addNewConstraint(
                            trailingAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.trailingAnchor : superview.trailingAnchor, constant: -config.offset),
                            type: .trailingGreaterThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            rightAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.rightAnchor : superview.rightAnchor, constant: -config.offset),
                            type: .rightGreaterThanOrEqualTo
                        )
                    }
                }else if let anchor = config.XAxisAnchor {
                    if config.type == .trailingGreaterThanOrEqualTo {
                        addNewConstraint(
                            trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -config.offset),
                            type: .trailingGreaterThanOrEqualTo
                        )
                    } else {
                        addNewConstraint(
                            rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -config.offset),
                            type: .rightGreaterThanOrEqualTo
                        )
                    }
                }
            case .topLessThanOrEqualTo:
                if config.targetType == .super {
                    addNewConstraint(
                        topAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: config.offset),
                        type: .topLessThanOrEqualTo
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: config.offset),
                        type: .topLessThanOrEqualTo
                    )
                }
            case .topGreaterThanOrEqualTo:
                if config.targetType == .super {
                    addNewConstraint(
                        topAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor, constant: config.offset),
                        type: .topGreaterThanOrEqualTo
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: config.offset),
                        type: .topGreaterThanOrEqualTo
                    )
                }
            case .bottomLessThanOrEqualTo:
                if config.targetType == .super {
                    addNewConstraint(
                        bottomAnchor.constraint(lessThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: config.offset),
                        type: .bottomLessThanOrEqualTo
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -config.offset),
                        type: .bottomLessThanOrEqualTo
                    )
                }
            case .bottomGreaterThanOrEqualTo:
                if config.targetType == .super {
                    addNewConstraint(
                        bottomAnchor.constraint(greaterThanOrEqualTo: config.isMargins ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor, constant: -config.offset),
                        type: .bottomGreaterThanOrEqualTo
                    )
                }else if let anchor = config.YAxisAnchor {
                    addNewConstraint(
                        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -config.offset),
                        type: .bottomGreaterThanOrEqualTo
                    )
                }
            default:
                break
            }
        }
        
        var holder = constraintHolder
        holder.pendingConstraints = [:]
        constraintHolder = holder
        
        holder.constraints.forEach { [weak self] (type, constraint) in
            guard let self else { return }
            if checkCanActive(constraint: constraint) {
                if constraint.isActive == false {
                    constraint.isActive = true
                }
            }
        }
    }
    
    private func checkCanActive(constraint: NSLayoutConstraint) -> Bool {
        let firstView: UIView? = {
            if let view = constraint.firstItem as? UIView {
                return view
            } else if let guide = constraint.firstItem as? UILayoutGuide {
                return guide.owningView
            }
            return nil
        }()
        
        let secondView: UIView? = {
            if let view = constraint.secondItem as? UIView {
                return view
            } else if let guide = constraint.secondItem as? UILayoutGuide {
                return guide.owningView
            }
            return nil
        }()
        
        if constraint.secondItem == nil {
            return isValidView(firstView)
        } else {
            let hasSuper = isValidView(firstView) && firstView?.superview == secondView
            let isValid = isValidView(firstView) && isValidView(secondView)
            return isValid || hasSuper
        }
    }
    
    private func isValidView(_ view: UIView?) -> Bool {
        guard let view = view else { return false }
        
        if view is UIWindow { return true }
        
        if view.superview != nil { return true }
        
        if let vc = view.next as? UIViewController, vc.view == view {
            return true
        }
        return false
    }
    
    @objc private func swizzled_didAddSubview(_ view: UIView) {
        swizzled_didAddSubview(view)
    }
    
    @objc private func swizzled_didMoveToSuperview() {
        swizzled_didMoveToSuperview()
        if canActiveLayout {
            interiorActivateAllConstraints()
        }
    }
    
    @objc func swizzled_viewLayoutSubviews() {
        swizzled_viewLayoutSubviews()
        if let cornerInfo = cornerInfo, bounds != .zero {
            roundCorners(cornerInfo.radius, corners: cornerInfo.corners)
            self.cornerInfo = nil
        }
    }
    
    @objc func swizzled_hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = swizzled_hitTest(point, with: event)
        return (ignoreSelfHit && hitView == self) ? nil : hitView
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
            addAndActiveConstraint(
                dimension.constraint(equalToConstant: value),
                type: types.equal
            )
        }
        
        if let minValue = minValue {
            addAndActiveConstraint(
                dimension.constraint(greaterThanOrEqualToConstant: minValue),
                type: types.min
            )
        }
        
        if let maxValue = maxValue {
            addAndActiveConstraint(
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
        ignoreSelfHit(false)
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
        ignoreSelfHit(false)
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
        ignoreSelfHit(false)
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
        ignoreSelfHit(false)
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
