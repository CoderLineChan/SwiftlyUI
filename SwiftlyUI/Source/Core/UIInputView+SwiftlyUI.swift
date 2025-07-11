//
//  UIInputView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIInputView {
    /// SwiftlyUI extension for `UIInputView`.
    @discardableResult
    func allowsSelfSizing(_ allows: Bool) -> Self {
        self.allowsSelfSizing = allows
        return self
    }
}

#endif
