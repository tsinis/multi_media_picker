# multimedia_picker

A Flutter plugin for iOS that provides a unified interface for picking media (images/videos) from gallery or camera, with built-in editing capabilities.

## Features

- Pick media from gallery (single or multiple selection)
- Capture media using camera
- Edit media with built-in editors
- Support for both iOS and Android platforms
- Customizable UI configuration
- Type-safe API

## Getting started

```yaml
dependencies:
  multimedia_picker: ^0.0.1
```

## Usage

```dart
import 'package:multimedia_picker/multimedia_picker.dart';

// Initialize picker
final picker = MultimediaPicker();

// Open camera
final mediaFromCamera = await picker.openCamera();

// Open gallery
final mediaFromGallery = await picker.openGallery();

// Edit existing media
final editedMedia = await picker.editMedia(existingMedia);
```

## Additional information

For more detailed examples and API documentation, please visit [example app](example/).
