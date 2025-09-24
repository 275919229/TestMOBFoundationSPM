// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestMOBFoundationSPM",
    platforms: [.iOS(.v12)], // 匹配OC Framework支持的最低版本
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TestMOBFoundationSPM",
            targets: ["TestMOBFoundationSPM"]),
    ],
    dependencies: [.package(url: "https://github.com/275919229/TestFlyVerifyCSDKSPM.git",from: "1.0.0")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "MOBFoundationSPM",
                      path: "Frameworks/MOBFoundation.xcframework"),
        .target(
            name: "TestMOBFoundationSPM",
            dependencies: ["MOBFoundationSPM",.product(name: "TestFlyVerifyCSDKSPM", package: "TestFlyVerifyCSDKSPM")],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
//                .unsafeFlags(["-ObjC"])
            ]),
        .testTarget(
            name: "TestMOBFoundationSPMTests",
            dependencies: ["TestMOBFoundationSPM"]
        ),
    ]
)
