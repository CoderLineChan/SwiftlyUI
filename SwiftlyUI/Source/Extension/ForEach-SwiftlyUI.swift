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
    
    public var swiftlyUIViews: [UIView] {
        data.flatMap { element in
            content(element).swiftlyUIViews
        }
    }
}

public protocol SwiftlyUIViewBuildingProtocol {
    var swiftlyUIViews: [UIView] { get }
}

extension UIView: @preconcurrency SwiftlyUIViewBuildingProtocol {
    public var swiftlyUIViews: [UIView] { [self] }
}

extension Array: SwiftlyUIViewBuildingProtocol where Element: SwiftlyUIViewBuildingProtocol {
    public var swiftlyUIViews: [UIView] {
        flatMap { $0.swiftlyUIViews }
    }
}



#endif
