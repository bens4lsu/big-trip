// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Bigtrip",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Bigtrip",
            targets: ["Bigtrip"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.5")
    ],
    targets: [
        .executableTarget(
            name: "Bigtrip",
            dependencies: ["Publish", "Yams"]
        )
    ]
)
