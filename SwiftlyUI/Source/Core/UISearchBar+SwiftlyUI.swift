//
//  UISearchBar+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/7/8.
//


#if canImport(UIKit)
import UIKit

public extension UISearchBar {
    /// SwiftlyUI - extension for `UISearchBar`.
    convenience init(_ placeholder: String?) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func barStyle(_ style: UIBarStyle) -> Self {
        self.barStyle = style
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func delegate(_ delegate: (any UISearchBarDelegate)?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func prompt(_ prompt: String?) -> Self {
        self.prompt = prompt
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func showsBookmarkButton(_ shows: Bool) -> Self {
        self.showsBookmarkButton = shows
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func showsCancelButton(_ shows: Bool) -> Self {
        self.showsCancelButton = shows
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func showsSearchResultsButton(_ shows: Bool) -> Self {
        self.showsSearchResultsButton = shows
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func searchResultsButtonSelected(_ isSelect: Bool) -> Self {
        self.isSearchResultsButtonSelected = isSelect
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func barTintColor(_ color: UIColor?) -> Self {
        self.barTintColor = color
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func searchBarStyle(_ style: UISearchBar.Style) -> Self {
        self.searchBarStyle = style
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func translucent(_ translucent: Bool) -> Self {
        self.isTranslucent = translucent
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func scopeButtonTitles(_ titles: [String]?) -> Self {
        self.scopeButtonTitles = titles
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func selectedScopeButtonIndex(_ index: Int) -> Self {
        self.selectedScopeButtonIndex = index
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func showsScopeBar(_ shows: Bool) -> Self {
        self.showsScopeBar = shows
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func backgroundImage(_ image: UIImage?) -> Self {
        self.backgroundImage = image
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func backgroundImageNamed(_ imageName: String) -> Self {
        self.backgroundImage = UIImage(named: imageName)
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func scopeBarBackgroundImage(_ image: UIImage?) -> Self {
        self.scopeBarBackgroundImage = image
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func scopeBarBackgroundImageNamed(_ imageName: String) -> Self {
        self.scopeBarBackgroundImage = UIImage(named: imageName)
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func searchFieldBackgroundPositionAdjustment(_ adjustment: UIOffset) -> Self {
        self.searchFieldBackgroundPositionAdjustment = adjustment
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func searchTextPositionAdjustment(_ adjustment: UIOffset) -> Self {
        self.searchTextPositionAdjustment = adjustment
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        self.keyboardType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = appearance
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        self.returnKeyType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func enablesReturnKeyAutomatically(_ enables: Bool) -> Self {
        self.enablesReturnKeyAutomatically = enables
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        self.smartDashesType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func textContentType(_ type: UITextContentType?) -> Self {
        self.searchTextField.textContentType = type
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func image(_ image: UIImage?, for icon: UISearchBar.Icon, state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: icon, state: state)
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func positionAdjustment(_ adjustment: UIOffset, for icon: UISearchBar.Icon) -> Self {
        self.setPositionAdjustment(adjustment, for: icon)
        return self
    }
    
    /// SwiftlyUI - extension for `UISearchBar`.
    @discardableResult
    func scopeBarButtonTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for state: UIControl.State) -> Self {
        self.setScopeBarButtonTitleTextAttributes(attributes, for: state)
        return self
    }
    
#if compiler(>=5.7)
    /// SwiftlyUI - extension for `UISearchBar`.
    @available(iOS 16.4, *)
    @discardableResult
    func enabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }
#endif
    
#if compiler(>=5.9)
    /// SwiftlyUI - extension for `UISearchBar`.
    @available(iOS 17.0, *)
    @discardableResult
    func lookToDictateEnabled(_ enabled: Bool) -> Self {
        self.isLookToDictateEnabled = enabled
        return self
    }
#endif
}


#endif

