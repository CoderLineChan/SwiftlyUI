//
//  UIActivityIndicatorView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/26.
//

#if canImport(UIKit)
import UIKit


public extension UIActivityIndicatorView {
    @discardableResult
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }
    
    @discardableResult
    func color(_ color: UIColor?) -> Self {
        self.color = color
        return self
    }
    
    @discardableResult
    func animating(_ animating: Bool) -> Self {
        if animating {
            self.startAnimating()
        } else {
            self.stopAnimating()
        }
        return self
    }
    
    @discardableResult
    func hidesWhenStopped(_ hides: Bool) -> Self {
        self.hidesWhenStopped = hides
        return self
    }
}


#endif
