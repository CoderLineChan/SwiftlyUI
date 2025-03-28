//
//  UITextView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

import UIKit

// MARK: - Layout

public extension UITextView {
    @discardableResult
    override func padding(_ edge: UIEdgeInsets) -> Self {
        super.padding(edge)
        self.textContainerInset = edge
        return self
    }
}

// MARK: - basics
public extension UITextView {
    
    convenience init(_ placeholder: String) {
        self.init()
        self.placeholder(placeholder, color: nil)
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func placeholder(_ text: String, color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.text = text
        placeholderLabel.textColor = color ?? {
            if #available(iOS 13.0, *) {
                return .placeholderText
            } else {
                return .lightGray
            }
        }()
        placeholderLabel.isHidden = !self.text.isEmpty
        return self
    }
    
    @discardableResult
    func placeholderColor(_ color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.textColor = color ?? {
            if #available(iOS 13.0, *) {
                return .placeholderText
            } else {
                return .lightGray
            }
        }()
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func editable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }
    
    @discardableResult
    func selectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
    
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        self.keyboardType = type
        return self
    }
    
    @discardableResult
    func isSecure(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
}

// MARK: - Action
public extension UITextView {
    @discardableResult
    func onTextChange(_ action: @escaping @Sendable (String) -> Void) -> Self {
        onTextChange { textView in
            action(textView.text)
        }
        return self
    }
    
    @discardableResult
    func onTextChange(_ action: @escaping (UITextView) -> Void) -> Self {
        let observer = __UITextViewBlockObserver(
            notificationName: UITextView.textDidChangeNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            if let maxLength = objc_getAssociatedObject(self, &AssociatedKeys.maxLengthKey) as? Int ,maxLength > 0 {
                if self.text.count > maxLength {
                    self.text = String(self.text.prefix(maxLength))
                }
            }
            action(self)
            self.updatePlaceholderVisibility()
        }
        objc_setAssociatedObject(self, &AssociatedKeys.textDidChangeKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func onBeginEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        let observer = __UITextViewBlockObserver(
            notificationName: UITextView.textDidBeginEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            action(self)
            self.updatePlaceholderVisibility()
        }
        objc_setAssociatedObject(self, &AssociatedKeys.textDidBeginEditingKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func onEndEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        let observer = __UITextViewBlockObserver(
            notificationName: UITextView.textDidEndEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            action(self)
            self.updatePlaceholderVisibility()
        }
        objc_setAssociatedObject(self, &AssociatedKeys.textDidEndEditingKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func maxLength(_ length: Int) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.maxLengthKey, length, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
}


// MARK: - private
private extension UITextView {
    struct AssociatedKeys {
        nonisolated(unsafe) static var placeholderLabel: Void?
        nonisolated(unsafe) static var maxLengthKey: Void?
        nonisolated(unsafe) static var textDidChangeKey: Void?
        nonisolated(unsafe) static var textDidBeginEditingKey: Void?
        nonisolated(unsafe) static var textDidEndEditingKey: Void?
        
    }
    
    var placeholderLabel: UILabel? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.placeholderLabel) as? UILabel }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.placeholderLabel,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    func getOrCreatePlaceholderLabel() -> UILabel {
        if let label = placeholderLabel {
            return label
        }
        let label = UILabel()
        label.font = self.font ?? UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = !self.text.isEmpty
        label.textAlignment = self.textAlignment
        label.isUserInteractionEnabled = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainer.lineFragmentPadding + textContainerInset.left),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(textContainer.lineFragmentPadding + textContainerInset.right)),
            label.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -textContainerInset.bottom)
        ])
        placeholderLabel = label
        __UITextViewDisposableClass.runOnce {
            UITextView.once()
        }
        return label
    }
    
    func updatePlaceholderVisibility() {
        placeholderLabel?.isHidden = !text.isEmpty
    }
    
    func updatePlaceholderMaxLayoutWidth() {
        guard self.bounds.width > 0 else {
            return
        }
        let availableWidth = self.bounds.width - (self.textContainer.lineFragmentPadding + self.textContainerInset.left + self.textContainer.lineFragmentPadding + self.textContainerInset.right)
        placeholderLabel?.preferredMaxLayoutWidth = availableWidth
    }
    
    static func once() {
        guard self == UITextView.self else { return }
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(swizzled_layoutSubviews)
        UIView.swizzleMethod(clas: self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }

    @objc func swizzled_layoutSubviews() {
        swizzled_layoutSubviews()
        updatePlaceholderMaxLayoutWidth()
    }
}
@MainActor
private struct __UITextViewDisposableClass {
    private static var hasExecuted = false
    static func runOnce(block: @escaping () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}

private class __UITextViewBlockObserver {
    private var observer: NSObjectProtocol?
    
    init(notificationName: Notification.Name, object: Any? = nil, queue: OperationQueue? = nil, block: @escaping (Notification) -> Void) {
        observer = NotificationCenter.default.addObserver(forName: notificationName, object: object, queue: queue, using: block)
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
