//
//  UITableViewCell+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UITableViewCell {
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UITableViewCell`.
    @available(iOS 14.0, *)
    @discardableResult
    func automaticallyUpdatesContentConfiguration(_ updates: Bool) -> Self {
        self.automaticallyUpdatesContentConfiguration = updates
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @available(iOS 14.0, *)
    @discardableResult
    func automaticallyUpdatesBackgroundConfiguration(_ updates: Bool) -> Self {
        self.automaticallyUpdatesBackgroundConfiguration = updates
        return self
    }
#endif
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func backgroundView(_ view: UIView?) -> Self {
        self.backgroundView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func selectedBackgroundView(_ view: UIView?) -> Self {
        self.selectedBackgroundView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func multipleSelectionBackgroundView(_ view: UIView?) -> Self {
        self.multipleSelectionBackgroundView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func selectionStyle(_ style: UITableViewCell.SelectionStyle) -> Self {
        self.selectionStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func selected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func highlighted(_ highlighted: Bool) -> Self {
        self.isHighlighted = highlighted
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func showsReorderControl(_ shows: Bool) -> Self {
        self.showsReorderControl = shows
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func shouldIndentWhileEditing(_ shouldIndent: Bool) -> Self {
        self.shouldIndentWhileEditing = shouldIndent
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func accessoryType(_ type: UITableViewCell.AccessoryType) -> Self {
        self.accessoryType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func accessoryView(_ view: UIView?) -> Self {
        self.accessoryView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func editingAccessoryType(_ type: UITableViewCell.AccessoryType) -> Self {
        self.editingAccessoryType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func editingAccessoryView(_ view: UIView?) -> Self {
        self.editingAccessoryView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func indentationLevel(_ level: Int) -> Self {
        self.indentationLevel = level
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func indentationWidth(_ width: CGFloat) -> Self {
        self.indentationWidth = width
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func separatorInset(_ inset: UIEdgeInsets) -> Self {
        self.separatorInset = inset
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func editing(_ editing: Bool) -> Self {
        self.isEditing = editing
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func focusStyle(_ style: UITableViewCell.FocusStyle) -> Self {
        self.focusStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @discardableResult
    func userInteractionEnabledWhileDragging(_ enabled: Bool) -> Self {
        self.userInteractionEnabledWhileDragging = enabled
        return self
    }
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UITableViewCell`.
    @available(iOS 14.0, *)
    @discardableResult
    func contentConfiguration(_ configuration: UIContentConfiguration) -> Self {
        self.contentConfiguration = configuration
        return self
    }
    
    /// SwiftlyUI extension for `UITableViewCell`.
    @available(iOS 14.0, *)
    @discardableResult
    func backgroundConfiguration(_ configuration: UIBackgroundConfiguration?) -> Self {
        self.backgroundConfiguration = configuration
        return self
    }
#endif
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UITableViewCell`.
    @available(iOS 15.0, *)
    @discardableResult
    func configurationUpdateHandler(_ handler: UITableViewCell.ConfigurationUpdateHandler?) -> Self {
        self.configurationUpdateHandler = handler
        return self
    }
#endif
}


#endif
