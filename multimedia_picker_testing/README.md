# multimedia_picker_testing

Testing utilities for the [`multimedia_picker`](../multimedia_picker/) plugin.

## Usage

```yaml
dev_dependencies:
  multimedia_picker_testing: ^0.0.1
```

This package provides testing utilities for the `multimedia_picker` plugin, including mock implementations and test helpers.

## Features

- Mock implementation of the platform interface
- Test helpers for common media operations
- Call logging for verification
- Customizable mock responses

## Example

```dart
import 'package:multimedia_picker_testing/multimedia_picker_testing.dart';

void main() {
  late MockMultimediaPickerPlatform mock;

  setUp(() {
    mock = MockMultimediaPickerPlatform()
      ..registerAsPlatform()
      ..reset();
  });

  test('can mock camera capture', () async {
    mock.onOpenCamera = (_, _, _, _) =>
        MediaData(File('test.jpg'), timestamp: DateTime.now());

    final result = await const MultimediaPicker().openCamera();
    expect(result?.file.path, 'test.jpg');
    expect(mock.log.callCount(PickerCall.openCamera), 1);
  });
}
```

## Additional Information

This package is intended for testing purposes only and should not be included in your production dependencies.
