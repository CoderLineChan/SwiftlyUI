//
//  UIBackgroundConfiguration+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/5/9.
//
#if canImport(UIKit)
import UIKit

// 由于UIBackgroundConfiguration是iOS 14.0和watchOS 7.0引入的API
// 确保只在iOS 14/watchOS 7及以上版本编译
#if swift(>=5.5)
@available(iOS 14.0, watchOS 7.0, *)
public extension UIBackgroundConfiguration {
    
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    /// - Parameter content: A closure that builds an array of `UIView` elements to be used as the custom view.
    /// - Returns: A new `UIBackgroundConfiguration` instance with the custom view set.
    @discardableResult
    func customView(@SwiftlyUIBuilder content: () -> [UIView]) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.customView = content().last
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func customView(_ view: UIView?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.customView = view
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.cornerRadius = radius
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func backgroundInsets(_ insets: NSDirectionalEdgeInsets) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundInsets = insets
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func edgesAddingLayoutMargins(_ edges: NSDirectionalRectEdge) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.edgesAddingLayoutMarginsToBackgroundInsets = edges
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundColor = color
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func backgroundColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.backgroundColorTransformer = transformer
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func visualEffect(_ effect: UIVisualEffect?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.visualEffect = effect
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @available(iOS 15.0, watchOS 8.0, tvOS 15.0, *)
    @discardableResult
    func image(_ image: UIImage?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.image = image
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @available(iOS 15.0, watchOS 8.0, tvOS 15.0, *)
    @discardableResult
    func imageContentMode(_ mode: UIView.ContentMode) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.imageContentMode = mode
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func strokeColor(_ color: UIColor?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeColor = color
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func strokeColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeColorTransformer = transformer
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func strokeWidth(_ width: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeWidth = width
        return newConfig
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func strokeOutset(_ outset: CGFloat) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.strokeOutset = outset
        return newConfig
    }
    
    // MARK: - 阴影属性 (iOS 18+/watchOS 11+)
#if compiler(>=6.0)
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @available(iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
    @discardableResult
    func shadowProperties(_ properties: UIShadowProperties) -> UIBackgroundConfiguration {
        var newConfig = self
        newConfig.shadowProperties = properties
        return newConfig
    }
#endif
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
    @discardableResult
    func update(for state: UIConfigurationState) -> UIBackgroundConfiguration {
        self.updated(for: state)
    }
    
    /// SwiftlyUI extension for `UIBackgroundConfiguration`.
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
#endif

// iOS 13/watchOS 6兼容层，对于低于iOS 14/watchOS 7的版本提供空实现或替代实现
#if !swift(>=5.5) || compiler(<5.5)
// 提供一个空的UIBackgroundConfiguration实现，避免在iOS 13/watchOS 6上使用此API时编译错误
@available(iOS, introduced: 13.0, obsoleted: 14.0, message: "UIBackgroundConfiguration is only available in iOS 14.0 or newer")
@available(watchOS, introduced: 6.0, obsoleted: 7.0, message: "UIBackgroundConfiguration is only available in watchOS 7.0 or newer")
public class UIBackgroundConfiguration {
    // 空实现，iOS 13/watchOS 6上不应该使用这个类
}
#endif
#endif
