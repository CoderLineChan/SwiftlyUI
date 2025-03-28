//
//  UIStackView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/20.
//

import UIKit

#if swift(>=5.5)

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        @ViewBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.alignment = .center
        content().forEach { addArrangedSubview($0) }
    }
}
public final class VStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        get { .vertical }
        set { super.axis = .vertical }
    }
    
    @discardableResult
    convenience init(spacing: CGFloat = 0, @ViewBuilder content: () -> [UIView]) {
        self.init(axis: .vertical, spacing: spacing, content: content)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .vertical
    }
    
    @available(*, unavailable, message: "use init(spacing:content:)")
    convenience init(arrangedSubviews views: [UIView]) {
        fatalError("SwiftlyUI VStackView can not user init(arrangedSubviews:)")
    }
}


public final class HStackView: UIStackView {
    public override var axis: NSLayoutConstraint.Axis {
        get { .horizontal }
        set { super.axis = .horizontal }
    }
    
    @discardableResult
    convenience init(spacing: CGFloat = 0, @ViewBuilder content: () -> [UIView]) {
        self.init(axis: .horizontal, spacing: spacing, content: content)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.axis = .horizontal
    }
    
    @available(*, unavailable, message: "use init(spacing:content:)")
    convenience init(arrangedSubviews views: [UIView]) {
        fatalError("SwiftlyUI HStackView can not user init(arrangedSubviews:)")
    }

}



#endif



// MARK: - Layout
public extension UIStackView {
    
    @discardableResult
    override func padding(_ edge: UIEdgeInsets) -> Self {
        super.padding(edge)
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
}

// MARK: - separator
public extension UIStackView {
    @discardableResult
    func separator(color: UIColor, size: CGSize) -> Self {
        separatorColor = color
        separatorSize = size
        let min = min(size.width, size.height)
        separatorCornerRadius = min * 0.5
        return self
    }
    
    @discardableResult
    func separator(cornerRadius: CGFloat) -> Self {
        separatorCornerRadius = cornerRadius
        return self
    }
    
    var separatorColor: UIColor {
        get { separatorHelper.color }
        set {
            separatorHelper.color = newValue
            separatorHelper.makeSeparators()
        }
    }
    
    var separatorSize: CGSize {
        get { separatorHelper.size }
        set {
            separatorHelper.size = newValue
            separatorHelper.makeSeparators()
        }
    }
    
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
    var cornerRadius: CGFloat = 0
    
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
            if cornerRadius > 0 {
                separator.layer.cornerRadius = cornerRadius
                separator.layer.masksToBounds = true
            }
            
            if stackView.axis == .horizontal {
                let centerX = previousView!.frame.maxX + (currentView.frame.minX - previousView!.frame.maxX) * 0.5
                let x = centerX - size.width * 0.5
                let y = (previousView!.frame.height - size.height) * 0.5 + stackView.layoutMargins.top
                separator.frame = CGRect(x: x, y: y, width: size.width, height: size.height)
            } else {
                let x = (previousView!.frame.width - size.width) * 0.5 + stackView.layoutMargins.left
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
