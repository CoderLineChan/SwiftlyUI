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
    
    /// SwiftlyUI extension for `UIImageView`.
    convenience init(_ imageName: String, highlightedImageName: String? = nil) {
        self.init(imageName: imageName, highlightedImageName: highlightedImageName)
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    convenience init(imageName: String, highlightedImageName: String? = nil) {
        let highlightedImage: UIImage?
        if let name = highlightedImageName {
            highlightedImage = UIImage(named: name)
        }else {
            highlightedImage = nil
        }
        self.init(image: UIImage(named: imageName), highlightedImage: highlightedImage)
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    convenience init(systemName: String) {
        self.init(image: UIImage(systemName: systemName))
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func systemImage(_ systemName: String) -> Self {
        self.image = UIImage(systemName: systemName)
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func imageName(_ imageName: String, highlightedImageName: String? = nil) -> Self {
        self.image = UIImage(named: imageName)
        if let highlightedImage = highlightedImageName {
            self.highlightedImage = UIImage(named: highlightedImage)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func image(_ image: UIImage?, highlightedImage: UIImage? = nil) -> Self {
        self.image = image
        self.highlightedImage = highlightedImage
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func highlightedImage(_ image: UIImage?) -> Self {
        self.highlightedImage = image
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func gradientImage(colors: [UIColor], direction: GradientDirection, size: CGSize) -> Self {
        self.image = UIImage.gradient(colors: colors, direction: direction, size: size)
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func highlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> Self {
        self.preferredSymbolConfiguration = configuration
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func animationImages(_ images: [UIImage]?) -> Self {
        self.animationImages = images
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func highlightedAnimationImages(_ images: [UIImage]?) -> Self {
        self.highlightedAnimationImages = images
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func animationDuration(_ duration: TimeInterval) -> Self {
        self.animationDuration = duration
        return self
    }
    
    /// SwiftlyUI extension for `UIImageView`.
    @discardableResult
    func animationRepeatCount(_ count: Int) -> Self {
        self.animationRepeatCount = count
        return self
    }
    
#if swift(>=5.9)
    /// SwiftlyUI extension for `UIImageView`.
    @available(iOS 17.0, tvOS 17.0, *)
    @discardableResult
    func preferredImageDynamicRange(_ range: UIImage.DynamicRange) -> Self {
        self.preferredImageDynamicRange = range
        return self
    }
#endif
}
#endif
