// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AnchoriumLink",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AnchoriumLink",
            targets: ["AnchoriumLink"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AnchoriumLink",
            url: "https://github.com/anchoriumlink/AnchoriumLink-SPM/releases/download/1.0.0/anchoriumlinkframework.xcframework.zip",
            checksum: "d78374192066f3766be2518e64841b31ac617804e37f203bc0642d6c22b3bfd4"
        )
    ]
)
