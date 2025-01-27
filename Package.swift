// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftUIShowcase",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftUIShowcase",
            type: .dynamic,
            targets: ["SwiftUIShowcase"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUIShowcase",
            dependencies: [],
            path: "Sources/SwiftUIShowcase"),
        .testTarget(
            name: "SwiftUIShowcaseTests",
            dependencies: ["SwiftUIShowcase"]),
    ]
)
