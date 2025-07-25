//
//  UIImageExtension.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/8.
//
#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - gradient Image from colors
public extension UIImage {
    /// SwiftlyUI - 扩展 `UIImage`，用于从颜色数组创建渐变图像。
    /// SwiftlyUI - extension for `UIImage` to create a gradient image from an array of colors.
    static func gradient(colors: [UIColor], direction: GradientDirection, size: CGSize) -> UIImage? {
        guard !colors.isEmpty, size.width > 0, size.height > 0 else {
            return nil
        }
        
        let cgColors = UIColor.tosRGBCGColors(colors)
        guard let colorSpace = cgColors.first?.colorSpace else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.clear(CGRect(origin: .zero, size: size))
        
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: nil) else {
            return nil
        }
        
        let (start, end) = direction.gradientPointsForImage(size: size)
        context.drawLinearGradient(gradient, start: start, end: end, options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
#endif
