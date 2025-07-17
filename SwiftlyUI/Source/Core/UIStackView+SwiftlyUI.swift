//
//  UIStackView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/20.
//

#if canImport(UIKit)
import UIKit

#if swift(>=5.5)
public final class VStackView: UIStackView {
    /// SwiftlyUI 扩展重写axis方法，限制为垂直方向。
    /// SwiftlyUI extension overrides the axis method to restrict it to vertical direction.
    public override var axis: NSLayoutConstraint.Axis {
        get { .vertical }
        set { super.axis = .vertical }
    }
    
    /// SwiftlyUI 扩展，使用@resultBuilder构建垂直堆栈视图。
    /// SwiftlyUI extension for creating a vertical stack view using a @resultBuilder.
    @discardableResult
    public convenience init(spacing: CGFloat = 0, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = .center
        content().forEach { addArrangedSubview($0) }
    }
    
    /// SwiftlyUI extension for initializing a vertical stack view with a frame.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.alignment = .center
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .vertical
        self.alignment = .center
    }
    
    @available(*, unavailable, message: "use init(spacing:content:)")
    convenience init(arrangedSubviews views: [UIView]) {
        fatalError("SwiftlyUI VStackView can not user init(arrangedSubviews:)")
    }
}

public final class HStackView: UIStackView {
    /// SwiftlyUI 扩展重写axis方法，限制为水平方向。
    /// SwiftlyUI extension overrides the axis method to restrict it to horizontal direction.
    public override var axis: NSLayoutConstraint.Axis {
        get { .horizontal }
        set { super.axis = .horizontal }
    }
    
    /// SwiftlyUI 扩展，使用@resultBuilder构建水平堆栈视图。
    /// SwiftlyUI extension for creating a horizontal stack view using a @resultBuilder.
    @discardableResult
    public convenience init(spacing: CGFloat = 0, @SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = .center
        content().forEach { addArrangedSubview($0) }
    }
    
    /// SwiftlyUI extension for initializing a horizontal stack view with a frame.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.alignment = .center
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .horizontal
        self.alignment = .center
    }
    
    @available(*, unavailable, message: "use init(spacing:content:)")
    convenience init(arrangedSubviews views: [UIView]) {
        fatalError("SwiftlyUI HStackView can not user init(arrangedSubviews:)")
    }

}
#endif



// MARK: - Layout
public extension UIStackView {
    
    /// SwiftlyUI 扩展 重写layoutMargins方法，设置isLayoutMarginsRelativeArrangement。
    /// SwiftlyUI extension overrides the layoutMargins method to set isLayoutMarginsRelativeArrangement.
    @discardableResult
    override func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        super.layoutMargins(edge)
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    /// SwiftlyUI 扩展 设置axis方法。
    /// SwiftlyUI extension for setting the axis method.
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    /// SwiftlyUI 扩展 设置alignment方法。
    /// SwiftlyUI extension for setting the alignment method.
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    /// SwiftlyUI 扩展 设置distribution方法。
    /// SwiftlyUI extension for setting the distribution method.
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    /// SwiftlyUI 扩展 设置spacing方法。
    /// SwiftlyUI extension for setting the spacing method.
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    /// Swiftly 扩展 反正 arrangedSubviews的 Z 轴顺序
    /// SwiftlyUI extension to reverse the Z-order of arrangedSubviews.
    @discardableResult
    func reverseArrangedSubviewsZOrder() -> Self {
        guard !arrangedSubviews.isEmpty else {
            fatalError("SwiftlyUI: UIStackView has no arrangedSubviews to reverse.")
        }
        arrangedSubviews.reversed().forEach { bringSubviewToFront($0) }
        return self
    }

}

// MARK: - separator
public extension UIStackView {
    /// SwiftlyUI 扩展 设置分隔线颜色、大小。
    /// SwiftlyUI extension for setting the separator color and size.
    @discardableResult
    func separator(color: UIColor, size: CGSize) -> Self {
        separatorColor = color
        separatorSize = size
        let min = min(size.width, size.height)
        separatorCornerRadius = min * 0.5
        return self
    }
    
