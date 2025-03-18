//
//  UIImageExtension.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/8.
//

import UIKit

// MARK: - gradient Image from colors
public extension UIImage {
    enum GradientDirection {
        case topToBottom
        case bottomToTop
        case leftToRight
        case upleftToLowright
        case uprightToLowleft
    }
    static func gradient(colors: [UIColor], direction: GradientDirection, size: CGSize) -> UIImage? {
        guard !colors.isEmpty, size.width > 0, size.height > 0 else {
            return nil
        }
        
        let cgColors = colors.map { color -> CGColor in
            guard let convertedColor = color.cgColor.converted(
                to: CGColorSpace(name: CGColorSpace.sRGB)!,
                intent: .defaultIntent,
                options: nil
            ) else {
                return color.cgColor
            }
            return convertedColor
        }
        
        guard let colorSpace = cgColors.first?.colorSpace else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        context.clear(CGRect(origin: .zero, size: size))
        
        guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: cgColors as CFArray,
            locations: nil
        ) else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        let (start, end) = gradientPoints(for: direction, size: size)
        context.drawLinearGradient(
            gradient,
            start: start,
            end: end,
            options: [.drawsBeforeStartLocation, .drawsAfterEndLocation]
        )
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private static func gradientPoints(
        for direction: GradientDirection,
        size: CGSize) -> (start: CGPoint, end: CGPoint) {
        switch direction {
        case .topToBottom:
            return (CGPoint(x: 0, y: 0), CGPoint(x: 0, y: size.height))
        case .bottomToTop:
            return (CGPoint(x: 0, y: size.height), CGPoint(x: 0, y: 0))
        case .leftToRight:
            return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: 0))
        case .upleftToLowright:
            return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: size.height))
        case .uprightToLowleft:
            return (CGPoint(x: size.width, y: 0), CGPoint(x: 0, y: size.height))
        }
    }
}
