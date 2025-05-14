// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Marky-Mark",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "markymark",
            targets: ["markymark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "10.0.0"),
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
