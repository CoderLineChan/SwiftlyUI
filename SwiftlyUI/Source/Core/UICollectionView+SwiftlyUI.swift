//
//  UICollectionView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UICollectionView {
    
    /// SwiftlyUI 扩展 初始化 `UICollectionView`。
    convenience init(layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor(.clear)
    }
    
    /// SwiftlyUI 扩展 初始化 `UICollectionView`。
    convenience init(layout: () -> UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout())
        self.backgroundColor(.clear)
    }
    
    /// SwiftlyUI 扩展 注册 `UICollectionViewCell`。
    /// SwiftlyUI extension register  `UICollectionViewCell`.
    @discardableResult
    func registerCell<T: UICollectionViewCell>(withCellClass name: T.Type) -> Self {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI 扩展 注册 `UICollectionReusableView`。
    /// SwiftlyUI extension register `UICollectionReusableView`.
    @discardableResult
    func registerView<T: UICollectionReusableView>(ofKind kind: String, withCellClass name: T.Type) -> Self {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI 扩展 注册 `UICollectionViewCell` nil。
    /// SwiftlyUI extension register `UICollectionViewCell` nil.
    @discardableResult
    func registerNib(nib: UINib?, withCellClass name: (some UICollectionViewCell).Type) -> Self {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI 扩展 注册 `UICollectionReusableView` nil。
    /// SwiftlyUI extension register `UICollectionReusableView` nil。
    @discardableResult
    func registerNib(nib: UINib?, forSupplementaryViewOfKind kind: String,
                  withClass name: (some UICollectionReusableView).Type) -> Self {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        return self
    }

    /// SwiftlyUI 扩展 指定 bundle 注册 `UICollectionViewCell` nib
    /// SwiftlyUI extension register `UICollectionViewCell` nib with specified bundle.
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
    
    /// SwiftlyUI 扩展 获取 `UICollectionViewCell`。
    /// SwiftlyUI extension dequeue `UICollectionViewCell`.
    func dequeueCell<T: UICollectionViewCell>(withCellClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    /// SwiftlyUI 扩展 获取 `UICollectionReusableView`。
    /// SwiftlyUI extension dequeue `UICollectionReusableView`.
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
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func collectionViewLayout(_ layout: UICollectionViewLayout) -> Self {
        self.collectionViewLayout = layout
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func prefetchingEnabled(_ enabled: Bool) -> Self {
        self.isPrefetchingEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }

    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func dragInteractionEnabled(_ enabled: Bool) -> Self {
        self.dragInteractionEnabled = enabled
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func reorderingCadence(_ cadence: UICollectionView.ReorderingCadence) -> Self {
        self.reorderingCadence = cadence
        return self
    }
    
#if compiler(>=5.7)
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 16.0, *)
    @discardableResult
    func selfSizingInvalidation(_ selfSizingInvalidation: UICollectionView.SelfSizingInvalidation) -> Self {
        self.selfSizingInvalidation = selfSizingInvalidation
        return self
    }
#endif
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func allowsSelection(_ selection: Bool) -> Self {
        self.allowsSelection = selection
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func allowsMultipleSelection(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = multipleSelection
        return self
    }
    
#if compiler(>=5.3)
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 14.0, *)
    @discardableResult
    func allowsSelectionDuringEditing(_ editing: Bool) -> Self {
        self.allowsSelectionDuringEditing = editing
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 14.0, *)
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = multipleSelection
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 14.0, *)
    @discardableResult
    func selectionFollowsFocus(_ follows: Bool) -> Self {
        self.selectionFollowsFocus = follows
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 14.0, *)
    @discardableResult
    func editing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
#endif
    
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocus(_ allows: Bool) -> Self {
        self.allowsFocus = allows
        return self
    }
    
    /// SwiftlyUI extension for `UICollectionView`.
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocusDuringEditing(_ allows: Bool) -> Self {
        self.allowsFocusDuringEditing = allows
        return self
    }
#endif
    
    /// SwiftlyUI extension for `UICollectionView`.
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembers: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembers
        return self
    }
    
    
    
}

#endif