    /// SwiftlyUI 扩展 设置分隔线圆角。
    /// SwiftlyUI extension for setting the separator corner radius.
    @discardableResult
    func separator(cornerRadius: CGFloat) -> Self {
        separatorCornerRadius = cornerRadius
        return self
    }
    
    /// SwiftlyUI 扩展 设置分隔线颜色。
    /// SwiftlyUI extension for setting the separator color.
    var separatorColor: UIColor {
        get { separatorHelper.color }
        set {
            separatorHelper.color = newValue
            separatorHelper.makeSeparators()
        }
    }
    
    /// SwiftlyUI 扩展 设置分隔线大小。
    /// SwiftlyUI extension for setting the separator size.
    var separatorSize: CGSize {
        get { separatorHelper.size }
        set {
            separatorHelper.size = newValue
            separatorHelper.makeSeparators()
        }
    }
    
    /// SwiftlyUI 扩展 设置分隔线圆角。
    /// SwiftlyUI extension for setting the separator corner radius.
    var separatorCornerRadius: CGFloat {
        get { separatorHelper.cornerRadius }
        set {
            separatorHelper.cornerRadius = newValue
            separatorHelper.makeSeparators()
        }
    }
}

// MARK: - private
private extension UIStackView {
    static func once() {
        guard self == UIStackView.self else { return }
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(swizzled_layoutSubviews)
        UIView.swizzleMethod(clas: UIStackView.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
        
    }
    
    
    @objc func swizzled_layoutSubviews() {
        swizzled_layoutSubviews()
        separatorHelper.makeSeparators()
    }
    
    struct AssociatedKeys {
        nonisolated(unsafe) static var kHelperKey: Void?
    }
    
    private var separatorHelper: UIStackViewSeparatorHelper {
        if let helper = objc_getAssociatedObject(self, &AssociatedKeys.kHelperKey) as? UIStackViewSeparatorHelper {
            return helper
        }
        let helper = UIStackViewSeparatorHelper()
        helper.stackView = self
        objc_setAssociatedObject(
            self,
            &AssociatedKeys.kHelperKey,
            helper,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return helper
    }
}




@MainActor
private struct __UIStackViewDisposableClass {
    private static var hasExecuted = false
    static func runOnce(block: () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}

private class UIStackViewSeparatorHelper: NSObject {
    var color: UIColor = .white
    var size: CGSize = .zero
    weak var stackView: UIStackView?
    var separatorViews: [UIView] = []
    var cornerRadius: CGFloat = -1
    
    @MainActor func makeSeparators() {
        guard let stackView = stackView, !size.equalTo(.zero) else { return }
        __UIStackViewDisposableClass.runOnce(block: UIStackView.once)
        separatorViews.forEach { $0.removeFromSuperview() }
        separatorViews.removeAll()
        
        var previousView: UIView?
        
        for (index, currentView) in stackView.arrangedSubviews.enumerated() {
            guard index > 0 else {
                previousView = currentView
                continue
            }
            
            guard !currentView.isHidden else { continue }
            
            let separator = UIView()
            separator.backgroundColor = color
            if cornerRadius == -1 {
                if stackView.axis == .horizontal {
                    separator.layer.cornerRadius = size.width * 0.5
                }else {
                    separator.layer.cornerRadius = size.height * 0.5
                }
                separator.layer.masksToBounds = true
            }else if cornerRadius > 0 {
                separator.layer.cornerRadius = cornerRadius
                separator.layer.masksToBounds = true
            }
            
            if stackView.axis == .horizontal {
                let centerX = previousView!.frame.maxX + (currentView.frame.minX - previousView!.frame.maxX) * 0.5
                let x = centerX - size.width * 0.5
                let y = previousView!.center.y - size.height * 0.5
                separator.frame = CGRect(x: x, y: y, width: size.width, height: size.height)
            } else {
                let x = previousView!.center.x - size.width * 0.5
                let centerY = previousView!.frame.maxY + (currentView.frame.minY - previousView!.frame.maxY) * 0.5
                let y = centerY - size.height * 0.5
                separator.frame = CGRect(x: x, y: y, width: size.width, height: size.height)
            }
            
            stackView.addSubview(separator)
            separatorViews.append(separator)
            previousView = currentView
        }
    }
}
#endif
