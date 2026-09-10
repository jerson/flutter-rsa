// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "fast_rsa",
  platforms: [
    .macOS("10.15")
  ],
  products: [
    .library(name: "fast-rsa", targets: ["fast_rsa"])
  ],
  dependencies: [],
  targets: [
    .binaryTarget(
      name: "RSABridge",
      path: "RSABridge.xcframework"
    ),
    .target(
      name: "fast_rsa",
      dependencies: ["RSABridge"]
    )
  ]
)
