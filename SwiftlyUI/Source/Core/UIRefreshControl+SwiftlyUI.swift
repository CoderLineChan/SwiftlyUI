//
//  UIRefreshControl+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIRefreshControl {
    
    /// SwiftlyUI extension for `UIRefreshControl`.
    @discardableResult
    func attributedTitle(_ title: NSAttributedString?) -> Self {
        self.attributedTitle = title
        return self
    }
}


#endif
