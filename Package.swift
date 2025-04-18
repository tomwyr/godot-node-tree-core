// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GodotNodeTreeCore",
  platforms: [.macOS(.v14)],
  products: [
    .library(
      name: "GodotNodeTreeCore",
      type: .dynamic,
      targets: ["GodotNodeTreeCore"]
    )
  ],
  targets: [
    .target(name: "GodotNodeTreeCore")
  ]
)
