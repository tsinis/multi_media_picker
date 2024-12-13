// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "multi_media_picker",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "multi-media-picker", targets: ["multi_media_picker"])
  ],
  dependencies: [
    .package(url: "https://github.com/longitachi/ZLPhotoBrowser.git", exact: Version(4, 5, 7))
  ],
  targets: [
    .target(
      name: "multi_media_picker",
      dependencies: [
        .product(name: "ZLPhotoBrowser", package: "ZLPhotoBrowser")
      ],
      resources: [
        .process("Resources")
      ]
    )
  ],
  swiftLanguageVersions: [.v5]
)
