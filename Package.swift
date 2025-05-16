// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwifterUI",
    platforms: [.iOS(.v13)],
    products: [
        // 主库
        .library(
            name: "SwiftlyUI",
            targets: ["SwiftlyUI"]
        ),
    ],
    dependencies: [],
    targets: [
        // 核心模块（不依赖 SnapKit）
        .target(
            name: "SwiftlyUI",
            path: "SwiftlyUI",
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
            ]
        ),
    ]
)
