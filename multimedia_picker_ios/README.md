# multimedia_picker_ios

The iOS implementation of [`multimedia_picker`](../multimedia_picker/).

## Usage

This package is [endorsed](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#endorsed-federated-plugin), which means you can simply use `multimedia_picker` normally. This package will be automatically included in your app when you do.

## Notes for Contributors

### iOS

This package uses Swift Package Manager for dependency management. The main implementation is in the `ios/multimedia_picker_ios` directory.

### Requirements

- iOS 15.6 or higher
- Xcode 15.0 or higher
- Swift 5.9 or higher

### Permission Requirements

This plugin requires the following permissions to be added to your `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access to capture photos and videos</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app requires photo library access to select media</string>
<key>NSMicrophoneUsageDescription</key>
<string>This app requires microphone access to record videos</string>
```
