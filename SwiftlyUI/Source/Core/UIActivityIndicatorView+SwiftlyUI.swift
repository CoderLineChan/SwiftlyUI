//
//  UIActivityIndicatorView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/26.
//

#if canImport(UIKit)
import UIKit


public extension UIActivityIndicatorView {
    
    /// SwiftlyUI - Set style.
    @discardableResult
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }
    
    /// SwiftlyUI - Set color.
    @discardableResult
    func color(_ color: UIColor?) -> Self {
        self.color = color
        return self
    }
    
    /// SwiftlyUI - Set animating state.
    @discardableResult
    func animating(_ animating: Bool) -> Self {
        if animating {
            self.startAnimating()
        } else {
            self.stopAnimating()
        }
        return self
    }
    
    /// SwiftlyUI - Set hidesWhenStopped state.
    @discardableResult
    func hidesWhenStopped(_ hides: Bool) -> Self {
        self.hidesWhenStopped = hides
        return self
    }
}


#endif
