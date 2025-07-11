//
//  UITableView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
    /// SwiftlyUI 扩展 获取UITableViewCell
    /// SwiftlyUI extension for dequeueing UITableViewCell.
    func dequeueCell<T: UITableViewCell>(withCellClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    /// SwiftlyUI 扩展 获取UITableViewCell
    /// SwiftlyUI extension for dequeueing UITableViewCell.
    func dequeueCell<T: UITableViewCell>(withCellClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }
    
    /// SwiftlyUI 扩展 获取UITableViewHeaderFooterView
    /// SwiftlyUI extension for dequeueing UITableViewHeaderFooterView.
    func dequeueView<T: UITableViewHeaderFooterView>(withCellClass name: T.Type) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewHeaderFooterView for \(String(describing: name)), make sure the view is registered with table view")
        }
        return headerFooterView
    }

    /// SwiftlyUI 扩展 注册UITableViewHeaderFooterView
    /// SwiftlyUI extension for registering UITableViewHeaderFooterView.
    @discardableResult
    func registerView<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) -> Self {
        register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }

    /// SwiftlyUI 扩展 注册UITableViewCell
    /// SwiftlyUI extension for registering UITableViewCell.
    @discardableResult
    func registerCell<T: UITableViewCell>(withCellClass name: T.Type) -> Self {
        register(T.self, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI 扩展 注册UITableViewCell nib
    /// SwiftlyUI extension for registering UITableViewCell with nib.
    @discardableResult
    func registerNib(nib: UINib?, withCellClass name: (some UITableViewCell).Type) -> Self {
        register(nib, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI 扩展 注册UITableViewCell nib
    /// SwiftlyUI extension for registering UITableViewCell with nib.
    @discardableResult
    func registerNib(withCellClass name: (some UITableViewCell).Type, at bundleClass: AnyClass? = nil) -> Self {
        let identifier = String(describing: name)
        var bundle: Bundle?
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
        return self
    }
    
    /// SwiftlyUI 扩展 注册UITableViewHeaderFooterView nib
    /// SwiftlyUI extension for registering UITableViewHeaderFooterView with nib.
    @discardableResult
    func registerNib(nib: UINib?, withHeaderFooterViewClass name: (some UITableViewHeaderFooterView).Type) -> Self {
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: UITableViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }

    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func dragDelegate(_ dragDelegate: UITableViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }

    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func dropDelegate(_ dropDelegate: UITableViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionHeaderHeight(_ sectionHeaderHeight: CGFloat) -> Self {
        self.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionFooterHeight(_ sectionFooterHeight: CGFloat) -> Self {
        self.sectionFooterHeight = sectionFooterHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
#if compiler(>=5.5)
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 15.0, *)
    @discardableResult
    func fillerRowHeight(_ fillerRowHeight: CGFloat) -> Self {
        self.fillerRowHeight = fillerRowHeight
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 15.0, *)
    @discardableResult
    func sectionHeaderTopPadding(_ sectionHeaderTopPadding: CGFloat) -> Self {
        self.sectionHeaderTopPadding = sectionHeaderTopPadding
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 15.0, *)
    @discardableResult
    func prefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self {
        self.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
#endif
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        self.separatorInset = separatorInset
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func separatorInsetReference(_ separatorInsetReference: UITableView.SeparatorInsetReference) -> Self {
        self.separatorInsetReference = separatorInsetReference
        return self
    }
#if compiler(>=5.7)
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 16.0, *)
    @discardableResult
    func selfSizingInvalidation(_ selfSizingInvalidation: UITableView.SelfSizingInvalidation) -> Self {
        self.selfSizingInvalidation = selfSizingInvalidation
        return self
    }
#endif
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func backgroundView(_ backgroundView: UIView?) -> Self {
        self.backgroundView = backgroundView
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func editing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func allowsSelection(_ selection: Bool) -> Self {
        self.allowsSelection = selection
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func allowsSelectionDuringEditing(_ editing: Bool) -> Self {
        self.allowsSelectionDuringEditing = editing
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func allowsMultipleSelection(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = multipleSelection
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = multipleSelection
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionIndexMinimumDisplayRowCount(_ count: Int) -> Self {
        self.sectionIndexMinimumDisplayRowCount = count
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionIndexColor(_ color: UIColor?) -> Self {
        self.sectionIndexColor = color
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionIndexBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexBackgroundColor = color
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexTrackingBackgroundColor = color
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = style
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func separatorColor(_ color: UIColor?) -> Self {
        self.separatorColor = color
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func separatorEffect(_ effect: UIVisualEffect?) -> Self {
        self.separatorEffect = effect
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func cellLayoutMarginsFollowReadableWidth(_ follow: Bool) -> Self {
        self.cellLayoutMarginsFollowReadableWidth = follow
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func insetsContentViewsToSafeArea(_ insets: Bool) -> Self {
        self.insetsContentViewsToSafeArea = insets
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func tableHeaderView(_ headerView: UIView?) -> Self {
        self.tableHeaderView = headerView
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func tableFooterView(_ footerView: UIView?) -> Self {
        self.tableFooterView = footerView
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembers: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembers
        return self
    }
#if compiler(>=5.3)
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 14.0, *)
    @discardableResult
    func selectionFollowsFocus(_ follows: Bool) -> Self {
        self.selectionFollowsFocus = follows
        return self
    }
#endif
#if compiler(>=5.5)
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocus(_ allows: Bool) -> Self {
        self.allowsFocus = allows
        return self
    }
    
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 15.0, *)
    @discardableResult
    func allowsFocusDuringEditing(_ allows: Bool) -> Self {
        self.allowsFocusDuringEditing = allows
        return self
    }
#endif
#if compiler(>=6.0)
    /// SwiftlyUI  extension for `UITableView`.
    @available(iOS 18.0, *)
    @discardableResult
    func contentHuggingElements(_ elements: UITableViewContentHuggingElements) -> Self {
        self.contentHuggingElements = elements
        return self
    }
#endif
    
}


#endif
