// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "JovaCore",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(name: "JovaCore", targets: ["JovaCore"]),
    ],
    targets: [
        .binaryTarget(
            name: "JovaCoreFFI",
            url: "https://github.com/jovachain/jovawallet-core-swift/releases/download/v0.4.0/JovaCoreFFI.xcframework.zip",
            checksum: "b52307642cce9f33991964902e4aebe218b9c76862fe137cc85745032fc61770"
        ),
        .target(
            name: "JovaCore",
            dependencies: ["JovaCoreFFI"],
            path: "Sources/JovaCore"
        ),
        .testTarget(
            name: "JovaCoreTests",
            dependencies: ["JovaCore"],
            path: "Tests/JovaCoreTests"
        ),
    ]
)
