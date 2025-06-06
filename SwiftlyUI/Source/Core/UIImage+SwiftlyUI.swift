//
//  UIImage+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/5/22.
//

#if canImport(UIKit) && os(iOS)
import UIKit

public extension UIImage {
    
    static func named(_ name: String) -> UIImage? {
        return UIImage(named: name)
    }
    
    static func systemName(_ name: String) -> UIImage? {
        return UIImage(systemName: name)
    }
    
    
}

#endif
