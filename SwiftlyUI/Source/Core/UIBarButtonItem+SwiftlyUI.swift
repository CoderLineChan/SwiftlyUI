//
//  UIBarButtonItem+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/28.
//


#if canImport(UIKit)
import UIKit

public extension UIBarItem {
    
    @discardableResult
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }
    
    @discardableResult
    func enabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult
    func landscapeImagePhone(_ image: UIImage?) -> Self {
        self.landscapeImagePhone = image
        return self
    }
    
    @discardableResult
    func largeContentSizeImage(_ image: UIImage?) -> Self {
        self.largeContentSizeImage = image
        return self
    }
    
    @discardableResult
    func imageInsets(_ insets: UIEdgeInsets) -> Self {
        self.imageInsets = insets
        return self
    }
    
    @discardableResult
    func landscapeImagePhoneInsets(_ insets: UIEdgeInsets) -> Self {
        self.landscapeImagePhoneInsets = insets
        return self
    }
    
    @discardableResult
    func largeContentSizeImageInsets(_ insets: UIEdgeInsets) -> Self {
        self.largeContentSizeImageInsets = insets
        return self
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
}

public extension UIBarButtonItem {
    
    /// Creates a UIBarButtonItem with a custom view.
    @discardableResult
    convenience init(@SwiftlyUIBuilder customContentView: () -> [UIView]) {
        if customContentView().count != 1 {
            fatalError("BarButtonItem must have exactly one custom view.")
        }
        let content = customContentView()[0]
        self.init(customView: content)
    }
    
    @discardableResult
    func possibleTitles(_ titles: Set<String>?) -> Self {
        self.possibleTitles = titles
        return self
    }
    
    @discardableResult
    func customView(_ view: UIView?) -> Self {
        self.customView = view
        return self
    }
    
    @discardableResult
    func style(_ style: UIBarButtonItem.Style) -> Self {
        self.style = style
        return self
    }
    
    @discardableResult
    func target(_ target: AnyObject?, action: Selector?) -> Self {
        self.target = target
        self.action = action
        return self
    }
    
    @discardableResult
    func tintColor(_ color: UIColor?) -> Self {
        self.tintColor = color
        return self
    }
    
#if compiler(>=5.3)
    @available(iOS 14, *)
    @discardableResult
    func menu(_ menu: UIMenu?) -> Self {
        self.menu = menu
        return self
    }
    
    @available(iOS 14, *)
    @discardableResult
    func primaryAction(_ action: UIAction?) -> Self {
        self.primaryAction = action
        return self
    }
    
#endif
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func changesSelectionAsPrimaryAction(_ changes: Bool) -> Self {
        self.changesSelectionAsPrimaryAction = changes
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func selected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
#endif
    
#if compiler(>=5.7)
    @available(iOS 16.0, *)
    @discardableResult
    func hidden(_ hidden: Bool = true) -> Self {
        self.isHidden = hidden
        return self
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    func preferredMenuElementOrder(_ order: UIContextMenuConfiguration.ElementOrder) -> Self {
        self.preferredMenuElementOrder = order
        return self
    }
    
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
