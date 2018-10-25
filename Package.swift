// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "wtfautolayout",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(url: "https://github.com/johnpatrickmorgan/sparse.git", from: "0.2.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Leaf", "Vapor", "Sparse"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

