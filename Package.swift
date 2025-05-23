// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Marky-Mark",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "markymark",
            targets: ["markymark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "markymark",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
            ],
            path: "markymark"),
    ],
    swiftLanguageVersions: [.v5]
)
