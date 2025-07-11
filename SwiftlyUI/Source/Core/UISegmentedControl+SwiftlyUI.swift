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
    
}


#endif
