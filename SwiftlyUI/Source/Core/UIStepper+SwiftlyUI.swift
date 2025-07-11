//
//  UIStepper+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIStepper {
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func minimumValue(_ value: Double) -> Self {
        self.minimumValue = value
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func maximumValue(_ value: Double) -> Self {
        self.maximumValue = value
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func stepValue(_ value: Double) -> Self {
        self.stepValue = value
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func value(_ value: Double) -> Self {
        self.value = value
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func continuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func autorepeat(_ autorepeat: Bool) -> Self {
        self.autorepeat = autorepeat
        return self
    }
    
    /// SwiftlyUI extension for `UIStepper`.
    @discardableResult
    func wraps(_ wraps: Bool) -> Self {
        self.wraps = wraps
        return self
    }
}

#endif
