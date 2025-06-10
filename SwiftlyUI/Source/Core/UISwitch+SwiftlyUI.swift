//
//  UISwitch+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UISwitch {
    
    @discardableResult
    func onTintColor(_ color: UIColor?) -> Self {
        self.onTintColor = color
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ color: UIColor?) -> Self {
        self.thumbTintColor = color
        return self
    }
    
    @discardableResult
    func onImage(_ image: UIImage?) -> Self {
        self.onImage = image
        return self
    }
    
    @discardableResult
    func offImage(_ image: UIImage?) -> Self {
        self.offImage = image
        return self
    }
#if compiler(>=5.3)
    @available(iOS 14.0, *)
    @discardableResult
    func preferredStyle(_ style: UISwitch.Style) -> Self {
        self.preferredStyle = style
        return self
    }
#endif
    @discardableResult
    func isOn(_ on: Bool) -> Self {
        self.isOn = on
        return self
    }
   
}

#endif
