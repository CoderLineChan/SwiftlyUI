//
//  UIPageControl+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/8/14.
//

#if canImport(UIKit)
import UIKit


public extension UIPageControl {
    
    /// SwiftlyUI extension for `UIPageControl`.
    @discardableResult
    func numberOfPages(_ page: Int) -> Self {
        self.numberOfPages = page
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @discardableResult
    func currentPage(_ page: Int) -> Self {
        self.currentPage = page
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @discardableResult
    func hidesForSinglePage(_ hides: Bool) -> Self {
        self.hidesForSinglePage = hides
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @discardableResult
    func pageIndicatorTintColor(_ color: UIColor?) -> Self {
        self.pageIndicatorTintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @discardableResult
    func currentPageIndicatorTintColor(_ color: UIColor?) -> Self {
        self.currentPageIndicatorTintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS, introduced: 2.0, deprecated: 14.0, message: "defersCurrentPageDisplay no longer does anything reasonable with the new interaction mode.")
    @discardableResult
    func defersCurrentPageDisplay(_ defers: Bool) -> Self {
        self.defersCurrentPageDisplay = defers
        return self
    }
    
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 14.0, *)
    @discardableResult
    func backgroundStyle(_ style: UIPageControl.BackgroundStyle) -> Self {
        self.backgroundStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 14.0, *)
    @discardableResult
    func allowsContinuousInteraction(_ allows: Bool) -> Self {
        self.allowsContinuousInteraction = allows
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 14.0, *)
    @discardableResult
    func preferredIndicatorImage(_ image: UIImage?) -> Self {
        self.preferredIndicatorImage = image
        return self
    }
#endif
#if compiler(>=5.7)
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 16.0, *)
    @discardableResult
    func preferredCurrentPageIndicatorImage(_ image: UIImage?) -> Self {
        self.preferredCurrentPageIndicatorImage = image
        return self
    }
    
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 16.0, *)
    @discardableResult
    func direction(_ direction: UIPageControl.Direction) -> Self {
        self.direction = direction
        return self
    }
#endif
    
#if compiler(>=5.9)
    /// SwiftlyUI extension for `UIPageControl`.
    @available(iOS 17.0, *)
    @discardableResult
    func progress(_ progress: UIPageControlProgress?) -> Self {
        self.progress = progress
        return self
    }
#endif
}


#endif
