//
//  UITextField+SwiftlyUI.swift
//  SwiftlyUI
//
//  Created by CoderChan on 2025/3/2.
//

#if canImport(UIKit) && !os(tvOS)
import UIKit

// MARK: - Layout
public extension UITextField {
    /// SwiftlyUI override for `UITextField` to set layout margins.
    @discardableResult
    override func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        super.layoutMargins(edge)
        paddingInsets = edge
        __UITextFieldDisposableClass.runOnce(block: UITextField.once)
        return self
    }
}

// MARK: - basics
public extension UITextField {
    
    /// SwiftlyUI extension for `UITextField`.
    convenience init(_ placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    /// SwiftlyUI extension for `UITextField`.
    convenience init(customPlaceholder placeholder: String, color: UIColor? = nil) {
        self.init()
        self.placeholder(placeholder, color: color)
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func attributedPlaceholder(_ attributedText: NSAttributedString) -> Self {
        self.attributedPlaceholder = attributedText
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func placeholder(_ text: String, color: UIColor? = nil) -> Self {
        let attributedPlaceholder = NSAttributedString(string: text, attributes: [
            .foregroundColor: color ?? UIColor.placeholderText,
            .font: self.font ?? UIFont.systemFont(ofSize: 14)
        ])
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func placeholderColor(_ color: UIColor? = nil) -> Self {
        let attributedPlaceholder = self.attributedPlaceholder ?? NSAttributedString(string: self.placeholder ?? "", attributes: [
            .foregroundColor: color ?? UIColor.placeholderText,
            .font: self.font ?? UIFont.systemFont(ofSize: 14)
        ])
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func placeholder(customPlaceholder text: String, color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.text = text
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func placeholderColor(customPlaceholder color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func leftViewMode(_ mode: UITextField.ViewMode) -> Self {
        self.leftViewMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func leftView(_ view: UIView?) -> Self {
        self.leftView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func rightViewMode(_ mode: UITextField.ViewMode) -> Self {
        self.rightViewMode = mode
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func rightView(_ view: UIView?) -> Self {
        self.rightView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func clearsOnInsertion(_ clears: Bool) -> Self {
        self.clearsOnInsertion = clears
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func cursorColor(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        placeholderLabel?.font = font
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        updatePlaceholderVisibility()
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        placeholderLabel?.textAlignment = alignment
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        placeholderLabel?.textAlignment = alignment
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        self.keyboardType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func isSecure(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func secureTextEntry(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func maxLength(_ length: Int) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.maxLengthKey, length, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func sizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjusts
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func minimumFontSize(_ size: CGFloat) -> Self {
        self.minimumFontSize = size
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func clearOnBeginEditing(_ clear: Bool = true) -> Self {
        self.clearsOnBeginEditing = clear
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        updatePlaceholderVisibility()
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func defaultTextAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.defaultTextAttributes = attributes
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func background(_ image: UIImage?) -> Self {
        self.background = image
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func disabledBackground(_ image: UIImage?) -> Self {
        self.disabledBackground = image
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func allowsEditingTextAttributes(_ allows: Bool) -> Self {
        self.allowsEditingTextAttributes = allows
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.typingAttributes = attributes
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        self.smartDashesType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = type
        return self
    }
    
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UITextField`.
    @available(iOS 15.0, *)
    @discardableResult
    func interactionState(_ state: Any) -> Self {
        self.interactionState = state
        return self
    }
#endif
    
#if compiler(>=5.9)
    /// SwiftlyUI extension for `UITextField`.
    @available(iOS 17.0, *)
    @discardableResult
    func inlinePredictionType(_ type: UITextInlinePredictionType) -> Self {
        self.inlinePredictionType = type
        return self
    }
#endif
#if compiler(>=6.0)
    /// SwiftlyUI extension for `UITextField`.
    @available(iOS 18.0, *)
    @discardableResult
    func mathExpressionCompletionType(_ type: UITextMathExpressionCompletionType) -> Self {
        self.mathExpressionCompletionType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @available(iOS 18.0, *)
    @discardableResult
    func writingToolsBehavior(_ behavior: UIWritingToolsBehavior) -> Self {
        self.writingToolsBehavior = behavior
        return self
    }
    /// SwiftlyUI extension for `UITextField`.
    @available(iOS 18.0, *)
    @discardableResult
    func allowedWritingToolsResultOptions(_ options: UIWritingToolsResultOptions) -> Self {
        self.allowedWritingToolsResultOptions = options
        return self
    }
#endif
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = appearance
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        self.returnKeyType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        self.textContentType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = rules
        return self
    }

}

// MARK: - Action
public extension UITextField {
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @MainActor
    @discardableResult
    func onTextChange(_ action: @escaping (String) -> Void) -> Self {
        return onTextChange { textF in
            action(textF.text ?? "")
        }
    }
    
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onTextChange(_ action: @escaping (UITextField) -> Void) -> Self {
        textChangeObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.textChangeActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onBeginEditing(_ action: @escaping (UITextField) -> Void) -> Self {
        textFieldDidBeginEditingObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.beginEditingActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onBeginEditing(_ action: @escaping () -> Void) -> Self {
        return onBeginEditing { _ in
            action()
        }
    }
    
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onEndEditing(_ action: @escaping (UITextField) -> Void) -> Self {
        textFieldDidEndEditingObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.endEditingActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    /// SwiftlyUI extension for `UITextField`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onEndEditing(_ action: @escaping () -> Void) -> Self {
        return onEndEditing { _ in
            action()
        }
    }
}

// MARK: - private
fileprivate extension UITextField {
    struct AssociatedKeys {
        nonisolated(unsafe) static var paddingKey: Void?
        nonisolated(unsafe) static var placeholderLabelKey: Void?
        nonisolated(unsafe) static var maxLengthKey: Void?
        nonisolated(unsafe) static var textChangeActionKey: Void?
        nonisolated(unsafe) static var beginEditingActionKey: Void?
        nonisolated(unsafe) static var endEditingActionKey: Void?
        nonisolated(unsafe) static var observerKey: Void?
        nonisolated(unsafe) static var endEditingObserverKey: Void?
        nonisolated(unsafe) static var beginEditingObserverKey: Void?
    }
    
    var paddingInsets: UIEdgeInsets {
        get { objc_getAssociatedObject(self, &AssociatedKeys.paddingKey) as? UIEdgeInsets ?? .zero }
        set { objc_setAssociatedObject(self, &AssociatedKeys.paddingKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var placeholderLabel: UILabel? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.placeholderLabelKey) as? UILabel }
        set { objc_setAssociatedObject(self, &AssociatedKeys.placeholderLabelKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var observer: __UITextFieldBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.observerKey) as? __UITextFieldBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.observerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var beginEditingObserver: __UITextFieldBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.beginEditingObserverKey) as? __UITextFieldBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.beginEditingObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var endEditingObserver: __UITextFieldBlockObserver? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.endEditingObserverKey) as? __UITextFieldBlockObserver }
        set { objc_setAssociatedObject(self, &AssociatedKeys.endEditingObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func getOrCreatePlaceholderLabel() -> UILabel {
        if let label = placeholderLabel {
            return label
        }
        let label = UILabel()
        label.font = self.font ?? .systemFont(ofSize: 14)
        
        if #available(iOS 13.0, *) {
            label.textColor = .placeholderText
        } else {
            label.textColor = .lightGray
        }
        label.numberOfLines = 1
        label.isHidden = !(text?.isEmpty ?? true)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        addSubview(label)
        label.fillSuperMargins(edge: paddingInsets)
        placeholderLabel = label
        textChangeObserver()
        updatePlaceholderVisibility()
        return label
    }
    
    func textChangeObserver() {
        if observer != nil {
            return
        }
        observer = __UITextFieldBlockObserver(
            notificationName: UITextField.textDidChangeNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleMaxLength()
                self.updatePlaceholderVisibility()
            }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.textChangeActionKey) as? (UITextField) -> Void {
                action(self)
            }
        }
    }
    
    func textFieldDidBeginEditingObserver() {
        if beginEditingObserver != nil {
            return
        }
        beginEditingObserver = __UITextFieldBlockObserver(
            notificationName: UITextField.textDidBeginEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.beginEditingActionKey) as? (UITextField) -> Void {
                action(self)
            }
        }
    }
    
    func textFieldDidEndEditingObserver() {
        if endEditingObserver != nil {
            return
        }
        endEditingObserver = __UITextFieldBlockObserver(
            notificationName: UITextField.textDidEndEditingNotification,
            object: self
        ) { [weak self] _ in
            guard let self = self else { return }
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.endEditingActionKey) as? (UITextField) -> Void {
                action(self)
            }
        }
    }
    
    func updatePlaceholderVisibility() {
        placeholderLabel?.isHidden = !(text?.isEmpty ?? true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        handleMaxLength()
        updatePlaceholderVisibility()
        if let action = objc_getAssociatedObject(self, &AssociatedKeys.textChangeActionKey) as? (UITextField) -> Void {
            action(self)
        }
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if let action = objc_getAssociatedObject(self, &AssociatedKeys.beginEditingActionKey) as? (UITextField) -> Void {
            action(self)
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        if let action = objc_getAssociatedObject(self, &AssociatedKeys.endEditingActionKey) as? (UITextField) -> Void {
            action(self)
        }
    }
    
    func handleMaxLength() {
        guard let maxLength = objc_getAssociatedObject(self, &AssociatedKeys.maxLengthKey) as? Int,
              maxLength > 0,
              let text = self.text,
              text.count > maxLength else { return }
        
        self.text = String(text.prefix(maxLength))
    }
}

private extension UITextField {
    static func once() {
        guard self == UITextField.self else { return }
        let originalSelector1 = #selector(UITextField.textRect(forBounds:))
        let swizzledSelector1 = #selector(UITextField.swizzled_textRect(forBounds:))
        UIView.swizzleMethod(clas: UITextField.self, originalSelector: originalSelector1, swizzledSelector: swizzledSelector1)
        
        let originalSelector2 = #selector(UITextField.editingRect(forBounds:))
        let swizzledSelector2 = #selector(UITextField.swizzled_editingRect(forBounds:))
        UIView.swizzleMethod(clas: UITextField.self, originalSelector: originalSelector2, swizzledSelector: swizzledSelector2)
        
    }
    
    @objc func swizzled_textRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = swizzled_textRect(forBounds: bounds)
        return originalRect.inset(by: paddingInsets)
    }
    
    @objc func swizzled_editingRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = swizzled_editingRect(forBounds: bounds)
        return originalRect.inset(by: paddingInsets)
    }
}
@MainActor
private struct __UITextFieldDisposableClass {
    private static var hasExecuted = false
    static func runOnce(block: () -> Void) {
        guard !hasExecuted else { return }
        block()
        hasExecuted = true
    }
}

private class __UITextFieldBlockObserver {
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
