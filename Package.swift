// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwifterUI",
    platforms: [.iOS(.v11)],
    products: [
        // 主库
        .library(
            name: "SwiftlyUI",
            targets: ["SwiftlyUI"]
        ),
        // SnapKit 扩展库
        .library(
            name: "SwiftlyUISnapKitExt",
            targets: ["SwiftlyUISnapKitExt"]
        )
    ],
    dependencies: [
        // 👇 关键点：声明 SnapKit 为外部依赖
        .package(
            url: "https://github.com/SnapKit/SnapKit.git",
            .upToNextMajor(from: "5.6.0")
        )
    ],
    targets: [
        // 核心模块（不依赖 SnapKit）
        .target(
            name: "SwiftlyUI",
            path: "Sources/Core" // 确保路径正确
        ),
        
        // SnapKit 扩展模块
        .target(
            name: "SwiftlyUISnapKitExt",
            dependencies: [
                // 👇 内部依赖
                "SwiftlyUI",
                // 👇 外部依赖声明方式
                .product(
                    name: "SnapKit",
                    package: "SnapKit" // 必须与 dependencies 中的名称一致
                )
            ],
            path: "Sources/SnapKitExt" // 确保路径正确
        )
    ]
)
