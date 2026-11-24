// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "multimedia_picker_ios",
  platforms: [.iOS(.v13)],
  products: [
    .library(name: "multimedia-picker-ios", targets: ["multimedia_picker_ios"])
  ],
  dependencies: [
    // The exact commit (head of "feat/buttons"), so a push to the fork does not change apps.
    .package(
      url: "https://github.com/tsinis/ZLPhotoBrowser.git",
      revision: "2b71924ffc855daf3c0cebcb22d5ddffe7ebd45c"
    )
  ],
  targets: [
    .target(
      name: "multimedia_picker_ios",
      dependencies: ["ZLPhotoBrowser"],
      resources: [.process("Resources")]
    )
  ]
)
