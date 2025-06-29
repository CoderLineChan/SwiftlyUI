//
//  UITableView+SwiftlyUI.swift
//  Pods
//
//  Created by CoderChan on 2025/6/5.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(withCellClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    func dequeueCell<T: UITableViewCell>(withCellClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }
    
    func dequeueView<T: UITableViewHeaderFooterView>(withCellClass name: T.Type) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "SwiftlyUI - Couldn't find UITableViewHeaderFooterView for \(String(describing: name)), make sure the view is registered with table view")
        }
        return headerFooterView
    }

    @discardableResult
    func registerView<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) -> Self {
        register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }

    @discardableResult
    func registerCell<T: UITableViewCell>(withCellClass name: T.Type) -> Self {
        register(T.self, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
    @discardableResult
    func registerNib(nib: UINib?, withCellClass name: (some UITableViewCell).Type) -> Self {
        register(nib, forCellReuseIdentifier: String(describing: name))
        return self
    }
    
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
    
    @discardableResult
    func registerNib(nib: UINib?, withHeaderFooterViewClass name: (some UITableViewHeaderFooterView).Type) -> Self {
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
        return self
    }
    
    
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource?) -> Self {
        self.dataSource = dataSource
        return self
    }
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func prefetchDataSource(_ prefetchDataSource: UITableViewDataSourcePrefetching?) -> Self {
        self.prefetchDataSource = prefetchDataSource
        return self
    }

    @discardableResult
    func dragDelegate(_ dragDelegate: UITableViewDragDelegate?) -> Self {
        self.dragDelegate = dragDelegate
        return self
    }

    @discardableResult
    func dropDelegate(_ dropDelegate: UITableViewDropDelegate?) -> Self {
        self.dropDelegate = dropDelegate
        return self
    }
    
    @discardableResult
    func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    @discardableResult
    func sectionHeaderHeight(_ sectionHeaderHeight: CGFloat) -> Self {
        self.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    
    @discardableResult
    func sectionFooterHeight(_ sectionFooterHeight: CGFloat) -> Self {
        self.sectionFooterHeight = sectionFooterHeight
        return self
    }
    
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func fillerRowHeight(_ fillerRowHeight: CGFloat) -> Self {
        self.fillerRowHeight = fillerRowHeight
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func sectionHeaderTopPadding(_ sectionHeaderTopPadding: CGFloat) -> Self {
        self.sectionHeaderTopPadding = sectionHeaderTopPadding
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    func prefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self {
        self.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
#endif
    @discardableResult
    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        self.separatorInset = separatorInset
        return self
    }
    
    @discardableResult
    func separatorInsetReference(_ separatorInsetReference: UITableView.SeparatorInsetReference) -> Self {
        self.separatorInsetReference = separatorInsetReference
        return self
    }
#if compiler(>=5.7)
    @available(iOS 16.0, *)
    @discardableResult
    func selfSizingInvalidation(_ selfSizingInvalidation: UITableView.SelfSizingInvalidation) -> Self {
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
    func editing(_ isEditing: Bool) -> Self {
        self.isEditing = isEditing
        return self
    }
    
    @discardableResult
    func allowsSelection(_ selection: Bool) -> Self {
        self.allowsSelection = selection
        return self
    }
    
    @discardableResult
    func allowsSelectionDuringEditing(_ editing: Bool) -> Self {
        self.allowsSelectionDuringEditing = editing
        return self
    }
    
    @discardableResult
    func allowsMultipleSelection(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelection = multipleSelection
        return self
    }
    
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ multipleSelection: Bool) -> Self {
        self.allowsMultipleSelectionDuringEditing = multipleSelection
        return self
    }
    
    @discardableResult
    func sectionIndexMinimumDisplayRowCount(_ count: Int) -> Self {
        self.sectionIndexMinimumDisplayRowCount = count
        return self
    }
    
    @discardableResult
    func sectionIndexColor(_ color: UIColor?) -> Self {
        self.sectionIndexColor = color
        return self
    }
    
    @discardableResult
    func sectionIndexBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexBackgroundColor = color
        return self
    }
    
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ color: UIColor?) -> Self {
        self.sectionIndexTrackingBackgroundColor = color
        return self
    }
    
    @discardableResult
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = style
        return self
    }
    
    @discardableResult
    func separatorColor(_ color: UIColor?) -> Self {
        self.separatorColor = color
        return self
    }
    
    @discardableResult
    func separatorEffect(_ effect: UIVisualEffect?) -> Self {
        self.separatorEffect = effect
        return self
    }
    
    @discardableResult
    func cellLayoutMarginsFollowReadableWidth(_ follow: Bool) -> Self {
        self.cellLayoutMarginsFollowReadableWidth = follow
        return self
    }
    
    @discardableResult
    func insetsContentViewsToSafeArea(_ insets: Bool) -> Self {
        self.insetsContentViewsToSafeArea = insets
        return self
    }
    
    @discardableResult
    func tableHeaderView(_ headerView: UIView?) -> Self {
        self.tableHeaderView = headerView
        return self
    }
    
    @discardableResult
    func tableFooterView(_ footerView: UIView?) -> Self {
        self.tableFooterView = footerView
        return self
    }
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembers: Bool) -> Self {
        self.remembersLastFocusedIndexPath = remembers
        return self
    }
#if compiler(>=5.3)
    @available(iOS 14.0, *)
    @discardableResult
    func selectionFollowsFocus(_ follows: Bool) -> Self {
        self.selectionFollowsFocus = follows
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
#if compiler(>=6.0)
    @available(iOS 18.0, *)
    @discardableResult
    func contentHuggingElements(_ elements: UITableViewContentHuggingElements) -> Self {
        self.contentHuggingElements = elements
        return self
    }
#endif
    
}


#endif
