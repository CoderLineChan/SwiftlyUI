//
//  UILabel+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//

#if canImport(UIKit)
import UIKit

/// SwiftlyUI extension for `UILabel`.
public final class Label: UILabel {
    
    /// SwiftlyUI override - The layout margins for the label.
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: layoutMargins))
    }
    
    /// SwiftlyUI override - The layout margins for the label.
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + layoutMargins.left + layoutMargins.right,
            height: size.height + layoutMargins.top + layoutMargins.bottom
        )
    }
}

// MARK: - basics
public extension UILabel {
    
    /// SwiftlyUI extension for `UILabel`.
    convenience init(_ text: String?) {
        self.init()
        self.text = text
    }
    
    /// SwiftlyUI extension for `UILabel`.
    convenience init(_ attributedText: NSAttributedString?) {
        self.init()
        self.attributedText = attributedText
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @available(iOS 15, *)
    convenience init(_ attributedString: AttributedString?) {
        self.init()
        if let attributedString {
            self.attributedText = NSAttributedString(attributedString)
        }
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func numberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func attributedText(_ text: NSAttributedString?) -> Self {
        self.attributedText = text
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @available(iOS 15, *)
    @discardableResult
    func attributedString(_ string: AttributedString?) -> Self {
        if let string = string {
            self.attributedText = NSAttributedString(string)
        }else {
            self.attributedText = nil
        }
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func lineBreak(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func sizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjusts
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func minimumScale(_ factor: CGFloat) -> Self {
        self.minimumScaleFactor = factor
        return self
    }
    
    /// SwiftlyUI extension for `UILabel`.
    @discardableResult
    func lineSpacing(_ spacing: CGFloat, wordSpacing: CGFloat = 0) -> Self {
        if let text = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = spacing
            paragraphStyle.alignment = self.textAlignment
            paragraphStyle.lineBreakMode = self.lineBreakMode
            
            var attributeDict: [NSAttributedString.Key: Any] = [:]
            attributeDict[NSAttributedString.Key.paragraphStyle] = paragraphStyle
            attributeDict[NSAttributedString.Key.font] = font
            attributeDict[NSAttributedString.Key.foregroundColor] = textColor
            if wordSpacing > 0 {
                attributeDict[NSAttributedString.Key.kern] = wordSpacing
            }
            let attributes = NSAttributedString(string: text, attributes: attributeDict)
            attributedText = attributes
        }
        return self
    }
    
}
#endif
