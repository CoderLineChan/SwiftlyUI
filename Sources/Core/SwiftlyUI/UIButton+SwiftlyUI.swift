//
//  UIButton+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//

import UIKit

// MARK: - basics
public extension UIButton {
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
       
    @discardableResult
    func imageName(_ imageName: String, state: UIControl.State = .normal) -> Self {
        self.setImage(UIImage(named: imageName), for: state)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImageName(_ imageName: String, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(UIImage(named: imageName), for: state)
        return self
    }
    
    @discardableResult
    func title(_ title: String, state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
}

@available(iOS 15.0, *)
public extension UIButton {
    @discardableResult
    func configuration(_ configuration: UIButton.Configuration) -> Self {
        self.configuration = configuration
        return self
    }
    
    @discardableResult
    func imagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        var config = self.configuration ?? .plain()
        config.imagePlacement = placement
        self.configuration = config
        return self
    }
    
    @discardableResult
    func imagePadding(_ padding: CGFloat) -> Self {
        var config = self.configuration ?? .plain()
        config.imagePadding = padding
        self.configuration = config
        return self
    }
    
    @discardableResult
    func titlePadding(_ padding: CGFloat) -> Self {
        var config = self.configuration ?? .plain()
        config.titlePadding = padding
        self.configuration = config
        return self
    }
    
    @discardableResult
    func titleAlignment(_ alignment: UIButton.Configuration.TitleAlignment) -> Self {
        var config = self.configuration ?? .plain()
        config.titleAlignment = alignment
        self.configuration = config
        return self
    }
}

// MARK: - ImagePosition
public extension UIButton {
    enum ImagePosition {
        case left
        case right
        case top
        case bottom
        
        var direction: NSDirectionalRectEdge {
            switch self {
            case .left: return .leading
            case .right: return .trailing
            case .top: return .top
            case .bottom: return .bottom
            }
        }
    }
    
    @discardableResult
    func resetImagePosition(_ position: ImagePosition = .left, withTitleSpacing spacing: CGFloat = 0) -> Self {
        
        if #available(iOS 15.0, *) {
            var config = self.configuration ?? .plain()
            config.imagePlacement = position.direction
            config.imagePadding = spacing
            self.configuration = config
            return self
        }else {
            guard let image = imageView?.image else { return self }
            let imageWidth = image.size.width
            let imageHeight = image.size.height
            
            var labelWidth: CGFloat = 0
            var labelHeight: CGFloat = 0
            
            labelWidth = titleLabel?.intrinsicContentSize.width ?? 0
            labelHeight = titleLabel?.intrinsicContentSize.height ?? 0
            
            var finalImageInsets = UIEdgeInsets.zero
            var finalLabelInsets = UIEdgeInsets.zero
            switch position {
            case .top:
                finalImageInsets = UIEdgeInsets(
                    top: -labelHeight - spacing / 2.0,
                    left: 0,
                    bottom: 0,
                    right: -labelWidth
                )
                finalLabelInsets = UIEdgeInsets(
                    top: 0,
                    left: -imageWidth,
                    bottom: -imageHeight - spacing / 2.0,
                    right: 0
                )
                
            case .left:
                finalImageInsets = UIEdgeInsets(
                    top: 0,
                    left: -spacing / 2.0,
                    bottom: 0,
                    right: spacing / 2.0
                )
                finalLabelInsets = UIEdgeInsets(
                    top: 0,
                    left: spacing / 2.0,
                    bottom: 0,
                    right: -spacing / 2.0
                )
                
            case .bottom:
                finalImageInsets = UIEdgeInsets(
                    top: 0,
                    left: 0,
                    bottom: -labelHeight - spacing / 2.0,
                    right: -labelWidth
                )
                finalLabelInsets = UIEdgeInsets(
                    top: -imageHeight - spacing / 2.0,
                    left: -imageWidth,
                    bottom: 0,
                    right: 0
                )
                
            case .right:
                finalImageInsets = UIEdgeInsets(
                    top: 0,
                    left: labelWidth + spacing / 2.0,
                    bottom: 0,
                    right: -labelWidth - spacing / 2.0
                )
                finalLabelInsets = UIEdgeInsets(
                    top: 0,
                    left: -imageWidth - spacing / 2.0,
                    bottom: 0,
                    right: imageWidth + spacing / 2.0
                )
            }
            
            imageEdgeInsets = finalImageInsets
            titleEdgeInsets = finalLabelInsets
            return self
        }
    }
}

