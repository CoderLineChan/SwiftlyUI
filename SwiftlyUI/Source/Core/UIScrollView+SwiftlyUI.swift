//
//  UIScrollView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/4.
//

#if canImport(UIKit)
import UIKit

public extension UIScrollView {
    @discardableResult
    func contentOffset(_ offset: CGPoint) -> Self {
        self.contentOffset = offset
        return self
    }
    
    @discardableResult
    func contentSize(_ size: CGSize) -> Self {
        self.contentSize = size
        return self
    }
    
    @discardableResult
    func contentInset(_ inset: UIEdgeInsets) -> Self {
        self.contentInset = inset
        return self
    }
    
    @discardableResult
    func contentInsetAdjustmentBehavior(_ behavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = behavior
        return self
    }
    
    @discardableResult
    func automaticallyAdjustsScrollIndicatorInsets(_ adjusts: Bool) -> Self {
        self.automaticallyAdjustsScrollIndicatorInsets = adjusts
        return self
    }
    
    @discardableResult
    func directionalLockEnabled(_ enabled: Bool) -> Self {
        self.isDirectionalLockEnabled = enabled
        return self
    }
    
    @discardableResult
    func bounces(_ enabled: Bool) -> Self {
        self.bounces = enabled
        return self
    }
    
    @discardableResult
    func alwaysBounceVertical(_ enabled: Bool) -> Self {
        self.alwaysBounceVertical = enabled
        return self
    }
    
    @discardableResult
    func alwaysBounceHorizontal(_ enabled: Bool) -> Self {
        self.alwaysBounceHorizontal = enabled
        return self
    }
    
    @discardableResult
    func pagingEnabled(_ enabled: Bool) -> Self {
        self.isPagingEnabled = enabled
        return self
    }
    
    @discardableResult
    func scrollEnabled(_ enabled: Bool) -> Self {
        self.isScrollEnabled = enabled
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ enabled: Bool) -> Self {
        self.showsVerticalScrollIndicator = enabled
        return self
    }
    
    @discardableResult
    func showsHorizontalScrollIndicator(_ enabled: Bool) -> Self {
        self.showsHorizontalScrollIndicator = enabled
        return self
    }
    
    @discardableResult
    func indicatorStyle(_ style: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = style
        return self
    }
    
    @discardableResult
    func verticalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.verticalScrollIndicatorInsets = insets
        return self
    }
    
    @discardableResult
    func horizontalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.horizontalScrollIndicatorInsets = insets
        return self
    }
    
    @discardableResult
    func scrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = insets
        return self
    }
    
    @discardableResult
    func decelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = rate
        return self
    }
    
    @discardableResult
    func indexDisplayMode(_ mode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = mode
        return self
    }
    
    @discardableResult
    func delaysContentTouches(_ enabled: Bool) -> Self {
        self.delaysContentTouches = enabled
        return self
    }
    
    @discardableResult
    func canCancelContentTouches(_ enabled: Bool) -> Self {
        self.canCancelContentTouches = enabled
        return self
    }
    
    @discardableResult
    func minimumZoomScale(_ scale: CGFloat) -> Self {
        self.minimumZoomScale = scale
        return self
    }
    
    @discardableResult
    func maximumZoomScale(_ scale: CGFloat) -> Self {
        self.maximumZoomScale = scale
        return self
    }
    
    @discardableResult
    func zoomScale(_ scale: CGFloat) -> Self {
        self.zoomScale = scale
        return self
    }
    
    @discardableResult
    func bouncesZoom(_ enabled: Bool) -> Self {
        self.bouncesZoom = enabled
        return self
    }
    
    @discardableResult
    func scrollsToTop(_ enabled: Bool) -> Self {
        self.scrollsToTop = enabled
        return self
    }
    
    @discardableResult
    func keyboardDismissMode(_ mode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = mode
        return self
    }
    
    @discardableResult
    func refreshControl(_ control: UIRefreshControl?) -> Self {
        self.refreshControl = control
        return self
    }
#if compiler(>=5.9)
    @available(iOS 17.4, *)
    @discardableResult
    func contentAlignmentPoint(_ point: CGPoint) -> Self {
        self.contentAlignmentPoint = point
        return self
    }
    
    @available(iOS 17.4, *)
    @discardableResult
    func bouncesHorizontally(_ enabled: Bool) -> Self {
        self.bouncesHorizontally = enabled
        return self
    }
    
    @available(iOS 17.4, *)
    @discardableResult
    func bouncesVertically(_ enabled: Bool) -> Self {
        self.bouncesVertically = enabled
        return self
    }
    
    @available(iOS 17.4, *)
    @discardableResult
    func transfersHorizontalScrollingToParent(_ enabled: Bool) -> Self {
        self.transfersHorizontalScrollingToParent = enabled
        return self
    }
    
    @available(iOS 17.4, *)
    @discardableResult
    func transfersVerticalScrollingToParent(_ enabled: Bool) -> Self {
        self.transfersVerticalScrollingToParent = enabled
        return self
    }
    
    @available(iOS 17.0, *)
    @discardableResult
    func allowsKeyboardScrolling(_ enabled: Bool) -> Self {
        self.allowsKeyboardScrolling = enabled
        return self
    }
#endif
}

public final class HScrollView: UIScrollView {
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
    
    override public var contentOffset: CGPoint {
        get { super.contentOffset }
        set {
            var modifiedOffset = newValue
            modifiedOffset.y = -contentInset.top
            super.contentOffset = modifiedOffset
        }
    }
    
    override public func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        var lockedOffset = contentOffset
        lockedOffset.y = -contentInset.top
        super.setContentOffset(lockedOffset, animated: animated)
    }
}

public final class VScrollView: UIScrollView {
    public convenience init(@SwiftlyUIBuilder content: () -> [UIView]) {
        self.init(frame: .zero)
        showsHorizontalScrollIndicator(false)
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
    
    override public var contentOffset: CGPoint {
        get { super.contentOffset }
        set {
            var modifiedOffset = newValue
            modifiedOffset.x = -contentInset.left
            super.contentOffset = modifiedOffset
        }
    }
    
    override public func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        var lockedOffset = contentOffset
        lockedOffset.x = -contentInset.left
        super.setContentOffset(lockedOffset, animated: animated)
    }
}






#endif
