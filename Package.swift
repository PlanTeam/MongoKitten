// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MongoKitten",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MongoKitten",
            targets: ["MongoKitten", "MongoClient"]),
        .library(
            name: "Meow",
            targets: ["Meow"]),
        .library(
            name: "MongoClient",
            targets: ["MongoClient"]),
        .library(
            name: "MongoCore",
            targets: ["MongoCore"]),
    ],
    dependencies: [
        // ✏️
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    
        // 📈
        .package(url: "https://github.com/apple/swift-metrics.git", "1.0.0" ..< "3.0.0"),
        
//        .package(url: "https://github.com/apple/swift-distributed-tracing.git", "1.0.0" ..< "3.0.0"),
        
        // 💾
        .package(url: "https://github.com/OpenKitten/BSON.git", from: "7.0.0"),
        
        // 🚀
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),

        // 📚
        .package(url: "https://github.com/openkitten/NioDNS.git", .revision("39f456b139a0dec7112f7bc8ceee5c5617cc9980")),
        
        // 🔑
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "_MongoKittenCrypto",
            dependencies: []),
        .target(
            name: "MongoCore",
            dependencies: ["BSON", "_MongoKittenCrypto", "NIO", "Logging", "Metrics"]),
        .target(
            name: "MongoKittenCore",
            dependencies: ["MongoClient"]),
        .target(
            name: "MongoKitten",
            dependencies: ["MongoClient", "MongoKittenCore"]),
        .target(
            name: "Meow",
            dependencies: ["MongoKitten"]),
        .target(
            name: "MongoClient",
            dependencies: ["MongoCore", "NIOSSL", "DNSClient"]
        ),
        .testTarget(
            name: "MongoCoreTests",
            dependencies: ["MongoCore"]),
        .testTarget(
            name: "MongoKittenTests",
            dependencies: ["MongoKitten"]),
        .testTarget(
            name: "MeowTests",
            dependencies: ["Meow"]),
    ]
)
