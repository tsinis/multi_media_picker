// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "multimedia_picker_ios",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "multimedia-picker-ios", targets: ["multimedia_picker_ios"])
  ],
  dependencies: [
    .package(url: "https://github.com/tsinis/ZLPhotoBrowser.git", branch: "feat/buttons")
  ],
  targets: [
    .target(
      name: "multimedia_picker_ios",
      dependencies: ["ZLPhotoBrowser"],
      resources: [.process("Resources")]
    )
  ]
)
