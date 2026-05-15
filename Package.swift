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
            url: "https://github.com/jovachain/jovawallet-core-swift/releases/download/v0.3.1/JovaCoreFFI.xcframework.zip",
            checksum: "6fc196dcffe5ef502c670d3cadfc2507a38fa2986d966a933c40be81cab0a5f2"
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
