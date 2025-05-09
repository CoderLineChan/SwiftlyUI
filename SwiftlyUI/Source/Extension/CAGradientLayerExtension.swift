//
//  CAGradientLayerExtension.swift
//  Pods
//
//  Created by CoderChan on 2025/5/9.
//

import UIKit

public extension CAGradientLayer {
    static func gradient(colors: [UIColor], direction: GradientDirection) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = UIColor.convertToCGColors(colors)
        let (startPoint, endPoint) = direction.gradientPointsForLayer()
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        return gradientLayer
    }
}
