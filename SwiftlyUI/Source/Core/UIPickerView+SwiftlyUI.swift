//
//  UIPickerView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIPickerView {
    /// SwiftlyUI extension for `UIPickerView`.
    @discardableResult
    func delegate(_ delegate: UIPickerViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI extension for `UIPickerView`.
    @discardableResult
    func dataSource(_ dataSource: UIPickerViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    /// SwiftlyUI extension for `UIPickerView`.
    @available(iOS, introduced: 2.0, deprecated: 13.0, message: "This property has no effect on iOS 7 and later.")
    @discardableResult
    func showsSelectionIndicator(_ shows: Bool) -> Self {
        self.showsSelectionIndicator = shows
        return self
    }
}

#endif
