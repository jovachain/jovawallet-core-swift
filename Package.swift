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
            url: "https://github.com/jovachain/jovawallet-core-swift/releases/download/v0.3.0/JovaCoreFFI.xcframework.zip",
            checksum: "506b0bb5f2bc23f72daca43f0dbada729f5506a6761569394e7382f961a39a07"
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
