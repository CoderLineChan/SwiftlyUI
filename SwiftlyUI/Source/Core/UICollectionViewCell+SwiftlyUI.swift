//
//  UICollectionViewCell+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit


public extension UICollectionViewCell {
    @discardableResult
    func backgroundView(_ view: UIView?) -> UICollectionViewCell {
        self.backgroundView = view
        return self
    }
    
#if compiler(>=5.3)
    @available(iOS 14.0, *)
    @discardableResult
    func automaticallyUpdatesContentConfiguration(_ updates: Bool) -> Self {
        self.automaticallyUpdatesContentConfiguration = updates
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func automaticallyUpdatesBackgroundConfiguration(_ updates: Bool) -> Self {
        self.automaticallyUpdatesBackgroundConfiguration = updates
        return self
    }
#endif
    
    @discardableResult
    func selected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }
    
    @discardableResult
    func highlighted(_ highlighted: Bool) -> Self {
        self.isHighlighted = highlighted
        return self
    }
    
    @discardableResult
    func selectedBackgroundView(_ view: UIView?) -> Self {
        self.selectedBackgroundView = view
        return self
    }
    
#if compiler(>=5.3)
    @available(iOS 14.0, *)
    @discardableResult
    func contentConfiguration(_ configuration: UIContentConfiguration) -> Self {
        self.contentConfiguration = configuration
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func backgroundConfiguration(_ configuration: UIBackgroundConfiguration?) -> Self {
        self.backgroundConfiguration = configuration
        return self
    }
#endif
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func configurationUpdateHandler(_ handler: UICollectionViewCell.ConfigurationUpdateHandler?) -> Self {
        self.configurationUpdateHandler = handler
        return self
    }
#endif
}


#endif
