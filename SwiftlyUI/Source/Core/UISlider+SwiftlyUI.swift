//
//  UISlider+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UISlider {
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func minimumValue(_ value: Float) -> Self {
        self.minimumValue = value
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func maximumValue(_ value: Float) -> Self {
        self.maximumValue = value
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func value(_ value: Float) -> Self {
        self.value = value
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func minimumValueImage(_ image: UIImage?) -> Self {
        self.minimumValueImage = image
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func maximumValueImage(_ image: UIImage?) -> Self {
        self.maximumValueImage = image
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func continuous(_ continuous: Bool) -> Self {
        self.isContinuous = continuous
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func minimumTrackTintColor(_ color: UIColor?) -> Self {
        self.minimumTrackTintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func maximumTrackTintColor(_ color: UIColor?) -> Self {
        self.maximumTrackTintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UISlider`.
    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        self.thumbTintColor = color
        return self
    }
    
}


#endif
