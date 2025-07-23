//
//  UIBarButtonItem+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/28.
//


#if canImport(UIKit)
import UIKit

public extension UIBarItem {
    
    /// SwiftlyUI - Set title.
    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }
    
    /// SwiftlyUI - Set enabled.
    @discardableResult
    func enabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
    
    /// SwiftlyUI - Set image.
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    /// SwiftlyUI - Set landscape image for phone.
    @discardableResult
    func landscapeImagePhone(_ image: UIImage?) -> Self {
        self.landscapeImagePhone = image
        return self
    }
    
    /// SwiftlyUI - Set large content size image.
    @discardableResult
    func largeContentSizeImage(_ image: UIImage?) -> Self {
        self.largeContentSizeImage = image
        return self
    }
    
    /// SwiftlyUI - Set alternate image.
    @discardableResult
    func imageInsets(_ insets: UIEdgeInsets) -> Self {
        self.imageInsets = insets
        return self
    }
    
    /// SwiftlyUI - Set landscape image phone insets.
    @discardableResult
    func landscapeImagePhoneInsets(_ insets: UIEdgeInsets) -> Self {
        self.landscapeImagePhoneInsets = insets
        return self
    }
    
    /// SwiftlyUI - Set large content size image insets.
    @discardableResult
    func largeContentSizeImageInsets(_ insets: UIEdgeInsets) -> Self {
        self.largeContentSizeImageInsets = insets
        return self
    }
    
    /// SwiftlyUI - Set tag.
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
}

public extension UIBarButtonItem {
    
    /// /// SwiftlyUI -  Creates a UIBarButtonItem with a custom view.
    @discardableResult
    convenience init(@SwiftlyUIBuilder customContentView: () -> [UIView]) {
        if customContentView().count != 1 {
            fatalError("BarButtonItem must have exactly one custom view.")
        }
        let content = customContentView()[0]
        self.init(customView: content)
    }
    
    /// SwiftlyUI - Set title.
    @discardableResult
    func possibleTitles(_ titles: Set<String>?) -> Self {
        self.possibleTitles = titles
        return self
    }
    
    /// SwiftlyUI - Set custom view.
    @discardableResult
    func customView(_ view: UIView?) -> Self {
        self.customView = view
        return self
    }
    
    /// SwiftlyUI - Set style.
    @discardableResult
    func style(_ style: UIBarButtonItem.Style) -> Self {
        self.style = style
        return self
    }
    
    /// SwiftlyUI - Set target and action.
    @discardableResult
    func target(_ target: AnyObject?, action: Selector?) -> Self {
        self.target = target
        self.action = action
        return self
    }
    
    /// SwiftlyUI - Set tint color.
    @discardableResult
    func tintColor(_ color: UIColor?) -> Self {
        self.tintColor = color
        return self
    }
    
#if compiler(>=5.3)
    /// SwiftlyUI - Set menu.
    @available(iOS 14, *)
    @discardableResult
    func menu(_ menu: UIMenu?) -> Self {
        self.menu = menu
        return self
    }
    
    /// SwiftlyUI - Set action.
    @available(iOS 14, *)
    @discardableResult
    func primaryAction(_ action: UIAction?) -> Self {
        self.primaryAction = action
        return self
    }
    
#endif
#if compiler(>=5.5)
    /// SwiftlyUI - Set primary action.
    @available(iOS 15.0, *)
    @discardableResult
    func changesSelectionAsPrimaryAction(_ changes: Bool) -> Self {
        self.changesSelectionAsPrimaryAction = changes
        return self
    }
    
    /// SwiftlyUI - Set selected.
    @available(iOS 15.0, *)
    @discardableResult
    func selected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
#endif
    
#if compiler(>=5.7)
    /// SwiftlyUI - Set hidden.
    @available(iOS 16.0, *)
    @discardableResult
    func hidden(_ hidden: Bool = true) -> Self {
        self.isHidden = hidden
        return self
    }
    
    /// SwiftlyUI - Set preferred menu element order.
    @available(iOS 16.0, *)
    @discardableResult
    func preferredMenuElementOrder(_ order: UIContextMenuConfiguration.ElementOrder) -> Self {
        self.preferredMenuElementOrder = order
        return self
    }
    
    /// SwiftlyUI - Set menu representation.
    @available(iOS 16.0, *)
    @discardableResult
    func menuRepresentation(_ representation: UIMenuElement?) -> Self {
        self.menuRepresentation = representation
        return self
    }
    
#endif
//#if compiler(>=5.9)
//    @available(iOS 17.0, *)
//    @discardableResult
//    func symbolAnimationEnabled(_ enabled: Bool) -> Self {
//        self.isSymbolAnimationEnabled = enabled
//        return self
//    }
//    
//#endif
}

#endif
