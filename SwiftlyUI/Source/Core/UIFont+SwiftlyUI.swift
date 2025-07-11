//
//  UIFont+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/2/20.
//

#if canImport(UIKit)
import UIKit


// MARK: - basics
public extension UIFont {
    /// SwiftlyUI extension for `UIFont`.
    static func ultraLight(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .ultraLight)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func thin(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func semibold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func black(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .black)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func dinAlternateBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static func dinCondensedBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DINCondensed-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}

public extension UIFont {
    /// SwiftlyUI extension for `UIFont`.
    static var largeTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .largeTitle)
    }
#if compiler(>=5.9)
    /// SwiftlyUI extension for `UIFont`.
    @available(iOS 17.0, watchOS 10.0, tvOS 17.0, macCatalyst 17.0, *)
    static var extraLargeTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .extraLargeTitle)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    @available(iOS 17.0, watchOS 10.0, tvOS 17.0, macCatalyst 17.0, *)
    static var extraLargeTitle2: UIFont {
        return .preferredFont(forTextStyle: .extraLargeTitle2)
    }
#endif
    /// SwiftlyUI extension for `UIFont`.
    static var title: UIFont {
        return .preferredFont(forTextStyle: .title1)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var title2: UIFont {
        return .preferredFont(forTextStyle: .title2)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var title3: UIFont {
        return .preferredFont(forTextStyle: .title3)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var headline: UIFont {
        return .preferredFont(forTextStyle: .headline)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var subheadline: UIFont {
        return .preferredFont(forTextStyle: .subheadline)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var body: UIFont {
        return .preferredFont(forTextStyle: .body)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var callout: UIFont {
        return .preferredFont(forTextStyle: .callout)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var footnote: UIFont {
        return .preferredFont(forTextStyle: .footnote)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var caption: UIFont {
        return .preferredFont(forTextStyle: .caption1)
    }
    
    /// SwiftlyUI extension for `UIFont`.
    static var caption2: UIFont {
        return .preferredFont(forTextStyle: .caption2)
    }
}
#endif
