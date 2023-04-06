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
    dependencies: [],
    targets: [
        .target(
            name: "markymark",
            dependencies: [],
            path: "markymark"),
    ],
    swiftLanguageVersions: [.v5]
)
