// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwifterUI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SwiftlyUI",
            targets: ["SwiftlyUI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftlyUI",
            path: "SwiftlyUI",
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
            ]
        ),
    ]
)
