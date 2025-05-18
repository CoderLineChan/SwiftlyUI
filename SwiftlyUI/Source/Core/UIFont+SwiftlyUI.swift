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
    static func ultraLight(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .ultraLight)
    }
    
    static func thin(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func semibold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func heavy(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    static func black(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .black)
    }
    
    static func dinAlternateBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func dinCondensedBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DINCondensed-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
}

public extension UIFont {
    static var largeTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .largeTitle)
    }
#if compiler(>=5.9)
    @available(iOS 17.0, watchOS 10.0, tvOS 17.0, macCatalyst 17.0, *)
    static var extraLargeTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .extraLargeTitle)
    }
    
    @available(iOS 17.0, watchOS 10.0, tvOS 17.0, macCatalyst 17.0, *)
    static var extraLargeTitle2: UIFont {
        return .preferredFont(forTextStyle: .extraLargeTitle2)
    }
#endif
    static var title: UIFont {
        return .preferredFont(forTextStyle: .title1)
    }
    
    static var title2: UIFont {
        return .preferredFont(forTextStyle: .title2)
    }
    
    static var title3: UIFont {
        return .preferredFont(forTextStyle: .title3)
    }
    
    static var headline: UIFont {
        return .preferredFont(forTextStyle: .headline)
    }
    
    static var subheadline: UIFont {
        return .preferredFont(forTextStyle: .subheadline)
    }
    
    static var body: UIFont {
        return .preferredFont(forTextStyle: .body)
    }
    
    static var callout: UIFont {
        return .preferredFont(forTextStyle: .callout)
    }
    
    static var footnote: UIFont {
        return .preferredFont(forTextStyle: .footnote)
    }
    
    static var caption: UIFont {
        return .preferredFont(forTextStyle: .caption1)
    }
    
    static var caption2: UIFont {
        return .preferredFont(forTextStyle: .caption2)
    }
}
#endif
