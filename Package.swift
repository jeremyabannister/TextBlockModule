// swift-tools-version: 5.8

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
            "0.7.0" ..< "0.8.0"
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
