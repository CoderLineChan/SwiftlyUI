//
//  UISegmentedControl+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit


public extension UISegmentedControl {
    
    @discardableResult
    func apportionsSegmentWidthsByContent(_ apportions: Bool) -> Self {
        self.apportionsSegmentWidthsByContent = apportions
        return self
    }
    
    @discardableResult
    func momentary(_ momentary: Bool) -> Self {
        self.isMomentary = momentary
        return self
    }
    
    @discardableResult
    func selectedSegmentIndex(_ index: Int) -> Self {
        self.selectedSegmentIndex = index
        return self
    }
    
    @discardableResult
    func selectedSegmentTintColor(_ color: UIColor?) -> Self {
        self.selectedSegmentTintColor = color
        return self
    }
    
}


#endif
