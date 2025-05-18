//
//  UIImageView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//
#if canImport(UIKit)
import UIKit

public typealias ImageView = UIImageView

// MARK: - basics
public extension UIImageView {
    
    convenience init(_ imageName: String, highlightedImageName: String? = nil) {
        self.init(imageName: imageName, highlightedImageName: highlightedImageName)
    }
    
    convenience init(imageName: String, highlightedImageName: String? = nil) {
        self.init(image: UIImage(named: imageName), highlightedImage: UIImage(named: highlightedImageName ?? ""))
    }
    
    @available(iOS 13.0, watchOS 6.0, *)
    convenience init(systemName: String) {
        self.init(image: UIImage(systemName: systemName))
    }
    
    @available(iOS 13.0, watchOS 6.0, *)
    @discardableResult
    func systemImage(_ systemName: String) -> Self {
        self.image = UIImage(systemName: systemName)
        return self
    }
    
    @discardableResult
    func imageName(_ imageName: String, highlightedImageName: String? = nil) -> Self {
        self.image = UIImage(named: imageName)
        if let highlightedImage = highlightedImageName {
            self.highlightedImage = UIImage(named: highlightedImage)
        }
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage, highlightedImage: UIImage? = nil) -> Self {
        self.image = image
        self.highlightedImage = highlightedImage
        return self
    }
    
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        return self
    }
    
    @discardableResult
    func gradientImage(colors: [UIColor], direction: GradientDirection, size: CGSize) -> Self {
        self.image = UIImage.gradient(colors: colors, direction: direction, size: size)
        return self
    }
    
    @discardableResult
    func highlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
}
#endif
