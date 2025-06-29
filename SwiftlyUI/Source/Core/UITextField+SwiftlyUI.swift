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
    
    convenience init(_ placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    convenience init(customPlaceholder placeholder: String, color: UIColor? = nil) {
        self.init()
        self.placeholder(placeholder, color: color)
    }
    
    @discardableResult
    func attributedPlaceholder(_ attributedText: NSAttributedString) -> Self {
        self.attributedPlaceholder = attributedText
        return self
    }
    
    @discardableResult
    func placeholder(_ text: String, color: UIColor? = nil) -> Self {
        let attributedPlaceholder = NSAttributedString(string: text, attributes: [
            .foregroundColor: color ?? UIColor.placeholderText,
            .font: self.font ?? UIFont.systemFont(ofSize: 14)
        ])
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    @discardableResult
    func placeholderColor(_ color: UIColor? = nil) -> Self {
        let attributedPlaceholder = self.attributedPlaceholder ?? NSAttributedString(string: self.placeholder ?? "", attributes: [
            .foregroundColor: color ?? UIColor.placeholderText,
            .font: self.font ?? UIFont.systemFont(ofSize: 14)
        ])
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    @discardableResult
    func placeholder(customPlaceholder text: String, color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.text = text
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func placeholderColor(customPlaceholder color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func cursorColor(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        placeholderLabel?.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        updatePlaceholderVisibility()
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        placeholderLabel?.textAlignment = alignment
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
    func secureTextEntry(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    @discardableResult
    func maxLength(_ length: Int) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.maxLengthKey, length, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func sizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjusts: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjusts
        return self
    }
    
    @discardableResult
    func minimumFontSize(_ size: CGFloat) -> Self {
        self.minimumFontSize = size
        return self
    }
    
    @discardableResult
    func clearOnBeginEditing(_ clear: Bool = true) -> Self {
        self.clearsOnBeginEditing = clear
        return self
    }
    
    @discardableResult
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
    
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        updatePlaceholderVisibility()
        return self
    }
    
    @discardableResult
    func defaultTextAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.defaultTextAttributes = attributes
        return self
    }
    
    @discardableResult
    func background(_ image: UIImage?) -> Self {
        self.background = image
        return self
    }
    
    @discardableResult
    func disabledBackground(_ image: UIImage?) -> Self {
        self.disabledBackground = image
        return self
    }
    
    @discardableResult
    func allowsEditingTextAttributes(_ allows: Bool) -> Self {
        self.allowsEditingTextAttributes = allows
        return self
    }
    
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.typingAttributes = attributes
        return self
    }
    
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = type
        return self
    }
    
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = type
        return self
    }
    
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = type
        return self
    }
    
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = type
        return self
    }
    
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        self.smartDashesType = type
        return self
    }
    
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = type
        return self
    }
#if compiler(>=5.9)
    @available(iOS 17.0, *)
    @discardableResult
    func inlinePredictionType(_ type: UITextInlinePredictionType) -> Self {
        self.inlinePredictionType = type
        return self
    }
#endif
#if compiler(>=6.0)
    @available(iOS 18.0, *)
    @discardableResult
    func mathExpressionCompletionType(_ type: UITextMathExpressionCompletionType) -> Self {
        self.mathExpressionCompletionType = type
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
#endif
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = appearance
        return self
    }
    
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        self.returnKeyType = type
        return self
    }
    
    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        self.textContentType = type
        return self
    }
    
    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = rules
        return self
    }

}

// MARK: - Action
public extension UITextField {
    @MainActor
    @discardableResult
    func onTextChange(_ action: @escaping (String) -> Void) -> Self {
        return onTextChange { textF in
            action(textF.text ?? "")
        }
    }
    
    @discardableResult
    func onTextChange(_ action: @escaping (UITextField) -> Void) -> Self {
        textChangeObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.textChangeActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func onBeginEditing(_ action: @escaping (UITextField) -> Void) -> Self {
        textFieldDidBeginEditingObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.beginEditingActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
    @discardableResult
    func onBeginEditing(_ action: @escaping () -> Void) -> Self {
        return onBeginEditing { _ in
            action()
        }
    }
    
    @discardableResult
    func onEndEditing(_ action: @escaping (UITextField) -> Void) -> Self {
        textFieldDidEndEditingObserver()
        objc_setAssociatedObject(self, &AssociatedKeys.endEditingActionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self
    }
    
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
