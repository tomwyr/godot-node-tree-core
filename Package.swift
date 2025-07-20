// swift-tools-version: 6.1

import PackageDescription

let package = Package(
  name: "GodotNodeTreeCore",
  platforms: [.macOS(.v14)],
  products: [
    .library(
      name: "GodotNodeTreeCore",
      type: .dynamic,
      targets: ["GodotNodeTreeCore"],
    )
  ],
  dependencies: [
    .package(url: "https://github.com/tomwyr/union-codable", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "GodotNodeTreeCore",
      dependencies: [
        .product(name: "UnionCodable", package: "union-codable")
      ],
    ),
    .testTarget(
      name: "GodotNodeTreeCoreTests",
      dependencies: [
        .target(name: "GodotNodeTreeCore")
      ],
      exclude: ["Resources"],
    ),
  ],
)
