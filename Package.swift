// swift-tools-version: 5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BITAVWrapper",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "BITAVWrapper",
      targets: ["BITAVWrapper"]),
  ],
  targets: [
    /// Main BITAVWrapper target
    .target(
      name: "BITAVWrapper"),
    .testTarget(
      name: "BITAVWrapperTests",
      dependencies: ["BITAVWrapper"])
  ])
