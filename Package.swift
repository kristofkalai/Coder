// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coder",
    platforms: [.iOS(.v12), .macOS(.v10_13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Coder",
            targets: ["Coder"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/stateman92/ExceptionCatcher", exact: .init(2, 0, 8))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Coder",
            dependencies: ["ExceptionCatcher"],
            path: "Sources"),
        .testTarget(
            name: "CoderTests",
            dependencies: ["Coder"]),
    ]
)
