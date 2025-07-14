//
//  UIColor+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/20.
//

import Foundation
#if canImport(UIKit) && os(iOS)
import UIKit


// MARK: - basics
public extension UIColor {
    /// SwiftlyUI - Create Color with light and dark mode support.
    convenience init(light: UIColor, dark: UIColor) {
        self.init(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
    }
    
    /// SwiftlyUI - Create Color with light and dark mode support.
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor(light: light, dark: dark)
    }
    
    /// SwiftlyUI - Create Color with hex string.
    convenience init?(hexStr: String, alpha: CGFloat = 1) {
        var string = ""
        let lowercaseHexStr = hexStr.lowercased()
        if lowercaseHexStr.hasPrefix("0x") {
            string = lowercaseHexStr.replacingOccurrences(of: "0x", with: "")
        } else if hexStr.hasPrefix("#") {
            string = hexStr.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexStr
        }
        if string.count == 3 {
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }
        guard let hexValue = Int(string, radix: 16) else { return nil }

        var tran = alpha
        if tran < 0 { tran = 0 }
        if tran > 1 { tran = 1 }

        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        self.init(r: red, g: green, b: blue, alpha: tran)
    }
    
    /// SwiftlyUI - Create Color with hex integer.
    convenience init?(hexInt: Int, alpha: CGFloat = 1) {
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = (hexInt >> 16) & 0xFF
        let green = (hexInt >> 8) & 0xFF
        let blue = hexInt & 0xFF
        self.init(r: red, g: green, b: blue, alpha: trans)
    }
    
    /// SwiftlyUI - Create Color with RGB values.
    convenience init?(r: Int, g: Int, b: Int, alpha: CGFloat = 1) {
        guard r >= 0, r <= 255 else { return nil }
        guard g >= 0, g <= 255 else { return nil }
        guard b >= 0, b <= 255 else { return nil }

        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: trans)
    }
    
    /// SwiftlyUI - Create Color with hex string.
    static func color(withHexStr hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hexStr: hex, alpha: alpha) ?? UIColor.clear
    }
    
    /// SwiftlyUI -  Create Color with hex Int.
    static func color(withHexInt hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hexInt: hex, alpha: alpha) ?? UIColor.clear
    }
    
    /// SwiftlyUI - Create Color with hex string.
    static func hexColor(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.color(withHexStr: hex, alpha: alpha)
    }
    
    /// SwiftlyUI -  Create Color with hex Int.
    static func hexIntColor(_ hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.color(withHexInt: hex, alpha: alpha)
    }
    
    /// SwiftlyUI - Create random color.
    static func random(_ alpha: CGFloat = 1.0) -> UIColor {
        let r: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let g: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let b: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    /// SwiftlyUI - Create random color.
    static var random: UIColor {
        let r = Int.random(in: 0...255)
        let g = Int.random(in: 0...255)
        let b = Int.random(in: 0...255)
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
    
    /// SwiftlyUI - coverts `UIColor` to `UIImage`.
    func image(withSize size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        
        return renderer.image { context in
            self.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    /// SwiftlyUI - Set the opacity of the color.
    func opacity(_ value: CGFloat) -> UIColor {
        let alpha = max(0, min(value, 1))
        return withAlphaComponent(alpha)
    }
}


public extension UIColor {
    /// SwiftlyUI - Converts an array of `UIColor` to an array of `CGColor` in sRGB color space.
    static func tosRGBCGColors(_ colors: [UIColor]) -> [CGColor] {
        return colors.map { color -> CGColor in
            guard let convertedColor = color.cgColor.converted(
                to: CGColorSpace(name: CGColorSpace.sRGB)!,
                intent: .defaultIntent,
                options: nil
            ) else {
                return color.cgColor
            }
            return convertedColor
        }
    }
}
#endif
