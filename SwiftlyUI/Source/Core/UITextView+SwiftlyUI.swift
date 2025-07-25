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
    /// SwiftlyUI override for `UITextView` to set layout margins.
    @discardableResult
    override func layoutMargins(_ edge: UIEdgeInsets) -> Self {
        super.layoutMargins(edge)
        self.textContainerInset = edge
        return self
    }
}

// MARK: - basics
public extension UITextView {
    /// SwiftlyUI extension for `UITextView`.
    convenience init(_ placeholder: String?) {
        self.init()
        self.placeholder(placeholder, color: nil)
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        if placeholderLabel != nil {
            placeholderLabel?.font(font)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        if placeholderLabel != nil {
            placeholderLabel?.textColor(color)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func foregroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        if placeholderLabel != nil {
            placeholderLabel?.textAlignment = alignment
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        if placeholderLabel != nil {
            placeholderLabel?.textAlignment = alignment
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func placeholder(_ text: String?, color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.text = text
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !self.text.isEmpty
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func placeholderColor(_ color: UIColor? = nil) -> Self {
        let placeholderLabel = getOrCreatePlaceholderLabel()
        placeholderLabel.textColor = color ?? .placeholderText
        placeholderLabel.isHidden = !(self.text?.isEmpty ?? true)
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func editable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func selectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        self.keyboardType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func keyboardAppearance(_ appearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = appearance
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func autocapitalizationType(_ type: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func autocorrectionType(_ type: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func spellCheckingType(_ type: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func smartQuotesType(_ type: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func smartDashesType(_ type: UITextSmartDashesType) -> Self {
        self.smartDashesType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func smartInsertDeleteType(_ type: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func isSecure(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func maxLength(_ length: Int) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.maxLengthKey, length, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textChangeObserver()
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func selectedRange(_ range: NSRange) -> Self {
        self.selectedRange = range
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func dataDetectorTypes(_ types: UIDataDetectorTypes) -> Self {
        self.dataDetectorTypes = types
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func allowsEditingTextAttributes(_ allows: Bool) -> Self {
        self.allowsEditingTextAttributes = allows
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func typingAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.typingAttributes = attributes
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func inputView(_ view: UIView?) -> Self {
        self.inputView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func inputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func clearsOnInsertion(_ clears: Bool) -> Self {
        self.clearsOnInsertion = clears
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func textContainerInset(_ inset: UIEdgeInsets) -> Self {
        self.textContainerInset = inset
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func linkTextAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.linkTextAttributes = attributes
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func usesStandardTextScaling(_ uses: Bool) -> Self {
        self.usesStandardTextScaling = uses
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        self.returnKeyType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func enablesReturnKeyAutomatically(_ enables: Bool) -> Self {
        self.enablesReturnKeyAutomatically = enables
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func secureTextEntry(_ isSecure: Bool) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func textContentType(_ type: UITextContentType) -> Self {
        self.textContentType = type
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @discardableResult
    func passwordRules(_ rules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = rules
        return self
    }
    
#if compiler(>=5.5)
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 15.0, *)
    @discardableResult
    func interactionState(_ state: Any) -> Self {
        self.interactionState = state
        return self
    }
#endif
    
#if compiler(>=5.7)
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 16.0, *)
    @discardableResult
    func findInteractionEnabled(_ enabled: Bool) -> Self {
        self.isFindInteractionEnabled = enabled
        return self
    }
#endif
    
#if compiler(>=5.9)
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 17.0, *)
    @discardableResult
    func borderStyle(_ style: UITextView.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 17.0, *)
    @discardableResult
    func inlinePredictionType(_ type: UITextInlinePredictionType) -> Self {
        self.inlinePredictionType = type
        return self
    }
#endif
    
#if compiler(>=6.0)
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 18.0, *)
    @discardableResult
    func textHighlightAttributes(_ attributes: [NSAttributedString.Key: Any]) -> Self {
        self.textHighlightAttributes = attributes
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 18.0, *)
    @discardableResult
    func writingToolsBehavior(_ behavior: UIWritingToolsBehavior) -> Self {
        self.writingToolsBehavior = behavior
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 18.0, *)
    @discardableResult
    func allowedWritingToolsResultOptions(_ options: UIWritingToolsResultOptions) -> Self {
        self.allowedWritingToolsResultOptions = options
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 18.0, *)
    @discardableResult
    func textFormattingConfiguration(_ configuration: UITextFormattingViewController.Configuration?) -> Self {
        self.textFormattingConfiguration = configuration
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    @available(iOS 18.0, *)
    @discardableResult
    func mathExpressionCompletionType(_ type: UITextMathExpressionCompletionType) -> Self {
        self.mathExpressionCompletionType = type
        return self
    }
        
//    @available(iOS 18.4, *)
//    @discardableResult
//    func conversationContext(_ context: UIConversationContext?) -> Self {
//        self.conversationContext = context
//        return self
//    }
#endif
}

// MARK: - Action
public extension UITextView {
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onTextChange(_ action: @escaping (String) -> Void) -> Self {
        onTextChange { textView in
            action(textView.text)
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onTextChange(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidChangeKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textChangeObserver()
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onBeginEditing(_ action: @escaping () -> Void) -> Self {
        onBeginEditing { _ in
            action()
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onBeginEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidBeginEditingKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        textFieldDidBeginEditingObserver()
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onEndEditing(_ action: @escaping () -> Void) -> Self {
        onEndEditing { _ in
            action()
        }
        return self
    }
    
    /// SwiftlyUI extension for `UITextView`.
    /// 需要注意循环引用的问题，使用时请注意避免强引用循环。
    @discardableResult
    func onEndEditing(_ action: @escaping (UITextView) -> Void) -> Self {
        objc_setAssociatedObject(self, &AssociatedKeys.textDidEndEditingKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
            Task { @MainActor in
                self.handleMaxLength()
                self.updatePlaceholderVisibility()
                if let action = objc_getAssociatedObject(self, &AssociatedKeys.textDidChangeKey) as? (UITextView) -> Void {
                    action(self)
                }
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
              let text = self.text else { return }
        
        let lang = UIApplication.shared.textInputMode?.primaryLanguage
        if lang == "zh-Hans" || lang == "zh-Hant" {
            if let markedTextRange = markedTextRange, !markedTextRange.isEmpty {
                return
            }
        }
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
        
        let originalSelector1 = #selector(setter: UITextView.text)
        let swizzledSelector1 = #selector(swizzled_setText(_:))
        UIView.swizzleMethod(clas: self, originalSelector: originalSelector1, swizzledSelector: swizzledSelector1)
        
        let originalSelector2 = #selector(setter: UITextView.attributedText)
        let swizzledSelector2 = #selector(swizzled_setAttributedText(_:))
        UIView.swizzleMethod(clas: self, originalSelector: originalSelector2, swizzledSelector: swizzledSelector2)
        
    }
    
    @objc func swizzled_setText(_ text: String?) {
        swizzled_setText(text)
        updatePlaceholderVisibility()
        updatePlaceholderMaxLayoutWidth()
    }
    
    @objc func swizzled_setAttributedText(_ attributedText: NSAttributedString?) {
        swizzled_setAttributedText(attributedText)
        updatePlaceholderVisibility()
        updatePlaceholderMaxLayoutWidth()
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
    
    init(notificationName: Notification.Name, object: Any? = nil, queue: OperationQueue? = .main, block: @Sendable @escaping (Notification) -> Void) {
        observer = NotificationCenter.default.addObserver(forName: notificationName, object: object, queue: queue, using: block)
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
#endif
