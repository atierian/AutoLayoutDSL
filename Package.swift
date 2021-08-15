// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoLayoutDSL",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "AutoLayoutDSL",
            targets: ["AutoLayoutDSL"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AutoLayoutDSL",
            dependencies: []),
        .testTarget(
            name: "AutoLayoutDSLTests",
            dependencies: ["AutoLayoutDSL"]),
    ]
)
