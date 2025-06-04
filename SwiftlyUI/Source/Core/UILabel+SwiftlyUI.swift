//
//  UILabel+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//
#if canImport(UIKit)
import UIKit


public final class Label: UILabel {
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: layoutMargins))
    }
    
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
    
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func numberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func lineBreak(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    
    @discardableResult
    func sizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func minimumScale(_ factor: CGFloat) -> Self {
        self.minimumScaleFactor = factor
        return self
    }
    
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
