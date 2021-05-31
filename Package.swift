// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUICardStack",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v13),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftUICardStack",
            targets: ["SwiftUICardStack"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUICardStack",
            dependencies: []
        ),
    ]
)
