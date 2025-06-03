//
//  UIKitPreviewable.swift
//  Pods
//
//  Created by CoderChan on 2025/6/3.
//

#if canImport(UIKit)
import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

// MARK: - UIViewController 预览封装
public struct UIViewControllerPreview<Controller: UIViewController>: UIViewControllerRepresentable {
    private let controller: () -> Controller
    
    public init(_ controller: @escaping () -> Controller) {
        self.controller = controller
    }
    
    public func makeUIViewController(context: Context) -> Controller {
        controller()
    }
    
    public func updateUIViewController(_ uiViewController: Controller, context: Context) {}
}

// MARK: - UIView 预览封装
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    private let view: () -> View
    
    public init(_ view: @escaping () -> View) {
        self.view = view
    }
    
    public func makeUIView(context: Context) -> View {
        view()
    }
    
    public func updateUIView(_ uiView: View, context: Context) {}
}

#endif
#endif
