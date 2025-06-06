//
//  UICollectionView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UICollectionView {
    
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func collectionViewLayout(_ layout: UICollectionViewLayout) -> Self {
        self.collectionViewLayout = layout
        return self
    }
    
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }
    
    @discardableResult
    func prefetchingEnabled(_ enabled: Bool) -> Self {
        self.isPrefetchingEnabled = enabled
        return self
    }
    
    @discardableResult
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }

    @discardableResult
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    
    @discardableResult
    func dragInteractionEnabled(_ enabled: Bool) -> Self {
        self.dragInteractionEnabled = enabled
        return self
    }
    
    @discardableResult
    func reorderingCadence(_ cadence: UICollectionView.ReorderingCadence) -> Self {
        self.reorderingCadence = cadence
        return self
    }
    
#if compiler(>=5.7)
    @available(iOS 16.0, *)
    @discardableResult
    func selfSizingInvalidation(_ selfSizingInvalidation: UICollectionView.SelfSizingInvalidation) -> Self {
        self.selfSizingInvalidation = selfSizingInvalidation
        return self
    }
#endif
    
    @discardableResult
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    
    @discardableResult
    func allowsSelection(_ selection: Bool) -> Self {
        self.allowsSelection = selection
        return self
    }
    
    @discardableResult
    func allowsMultipleSelection(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = multipleSelection
        return self
    }
    
#if compiler(>=5.3)
    @available(iOS 14.0, *)
    @discardableResult
    func allowsSelectionDuringEditing(_ editing: Bool) -> Self {
        self.allowsSelectionDuringEditing = editing
        return self
    }
    @available(iOS 14.0, *)
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = multipleSelection
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult
    func selectionFollowsFocus(_ follows: Bool) -> Self {
        self.selectionFollowsFocus = follows
        return self
    }
    @available(iOS 14.0, *)
    @discardableResult
    func editing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
#endif
    
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocus(_ allows: Bool) -> Self {
        self.allowsFocus = allows
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocusDuringEditing(_ allows: Bool) -> Self {
        self.allowsFocusDuringEditing = allows
        return self
    }
#endif
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembers: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembers
        return self
    }
    
    
    
}

#endif
