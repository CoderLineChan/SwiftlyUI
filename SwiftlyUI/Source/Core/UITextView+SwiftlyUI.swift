//
//  UITextView+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

#if canImport(UIKit) && !os(tvOS)
import UIKit

// MARK: - Layout
public extension UITextView {
    @discardableResult
    override func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        super.layoutMargins(edge)
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
    
    @discardableResult
    func maxLength(_ length: Int) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.maxLengthKey, length, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func selectedRange(_ range: NSRange) -> Self {
        self.selectedRange = range
        return self
    }
    
    @discardableResult
    func dataDetectorTypes(_ types: UIDataDetectorTypes) -> Self {
        self.dataDetectorTypes = types
        return self
    }
    
    @discardableResult
    func allowsEditingTextAttributes(_ allows: Bool) -> Self {
        self.allowsEditingTextAttributes = allows
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.typingAttributes = attributes
        return self
    }
    
    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }
    
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    @discardableResult
    func clearsOnInsertion(_ clears: Bool) -> Self {
        self.clearsOnInsertion = clears
        return self
    }
    
    @discardableResult
    func textContainerInset(_ inset: UIEdgeInsets) -> Self {
        self.textContainerInset = inset
        return self
    }
    
    @discardableResult
    func linkTextAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.linkTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func usesStandardTextScaling(_ uses: Bool) -> Self {
        self.usesStandardTextScaling = uses
        return self
    }
    
#if compiler(>=5.5)
    @available(iOS 15.0, *)
    @discardableResult
    func interactionState(_ state: Any) -> Self {
        self.interactionState = state
        return self
    }
#endif
    
#if compiler(>=5.7)
    @available(iOS 16.0, *)
    @discardableResult
    func findInteractionEnabled(_ enabled: Bool) -> Self {
        self.isFindInteractionEnabled = enabled
        return self
    }
#endif
    
#if compiler(>=5.9)
    @available(iOS 17.0, *)
    @discardableResult
    func borderStyle(_ style: UITextView.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
#endif
    
#if compiler(>=6.0)
    @available(iOS 18.0, *)
    @discardableResult
    func textHighlightAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.textHighlightAttributes = attributes
        return self
    }
    
    @available(iOS 18.0, *)
    @discardableResult
    func writingToolsBehavior(_ behavior: UIWritingToolsBehavior) -> Self {
        self.writingToolsBehavior = behavior
        return self
    }
    
    @available(iOS 18.0, *)
    @discardableResult
    func allowedWritingToolsResultOptions(_ options: UIWritingToolsResultOptions) -> Self {
        self.allowedWritingToolsResultOptions = options
        return self
    }
    
    @available(iOS 18.0, *)
    @discardableResult
    func textFormattingConfiguration(_ configuration: UITextFormattingViewController.Configuration?) -> Self {
        self.textFormattingConfiguration = configuration
        return self
    }
#endif
}

// MARK: - Action
public extension UITextView {
    @discardableResult
    func onTextChange(_ action: @escaping (String) -> Void) -> Self {
        onTextChange { textView in
            action(textView.text)
        }
        return self
    }
    
    @discardableResult
    func onTextChange(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidChangeKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textChangeObserver()
        return self
    }
    
    @discardableResult
    func onBeginEditing(_ action: @escaping () -> Void) -> Self {
        onBeginEditing { _ in
            action()
        }
        return self
    }
    
    @discardableResult
    func onBeginEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidBeginEditingKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textFieldDidBeginEditingObserver()
        return self
    }
    
    @discardableResult
    func onEndEditing(_ action: @escaping () -> Void) -> Self {
        onEndEditing { _ in
            action()
        }
        return self
    }
    
    @discardableResult
    func onEndEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidEndEditingKey, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textFieldDidEndEditingObserver()
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
        nonisolated(unsafe) static var observerKey: Void?
        nonisolated(unsafe) static var endEditingObserverKey: Void?
        nonisolated(unsafe) static var beginEditingObserverKey: Void?
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
    var observer: __UITextViewBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.observerKey) as? __UITextViewBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.observerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var beginEditingObserver: __UITextViewBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.beginEditingObserverKey) as? __UITextViewBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.beginEditingObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var endEditingObserver: __UITextViewBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.endEditingObserverKey) as? __UITextViewBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.endEditingObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
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
        label.leftToSuper(isMargins: false, offset: textContainer.lineFragmentPadding + textContainerInset.left)
        label.rightToSuper(isMargins: false, offset: -(textContainer.lineFragmentPadding + textContainerInset.right))
        label.topToSuper(isMargins: false, offset: textContainerInset.top)
        label.bottomToSuper(isMargins: false, offset: -textContainerInset.bottom)

        placeholderLabel = label
        textChangeObserver()
        updatePlaceholderVisibility()
        __UITextViewDisposableClass.runOnce {
            UITextView.once()
        }
        return label
    }
    
    func textChangeObserver() {
        if observer != nil {
            return
        }
        observer = __UITextViewBlockObserver(
            notificationName: UITextView.textDidChangeNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleMaxLength()
                self.updatePlaceholderVisibility()
            }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textDidChangeKey) as? (UITextView) -> Void {
                action(self)
            }
        }
    }
    
    func textFieldDidBeginEditingObserver() {
        if beginEditingObserver != nil {
            return
        }
        beginEditingObserver = __UITextViewBlockObserver(
            notificationName: UITextView.textDidBeginEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updatePlaceholderVisibility()
            }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textDidBeginEditingKey) as? (UITextView) -> Void {
                action(self)
            }
        }
    }
    
    func textFieldDidEndEditingObserver() {
        if endEditingObserver != nil {
            return
        }
        endEditingObserver = __UITextViewBlockObserver(
            notificationName: UITextView.textDidEndEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updatePlaceholderVisibility()
            }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textDidEndEditingKey) as? (UITextView) -> Void {
                action(self)
            }
        }
    }
    
    func handleMaxLength() {
        guard let maxLength = objc_getAssociatedObject(self, &AssociatedKeys.maxLengthKey) as? Int,
              maxLength > 0,
              let text = self.text,
              text.count > maxLength else { return }
        
        self.text = String(text.prefix(maxLength))
    }
    @MainActor
    func updatePlaceholderVisibility() {
        placeholderLabel?.isHidden = !text.isEmpty
    }
    
    func updatePlaceholderMaxLayoutWidth() {
        guard self.bounds.width > 0 else {
            return
        }
        let availableWidth = self.bounds.width - (self.textContainer.lineFragmentPadding + self.textContainerInset.left + self.textContainer.lineFragmentPadding + self.textContainerInset.right)
        placeholderLabel?.leftToSuper(isMargins: false, offset: textContainer.lineFragmentPadding + textContainerInset.left)
        placeholderLabel?.rightToSuper(isMargins: false, offset: -(textContainer.lineFragmentPadding + textContainerInset.right))
        placeholderLabel?.topToSuper(isMargins: false, offset: textContainerInset.top)
        placeholderLabel?.bottomToSuper(isMargins: false, offset: -textContainerInset.bottom)
        
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
    
    init(notificationName: Notification.Name, object: Any? = nil, queue: OperationQueue? = nil, block: @Sendable @escaping (Notification) -> Void) {
        observer = NotificationCenter.default.addObserver(forName: notificationName, object: object, queue: queue, using: block)
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
#endif
