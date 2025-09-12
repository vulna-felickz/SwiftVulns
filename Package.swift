// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "VulnerableSwiftApp",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
    ],
    products: [
        .executable(
            name: "VulnerableSwiftApp",
            targets: ["VulnerableSwiftApp"]),
    ],
    targets: [
        .executableTarget(
            name: "VulnerableSwiftApp"),
        .testTarget(
            name: "VulnerableSwiftAppTests",
            dependencies: ["VulnerableSwiftApp"]),
    ]
)