// swift-tools-version: 6.1

///
import PackageDescription

///
let package = Package(
    name: "TextBlockModule",
    products: [
        .library(
            name: "TextBlockModule",
            targets: ["TextBlockModule"]
        ),
    ],
    dependencies: [
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/FoundationToolkit",
            .upToNextMinor(from: "0.8.5")
        ),
    ],
    targets: [
        
        ///
        .target(
            name: "TextBlockModule",
            dependencies: [
                "FoundationToolkit",
            ]
        ),
        
        ///
        .testTarget(
            name: "TextBlockModule-tests",
            dependencies: [
                "TextBlockModule",
            ]
        ),
    ]
)
