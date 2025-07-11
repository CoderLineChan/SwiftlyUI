//
//  CAGradientLayerExtension.swift
//  Pods
//
//  Created by CoderChan on 2025/5/9.
//
#if canImport(UIKit)
import UIKit

public extension CAGradientLayer {
    /// SwiftlyUI - Extension for `CAGradientLayer`. creates a gradient layer with specified colors and direction.
    static func gradient(colors: [UIColor], direction: GradientDirection) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        let (startPoint, endPoint) = direction.gradientPointsForLayer()
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        return gradientLayer
    }
}
#endif
