// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swifty Measurement",
    products: [
        .library(name: "Core", targets: ["Core"])
    ],
    targets: [
        .target(name: "Core")
    ] + [
        "For",
        "Map",
        "FlatMap",
        "Optionals",
        "CompactMap",
        "CompareMaps",
        "StructAndClass"
    ].map { .executableTarget(name: $0, dependencies: ["Core"]) }
)
