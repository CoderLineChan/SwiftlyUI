//
//  UISlider+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UISlider {
    
    @discardableResult
    func minimumValue(_ value: Float) -> Self {
        self.minimumValue = value
        return self
    }
    
    @discardableResult
    func maximumValue(_ value: Float) -> Self {
        self.maximumValue = value
        return self
    }
    
    @discardableResult
    func value(_ value: Float) -> Self {
        self.value = value
        return self
    }
    
    @discardableResult
    func minimumValueImage(_ image: UIImage?) -> Self {
        self.minimumValueImage = image
        return self
    }
    
    @discardableResult
    func maximumValueImage(_ image: UIImage?) -> Self {
        self.maximumValueImage = image
        return self
    }
    
    @discardableResult
    func continuous(_ continuous: Bool) -> Self {
        self.isContinuous = continuous
        return self
    }
    
    @discardableResult
    func minimumTrackTintColor(_ color: UIColor?) -> Self {
        self.minimumTrackTintColor = color
        return self
    }
    
    @discardableResult
    func maximumTrackTintColor(_ color: UIColor?) -> Self {
        self.maximumTrackTintColor = color
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        self.thumbTintColor = color
        return self
    }
    
}


#endif
