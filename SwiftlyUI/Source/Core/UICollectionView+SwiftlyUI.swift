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
    func registerCell<T: UICollectionViewCell>(withCellClass name: T.Type) -> Self {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func registerView<T: UICollectionReusableView>(ofKind kind: String, withCellClass name: T.Type) -> Self {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func registerNib(nib: UINib?, withCellClass name: (some UICollectionViewCell).Type) -> Self {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func registerNib(nib: UINib?, forSupplementaryViewOfKind kind: String,
                  withClass name: (some UICollectionReusableView).Type) -> Self {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        return self
    }

    @discardableResult
    func registerNib(withCellClass name: (some UICollectionViewCell).Type, at bundleClass: AnyClass? = nil) -> Self {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        return self
    }
    
    func dequeueCell<T: UICollectionViewCell>(withCellClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    func dequeueView<T: UICollectionReusableView>(ofKind kind: String, withCellClass name: T.Type,
                                                                       for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: name),
            for: indexPath) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UICollectionReusableView for \(String(describing: name)), make sure the view is registered with collection view")
        }
        return cell
    }
    
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
