//
//  UIBackgroundConfiguration+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/5/9.
//

import UIKit

@available(iOS 14.0, *)
public extension UIBackgroundConfiguration {
    
    @discardableResult
    func customView(@ViewBuilder content: () -> [UIView]) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.customView = content().last
        return newConfig
    }
    
    @discardableResult
    func customView(_ view: UIView?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.customView = view
        return newConfig
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.cornerRadius = radius
        return newConfig
    }
    
    @discardableResult
    func backgroundInsets(_ insets: NSDirectionalEdgeInsets) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundInsets = insets
        return newConfig
    }
    
    @discardableResult
    func edgesAddingLayoutMargins(_ edges: NSDirectionalRectEdge) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.edgesAddingLayoutMarginsToBackgroundInsets = edges
        return newConfig
    }
    
    // MARK: - 背景颜色相关
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundColor = color
        return newConfig
    }
    
    @discardableResult
    func backgroundColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundColorTransformer = transformer
        return newConfig
    }
    
    // MARK: - 视觉效果
    
    @discardableResult
    func visualEffect(_ effect: UIVisualEffect?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.visualEffect = effect
        return newConfig
    }
    
    // MARK: - 图片配置 (iOS 15+)
    @available(iOS 15.0, tvOS 15.0, *)
    @discardableResult
    func image(_ image: UIImage?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.image = image
        return newConfig
    }
    
    @available(iOS 15.0, tvOS 15.0, *)
    @discardableResult
    func imageContentMode(_ mode: UIView.ContentMode) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.imageContentMode = mode
        return newConfig
    }
    
    // MARK: - 边框样式
    
    @discardableResult
    func strokeColor(_ color: UIColor?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeColor = color
        return newConfig
    }
    
    @discardableResult
    func strokeColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeColorTransformer = transformer
        return newConfig
    }
    
    @discardableResult
    func strokeWidth(_ width: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeWidth = width
        return newConfig
    }
    
    @discardableResult
    func strokeOutset(_ outset: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeOutset = outset
        return newConfig
    }
    
    // MARK: - 阴影属性 (iOS 18+)
    
    @available(iOS 18.0, tvOS 18.0, visionOS 2.0, *)
    @discardableResult
    func shadowProperties(_ properties: UIShadowProperties) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.shadowProperties = properties
        return newConfig
    }
    
    // MARK: - 便捷方法
    
    /// 链式更新状态配置
    @discardableResult
    func update(for state: UIConfigurationState) -> UIBackgroundConfiguration {
        self.updated(for: state)
    }
    
    /// 便捷设置背景边距（简化版）
    @discardableResult
    func backgroundInsets(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundInsets = NSDirectionalEdgeInsets(
            top: top,
            leading: leading,
            bottom: bottom,
            trailing: trailing
        )
        return newConfig
    }
}
