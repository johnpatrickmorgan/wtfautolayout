// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "wtfautolayout",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(url: "https://github.com/johnpatrickmorgan/sparse.git", .branch("master")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .branch("master"))
    ],
    targets: [
        .target(name: "App", dependencies: ["Leaf", "Vapor", "Sparse"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "SnapshotTesting"])
    ]
)

