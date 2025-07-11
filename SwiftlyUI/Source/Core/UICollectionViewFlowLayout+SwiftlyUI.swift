//
//  UICollectionViewFlowLayout+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UICollectionViewFlowLayout {
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func minimumLineSpacing(_ spacing: CGFloat) -> Self {
        self.minimumLineSpacing = spacing
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func minimumInteritemSpacing(_ spacing: CGFloat) -> Self {
        self.minimumInteritemSpacing = spacing
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func itemSize(_ size: CGSize) -> Self {
        self.itemSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func estimatedItemSize(_ size: CGSize) -> Self {
        self.estimatedItemSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func scrollDirection(_ direction: UICollectionView.ScrollDirection) -> Self {
        self.scrollDirection = direction
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func headerReferenceSize(_ size: CGSize) -> Self {
        self.headerReferenceSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func footerReferenceSize(_ size: CGSize) -> Self {
        self.footerReferenceSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func sectionInset(_ inset: UIEdgeInsets) -> Self {
        self.sectionInset = inset
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func sectionInsetReference(_ reference: UICollectionViewFlowLayout.SectionInsetReference) -> Self {
        self.sectionInsetReference = reference
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func sectionHeadersPinToVisibleBounds(_ pin: Bool) -> Self {
        self.sectionHeadersPinToVisibleBounds = pin
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionViewFlowLayout`.
    @discardableResult
    func sectionFootersPinToVisibleBounds(_ pin: Bool) -> Self {
        self.sectionFootersPinToVisibleBounds = pin
        return self
    }
    
}

#endif
