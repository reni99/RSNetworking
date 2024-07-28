// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RSNetworking",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RSNetworking",
            targets: ["RSNetworking"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RSNetworking",
            dependencies: []),
        .testTarget(
            name: "RSNetworkingTests",
            dependencies: ["RSNetworking"]),
    ]
)
