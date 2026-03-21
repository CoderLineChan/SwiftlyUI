//
//  UISegmentedControl+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit


public extension UISegmentedControl {
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func apportionsSegmentWidthsByContent(_ apportions: Bool) -> Self {
        self.apportionsSegmentWidthsByContent = apportions
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func momentary(_ momentary: Bool) -> Self {
        self.isMomentary = momentary
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func selectedSegmentIndex(_ index: Int) -> Self {
        self.selectedSegmentIndex = index
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func selectedSegmentTintColor(_ color: UIColor?) -> Self {
        self.selectedSegmentTintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func insertSegment(title: String?, at index: Int, animated: Bool = false) -> Self {
        self.insertSegment(withTitle: title, at: index, animated: animated)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func insertSegment(image: UIImage?, at index: Int, animated: Bool = false) -> Self {
        self.insertSegment(with: image, at: index, animated: animated)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func title(_ title: String?, forSegmentAt index: Int) -> Self {
        self.setTitle(title, forSegmentAt: index)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func image(_ image: UIImage?, forSegmentAt index: Int) -> Self {
        self.setImage(image, forSegmentAt: index)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func width(_ width: CGFloat, forSegmentAt index: Int) -> Self {
        self.setWidth(width, forSegmentAt: index)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func contentOffset(_ offset: CGSize, forSegmentAt index: Int) -> Self {
        self.setContentOffset(offset, forSegmentAt: index)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func enabled(_ enabled: Bool, forSegmentAt index: Int) -> Self {
        self.setEnabled(enabled, forSegmentAt: index)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func titleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for state: UIControl.State) -> Self {
        self.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State, barMetrics: UIBarMetrics = .default) -> Self {
        self.setBackgroundImage(image, for: state, barMetrics: barMetrics)
        return self
    }
    
    /// SwiftlyUI extension for `UISegmentedControl`.
    @discardableResult
    func dividerImage(_ image: UIImage?, leftSegmentState: UIControl.State, rightSegmentState: UIControl.State, barMetrics: UIBarMetrics = .default) -> Self {
        self.setDividerImage(image, forLeftSegmentState: leftSegmentState, rightSegmentState: rightSegmentState, barMetrics: barMetrics)
        return self
    }
    
}


#endif
