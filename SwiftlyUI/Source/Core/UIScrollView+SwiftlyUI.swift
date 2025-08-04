//
//  UIScrollView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/4.
//

#if canImport(UIKit)
import UIKit

public extension UIScrollView {
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func contentOffset(_ offset: CGPoint) -> Self {
        self.contentOffset = offset
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func contentSize(_ size: CGSize) -> Self {
        self.contentSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func contentInset(_ inset: UIEdgeInsets) -> Self {
        self.contentInset = inset
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func contentInsetAdjustmentBehavior(_ behavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = behavior
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func automaticallyAdjustsScrollIndicatorInsets(_ adjusts: Bool) -> Self {
        self.automaticallyAdjustsScrollIndicatorInsets = adjusts
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func directionalLockEnabled(_ enabled: Bool) -> Self {
        self.isDirectionalLockEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func bounces(_ enabled: Bool) -> Self {
        self.bounces = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func delegate(_ delegate: UIScrollViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func alwaysBounceVertical(_ enabled: Bool) -> Self {
        self.alwaysBounceVertical = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func alwaysBounceHorizontal(_ enabled: Bool) -> Self {
        self.alwaysBounceHorizontal = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func pagingEnabled(_ enabled: Bool) -> Self {
        self.isPagingEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func scrollEnabled(_ enabled: Bool) -> Self {
        self.isScrollEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func showsVerticalScrollIndicator(_ enabled: Bool) -> Self {
        self.showsVerticalScrollIndicator = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func showsHorizontalScrollIndicator(_ enabled: Bool) -> Self {
        self.showsHorizontalScrollIndicator = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func indicatorStyle(_ style: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func verticalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.verticalScrollIndicatorInsets = insets
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func horizontalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.horizontalScrollIndicatorInsets = insets
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func scrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = insets
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func decelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = rate
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func indexDisplayMode(_ mode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func delaysContentTouches(_ enabled: Bool) -> Self {
        self.delaysContentTouches = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func canCancelContentTouches(_ enabled: Bool) -> Self {
        self.canCancelContentTouches = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func minimumZoomScale(_ scale: CGFloat) -> Self {
        self.minimumZoomScale = scale
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func maximumZoomScale(_ scale: CGFloat) -> Self {
        self.maximumZoomScale = scale
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func zoomScale(_ scale: CGFloat) -> Self {
        self.zoomScale = scale
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func bouncesZoom(_ enabled: Bool) -> Self {
        self.bouncesZoom = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func scrollsToTop(_ enabled: Bool) -> Self {
        self.scrollsToTop = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func keyboardDismissMode(_ mode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @discardableResult
    func refreshControl(_ control: UIRefreshControl?) -> Self {
        self.refreshControl = control
        return self
    }
#if compiler(>=5.9)
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.4, *)
    @discardableResult
    func contentAlignmentPoint(_ point: CGPoint) -> Self {
        self.contentAlignmentPoint = point
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.4, *)
    @discardableResult
    func bouncesHorizontally(_ enabled: Bool) -> Self {
        self.bouncesHorizontally = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.4, *)
    @discardableResult
    func bouncesVertically(_ enabled: Bool) -> Self {
        self.bouncesVertically = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.4, *)
    @discardableResult
    func transfersHorizontalScrollingToParent(_ enabled: Bool) -> Self {
        self.transfersHorizontalScrollingToParent = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.4, *)
    @discardableResult
    func transfersVerticalScrollingToParent(_ enabled: Bool) -> Self {
        self.transfersVerticalScrollingToParent = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UIScrollView`.
    @available(iOS 17.0, *)
    @discardableResult
    func allowsKeyboardScrolling(_ enabled: Bool) -> Self {
        self.allowsKeyboardScrolling = enabled
        return self
    }
#endif
}

public final class HScrollView: UIScrollView {
    /// SwiftlyUI extension for `UIScrollView`.
    public convenience init(@SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        showsVerticalScrollIndicator(false)
        directionalLockEnabled(true)
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
    
    /// SwiftlyUI override for `UIScrollView`.
    override public var contentOffset: CGPoint {
        get { super.contentOffset }
        set {
            var modifiedOffset = newValue
            modifiedOffset.y = -contentInset.top
            super.contentOffset = modifiedOffset
        }
    }
    /// SwiftlyUI override for `UIScrollView`.
    override public func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        var lockedOffset = contentOffset
        lockedOffset.y = -contentInset.top
        super.setContentOffset(lockedOffset, animated: animated)
    }
}

public final class VScrollView: UIScrollView {
    /// SwiftlyUI extension for `UIScrollView`.
    public convenience init(@SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        showsHorizontalScrollIndicator(false)
        alwaysBounceVertical(true)
        directionalLockEnabled(true)
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
    
    /// SwiftlyUI override for `UIScrollView`.
    override public var contentOffset: CGPoint {
        get { super.contentOffset }
        set {
            var modifiedOffset = newValue
            modifiedOffset.x = -contentInset.left
            super.contentOffset = modifiedOffset
        }
    }
    
    /// SwiftlyUI override for `UIScrollView`.
    override public func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        var lockedOffset = contentOffset
        lockedOffset.x = -contentInset.left
        super.setContentOffset(lockedOffset, animated: animated)
    }
}






#endif
