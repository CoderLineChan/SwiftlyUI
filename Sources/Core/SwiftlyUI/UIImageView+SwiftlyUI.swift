//
//  UIImageView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//

import UIKit

// MARK: - basics
public extension UIImageView {
    @available(iOS 13.0, *)
    @discardableResult
    func systemImage(_ systemName: String) -> Self {
        self.image = UIImage(systemName: systemName)
        return self
    }
    
    @discardableResult
    func imageName(_ imageName: String) -> Self {
        self.image = UIImage(named: imageName)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    @discardableResult
    func gradientImage(colors: [UIColor], direction: UIImage.GradientDirection, size: CGSize) -> Self {
        self.image = UIImage.gradient(colors: colors, direction: direction, size: size)
        return self
    }
}
