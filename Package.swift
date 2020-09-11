// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FioriSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FioriSwiftUI",
            type: .dynamic,
            targets: ["FioriSwiftUI"]),
        .library(
            name: "FioriCharts",
            type: .dynamic,
            targets: ["FioriCharts"]),
        .library(
            name: "FioriIntegrationCards",
            type: .dynamic,
            targets: ["FioriIntegrationCards"]),
//        .library(
//            name: "Floorplan",
//            type: .dynamic,
//            targets: ["Floorplan"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "TinyNetworking", url: "https://github.com/objcio/tiny-networking", from: "0.2.0"),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.2.3"),
        .package(name: "ObservableArray", url: "https://github.com/sstadelman/observable-array.git", from: "1.2.0"),
        .package(url: "https://github.com/marmelroy/Zip.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "FioriSwiftUI",
            dependencies: ["FioriIntegrationCards", /*"Floorplan",*/ "FioriCharts", "FioriSwiftUICore"]),
//        .target(
//            name: "Floorplan",
//            dependencies: []),
        .target(
            name: "FioriIntegrationCards",
            dependencies: ["AnyCodable", "TinyNetworking", "ObservableArray", "FioriCharts", "Zip"]),
        .target(
            name: "FioriCharts",
            dependencies: ["FioriSwiftUICore"],
            exclude: ["TestCases/SF_EnergyBenchmarking.csv"]),
        .target(
            name: "FioriSwiftUICore",
            dependencies: [],
            resources: [.process("FioriSwiftUICore.strings")]),
        .testTarget(
            name: "FioriSwiftUITests",
            dependencies: ["FioriSwiftUI"]),
    ]
)
