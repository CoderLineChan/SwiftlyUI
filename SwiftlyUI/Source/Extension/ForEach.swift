//
//  ForEach.swift
//  Pods
//
//  Created by CoderChan on 2025/6/4.
//

#if canImport(UIKit)
import UIKit

public struct ForEach<Data, Content>: SwiftlyUIViewBuildingProtocol where Data: Collection, Content: SwiftlyUIViewBuildingProtocol {
    private let data: Data
    private let content: (Data.Element) -> Content
    
    public init(_ data: Data, @SwiftlyUIBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
    
    public var views: [UIView] {
        data.flatMap { element in
            content(element).views
        }
    }
}

public protocol SwiftlyUIViewBuildingProtocol {
    var views: [UIView] { get }
}

extension UIView: @preconcurrency SwiftlyUIViewBuildingProtocol {
    public var views: [UIView] { [self] }
}

extension Array: SwiftlyUIViewBuildingProtocol where Element: SwiftlyUIViewBuildingProtocol {
    public var views: [UIView] {
        flatMap { $0.views }
    }
}



#endif
