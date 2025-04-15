// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "GodotSwiftTree",
  platforms: [.macOS(.v14)],
  products: [
    .library(
      name: "GodotNodeTree",
      type: .dynamic,
      targets: ["GodotNodeTree"]
    )
  ],
  targets: [
    .target(name: "GodotNodeTree")
  ]
)
