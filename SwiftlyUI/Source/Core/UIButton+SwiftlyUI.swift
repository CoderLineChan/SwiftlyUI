//
//  UIButton+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/27.
//

import UIKit

// MARK: - basics
public extension UIButton {
    convenience init(_ text: String) {
        self.init()
        self.title(text)
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
       
    @discardableResult
    func imageName(_ imageName: String, state: UIControl.State = .normal) -> Self {
        self.setImage(UIImage(named: imageName), for: state)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImageName(_ imageName: String, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(UIImage(named: imageName), for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ color: UIColor?, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(color?.image(), for: state)
        return self
    }
    
    @discardableResult
    func title(_ title: String, state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func foregroundColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
}


// MARK: - ImagePosition
public extension UIButton {
    enum ImagePosition {
        case left
        case right
        case top
        case bottom
    }
    
    @discardableResult
    func resetImagePosition(_ position: ImagePosition = .left, withTitleSpacing spacing: CGFloat = 0) -> Self {
        guard let image = imageView?.image else { return self }
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        var labelWidth: CGFloat = 0
        var labelHeight: CGFloat = 0
        
        labelWidth = titleLabel?.intrinsicContentSize.width ?? 0
        labelHeight = titleLabel?.intrinsicContentSize.height ?? 0
        
        var finalImageInsets = UIEdgeInsets.zero
        var finalLabelInsets = UIEdgeInsets.zero
        switch position {
        case .top:
            finalImageInsets = UIEdgeInsets(
                top: -labelHeight - spacing / 2.0,
                left: 0,
                bottom: 0,
                right: -labelWidth
            )
            finalLabelInsets = UIEdgeInsets(
                top: 0,
                left: -imageWidth,
                bottom: -imageHeight - spacing / 2.0,
                right: 0
            )
            
        case .left:
            finalImageInsets = UIEdgeInsets(
                top: 0,
                left: -spacing / 2.0,
                bottom: 0,
                right: spacing / 2.0
            )
            finalLabelInsets = UIEdgeInsets(
                top: 0,
                left: spacing / 2.0,
                bottom: 0,
                right: -spacing / 2.0
            )
            
        case .bottom:
            finalImageInsets = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: -labelHeight - spacing / 2.0,
                right: -labelWidth
            )
            finalLabelInsets = UIEdgeInsets(
                top: -imageHeight - spacing / 2.0,
                left: -imageWidth,
                bottom: 0,
                right: 0
            )
            
        case .right:
            finalImageInsets = UIEdgeInsets(
                top: 0,
                left: labelWidth + spacing / 2.0,
                bottom: 0,
                right: -labelWidth - spacing / 2.0
            )
            finalLabelInsets = UIEdgeInsets(
                top: 0,
                left: -imageWidth - spacing / 2.0,
                bottom: 0,
                right: imageWidth + spacing / 2.0
            )
        }
        
        imageEdgeInsets = finalImageInsets
        titleEdgeInsets = finalLabelInsets
        return self
    }
}

@available(iOS 15.0, *)
public extension UIButton {
    
    convenience init(configuration: () -> UIButton.Configuration) {
        self.init(configuration: configuration())
    }
    
    @discardableResult
    func configuration(_ builder: () -> UIButton.Configuration, state: UIButton.State = .normal) -> Self {
        configuration(builder(), state: state)
        return self
    }
    
    @discardableResult
    func configuration(_ configuration: UIButton.Configuration, state: UIButton.State = .normal) -> Self {
        stateConfigurations[state.rawValue] = configuration
        if state == .normal {
            self.configuration = configuration
            return self
        }
        setupConfigurationUpdateHandler()
        return self
    }
    
    @discardableResult
    func configurationUpdateHandler(_ handler: @escaping (UIButton) -> Void) -> Self {
        self.configurationUpdateHandler = handler
        return self
    }
}

@available(iOS 15.0, *)
public extension UIButton.Configuration {
    static func plain(title: String, subtitle: String = "") -> Self {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.subtitle = subtitle
        return config
    }
    
    static func filled(title: String, subtitle: String = "") -> Self {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.subtitle = subtitle
        return config
    }
    
    @discardableResult
    func title(_ title: String) -> Self {
        var newConfig = self
        newConfig.title = title
        return newConfig
    }
    
    @discardableResult
    func titleTextAttributesTransformer(_ transformer: UIConfigurationTextAttributesTransformer) -> Self {
        var newConfig = self
        newConfig.titleTextAttributesTransformer = transformer
        return newConfig
    }
    
    @discardableResult
    func attributedTitle(_ title: AttributedString) -> Self {
        var newConfig = self
        newConfig.attributedTitle = title
        return newConfig
    }
    
    @discardableResult
    func attributedTitle(_ title: String, font: UIFont) -> Self {
        var newConfig = self
        var attributedTitle = AttributedString(title)
        attributedTitle.font = font
        newConfig.attributedTitle = attributedTitle
        return newConfig
    }
    
    @discardableResult
    func attributedSubTitle(_ title: AttributedString) -> Self {
        var newConfig = self
        newConfig.attributedSubtitle = title
        return newConfig
    }
    
    @discardableResult
    func attributedSubTitle(_ title: String, font: UIFont) -> Self {
        var newConfig = self
        var attributedTitle = AttributedString(title)
        attributedTitle.font = font
        newConfig.attributedSubtitle = attributedTitle
        return newConfig
    }
    
    
    @discardableResult
    func subtitle(_ subtitle: String) -> Self {
        var newConfig = self
        newConfig.subtitle = subtitle
        return newConfig
    }
    
    @discardableResult
    func subtitleTextAttributesTransformer(_ transformer: UIConfigurationTextAttributesTransformer) -> Self {
        var newConfig = self
        newConfig.subtitleTextAttributesTransformer = transformer
        return newConfig
    }

    
    @discardableResult
    func image(systemName: String) -> Self {
        var newConfig = self
        newConfig.image = UIImage(systemName: systemName)
        return newConfig
    }
    
    @discardableResult
    func image(_ image: UIImage) -> Self {
        var newConfig = self
        newConfig.image = image
        return newConfig
    }
    
    @discardableResult
    func imagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        var newConfig = self
        newConfig.imagePlacement = placement
        return newConfig
    }
    
    @discardableResult
    func imagePadding(_ padding: CGFloat) -> Self {
        var newConfig = self
        newConfig.imagePadding = padding
        return newConfig
    }
    
    @discardableResult
    func baseForegroundColor(_ color: UIColor) -> Self {
        var newConfig = self
        newConfig.baseForegroundColor = color
        return newConfig
    }
    
    @discardableResult
    func baseBackgroundColor(_ color: UIColor) -> Self {
        var newConfig = self
        newConfig.baseBackgroundColor = color
        return newConfig
    }
    
    @discardableResult
    func background(_ background: UIBackgroundConfiguration) -> Self {
        var newConfig = self
        newConfig.background = background
        return newConfig
    }
    
    @discardableResult
    func background(_ background: () -> UIBackgroundConfiguration) -> Self {
        var newConfig = self
        newConfig.background = background()
        return newConfig
    }
    
    @discardableResult
    func titlePadding(_ padding: CGFloat) -> Self {
        var newConfig = self
        newConfig.titlePadding = padding
        return newConfig
    }
    
    @discardableResult
    func titleAlignment(_ alignment: UIButton.Configuration.TitleAlignment) -> Self {
        var newConfig = self
        newConfig.titleAlignment = alignment
        return newConfig
    }
    
    @discardableResult
    func showsActivityIndicator(_ shows: Bool) -> Self {
        var newConfig = self
        newConfig.showsActivityIndicator = shows
        return newConfig
    }
    
    @discardableResult
    func activityIndicatorColorTransformer(_ transformer: UIConfigurationColorTransformer) -> Self {
        var newConfig = self
        newConfig.activityIndicatorColorTransformer = transformer
        return newConfig
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func indicator(_ indicator: UIButton.Configuration.Indicator) -> Self {
        var newConfig = self
        newConfig.indicator = indicator
        return newConfig
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func indicatorColorTransformer(_ transformer: UIConfigurationColorTransformer) -> Self {
        var newConfig = self
        newConfig.indicatorColorTransformer = transformer
        return newConfig
    }
    
    @discardableResult
    func contentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        var newConfig = self
        newConfig.contentInsets = insets
        return newConfig
    }
    
    @discardableResult
    func cornerStyle(_ style: UIButton.Configuration.CornerStyle) -> Self {
        var newConfig = self
        newConfig.cornerStyle = style
        return newConfig
    }
    
    @discardableResult
    func automaticallyUpdateForSelection(_ automaticallyUpdate: Bool) -> Self {
        var newConfig = self
        newConfig.automaticallyUpdateForSelection = automaticallyUpdate
        return newConfig
    }
    
    @discardableResult
    func buttonSize(_ size: UIButton.Configuration.Size) -> Self {
        var newConfig = self
        newConfig.buttonSize = size
        return newConfig
    }
    
    @discardableResult
    func macIdiomStyle(_ style: UIButton.Configuration.MacIdiomStyle) -> Self {
        var newConfig = self
        newConfig.macIdiomStyle = style
        return newConfig
    }
    
    @discardableResult
    func imageColorTransformer(_ transformer: UIConfigurationColorTransformer) -> Self {
        var newConfig = self
        newConfig.imageColorTransformer = transformer
        return newConfig
    }
    
    @discardableResult
    func preferredSymbolConfigurationForImage(_ config: UIImage.SymbolConfiguration) -> Self {
        var newConfig = self
        newConfig.preferredSymbolConfigurationForImage = config
        return newConfig
    }
}


@available(iOS 15.0, *)
private extension UIButton.Configuration {
    func merging(_ other: UIButton.Configuration) -> Self {
        var merged = self
        
        if let title = other.title { merged.title = title }
        if let subtitle = other.subtitle { merged.subtitle = subtitle }
        
        if let attributedTitle = other.attributedTitle { merged.attributedTitle = attributedTitle }
        if let attributedSubtitle = other.attributedSubtitle { merged.attributedSubtitle = attributedSubtitle }
        
        if let image = other.image { merged.image = image }
        if other.imagePlacement != .leading { merged.imagePlacement = other.imagePlacement }
        if other.imagePadding != 0 { merged.imagePadding = other.imagePadding }
        merged.imageColorTransformer = other.imageColorTransformer ?? merged.imageColorTransformer
        
        merged.baseForegroundColor = other.baseForegroundColor ?? merged.baseForegroundColor
        merged.baseBackgroundColor = other.baseBackgroundColor ?? merged.baseBackgroundColor
        
        if other.contentInsets != .zero { merged.contentInsets = other.contentInsets }
        if other.titleAlignment != .automatic { merged.titleAlignment = other.titleAlignment }
        
        return merged
    }
}

@available(iOS 15.0, *)
private extension UIButton {
    
    func setupConfigurationUpdateHandler() {
        setInnerConfigurationHandler { [weak self] button in
            guard let self = self else { return }
            var normalConfig = self.stateConfigurations[UIControl.State.normal.rawValue]
            if normalConfig == nil, let buttonConfig = button.configuration {
                self.stateConfigurations[UIControl.State.normal.rawValue] = buttonConfig
                normalConfig = buttonConfig
            }
            
            var finalConfig = normalConfig
            switch button.state {
            case .disabled:
                finalConfig = self.stateConfigurations[UIControl.State.disabled.rawValue]
            case .highlighted:
                finalConfig = self.stateConfigurations[UIControl.State.highlighted.rawValue]
            case .selected:
                finalConfig = self.stateConfigurations[UIControl.State.selected.rawValue]
            default:
                finalConfig = normalConfig
            }
            button.configuration = finalConfig
            
        }
    }
    
    func setInnerConfigurationHandler(_ handler: @escaping (UIButton) -> Void) {
        __UIButtonDisposableClass.runOnce {
            UIButton.swizzleConfigurationHandler()
        }
        innerConfigurationHandler = handler
        if configurationUpdateHandler != nil {
            configurationUpdateHandler = configurationUpdateHandler
        }
    }
    
    static func swizzleConfigurationHandler() {
        guard self == UIButton.self else { return }
        let originalSelector1 = #selector(setter: UIButton.configurationUpdateHandler)
        let swizzledSelector1 = #selector(UIButton.swizzled_setConfigurationHandler(handler:))
        UIButton.swizzleMethod(clas: UIButton.self, originalSelector: originalSelector1, swizzledSelector: swizzledSelector1)
    }
        
    @objc private func swizzled_setConfigurationHandler(handler: ((UIButton) -> Void)?) {
        let externalHandler = handler
        let combinedHandler: ((UIButton) -> Void)? = { [weak self] button in
            self?.innerConfigurationHandler?(button)
            externalHandler?(button)
        }
        self.swizzled_setConfigurationHandler(handler: combinedHandler)
    }
    
    struct AssociatedKeys {
        nonisolated(unsafe) static var buttonConfigurationsKey: Void?
        nonisolated(unsafe) static var configurationHandlerKey: Void?
    }
    
    var stateConfigurations: [UInt: UIButton.Configuration] {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.buttonConfigurationsKey) as? [UInt: UIButton.Configuration] ?? [:]
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.buttonConfigurationsKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    var innerConfigurationHandler: ((UIButton) -> Void)? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.configurationHandlerKey) as? ((UIButton) -> Void)
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.configurationHandlerKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

@MainActor
private struct __UIButtonDisposableClass {
    private static var hasExecuted = false
    static func runOnce(block: @escaping () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}
