//
//  UIColor+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/20.
//

import UIKit


// MARK: - basics
public extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        if #available(iOS 13.0, tvOS 13.0, *) {
            self.init(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
        } else {
            self.init(cgColor: light.cgColor)
        }
    }
    
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor(light: light, dark: dark)
    }
    
    static func color(with hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        let cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
            .replacingOccurrences(of: "0x", with: "")
            .uppercased()
        
        if cString.count != 6 {
            return UIColor.clear
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static func hexColor(_ hexStr: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.color(with: hexStr, alpha: alpha)
    }
    
    static func random(_ alpha: CGFloat = 1.0) -> UIColor {
        let r: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let g: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let b: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    func image(withSize size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        
        return renderer.image { context in
            self.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    func opacity(_ value: CGFloat) -> UIColor {
        let alpha = max(0, min(value, 1))
        return withAlphaComponent(alpha)
    }
}


public extension UIColor {
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
