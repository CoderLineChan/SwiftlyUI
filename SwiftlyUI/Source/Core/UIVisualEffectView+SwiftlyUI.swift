//
//  UIVisualEffectView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UIVisualEffectView {
    /// SwiftlyUI extension for `UIVisualEffectView`.
    @discardableResult
    func effect(_ effect: UIVisualEffect?) -> Self {
        self.effect = effect
        return self
    }
}

#endif
