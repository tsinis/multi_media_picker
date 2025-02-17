import 'dart:io' show File;

import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_test/flutter_test.dart';
import 'package:multimedia_picker/multimedia_picker.dart';
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';
import 'package:multimedia_picker_testing/src/mock_multimedia_picker_platform.dart';
import 'package:multimedia_picker_testing/src/models/picker_call.dart';

void main() => group('$MockMultimediaPickerPlatform', () {
  const highLevelHandler = 'high-level handler';
  const lowLevelHandler = 'low-level handler';
  final file = File('test/src/mock_multimedia_picker_platform_test.dart');
  late MockMultimediaPickerPlatform mock; // ignore: avoid-late-keyword, a test.

  setUp(
    () =>
        mock =
            MockMultimediaPickerPlatform()
              ..registerAsPlatform()
              ..reset(),
  );

  group('openCamera', () {
    test(highLevelHandler, () async {
      mock.onOpenCamera = (_, _, _, _) => MediaData.ts(file);

      final result = await const MultimediaPicker().openCamera();

      expect(result?.file.path, file.path);
      expect(mock.log.callCount(PickerCall.openCamera), 1);
    });

    test(lowLevelHandler, () async {
      mock.onOpenCamera =
          (_, _, _, _) => RawMediaData(path: file.path, type: MediaType.image);

      final result = await MultimediaPickerPlatform.instance.openCamera(
        RawCameraConfiguration(),
        RawEditConfiguration(),
        RawPickerConfiguration(),
        RawUiConfiguration(),
      );

      expect(result?.path, file.path);
      expect(mock.log.callCount(PickerCall.openCamera), 1);
    });

    test('on exception', () {
      mock.onOpenCamera = (_, _, _, _) => throw PlatformException(code: '');
      expect(mock.log.hasZeroInteractions, isTrue);
      expect(
        // ignore: avoid-redundant-async, false positive.
        () async => const MultimediaPicker().openCamera(),
        throwsA(isA<PlatformException>()),
      );
      expect(mock.log.callCount(PickerCall.openCamera), 1);
    });
  });

  group('editMedia', () {
    test(highLevelHandler, () async {
      mock.onEditMedia = (_, _, _, _) => MediaData.ts(file);

      final originalMedia = MediaData.ts(file);
      final result = await const MultimediaPicker().editMedia(originalMedia);

      expect(result?.file.path, file.path);
      expect(mock.log.callCount(PickerCall.editMedia), 1);
    });

    test('exception handler', () {
      mock.onEditMedia = (_, _, _, _) => throw PlatformException(code: '');
      expect(mock.log.hasZeroInteractions, isTrue);
      expect(
        // ignore: avoid-redundant-async, false positive.
        () async => const MultimediaPicker().editMedia(MediaData.ts(file)),
        throwsA(isA<PlatformException>()),
      );
      expect(mock.log.callCount(PickerCall.editMedia), 1);
    });

    test(lowLevelHandler, () async {
      mock.onEditMedia =
          (_, _, _, _) => RawMediaData(path: file.path, type: MediaType.image);

      final originalMedia = RawMediaData(
        path: file.path,
        type: MediaType.image,
      );
      final result = await MultimediaPickerPlatform.instance.editMedia(
        originalMedia,
        RawEditConfiguration(),
        RawPickerConfiguration(),
        RawUiConfiguration(),
      );

      expect(result?.path, file.path);
      expect(mock.log.callCount(PickerCall.editMedia), 1);
    });
  });

  group('openGallery', () {
    test('exception', () {
      mock.onOpenGallery = (_, _, _) => throw PlatformException(code: '');
      expect(mock.log.hasZeroInteractions, isTrue);
      expect(
        // ignore: avoid-redundant-async, false positive.
        () async => const MultimediaPicker().openGallery(),
        throwsA(isA<PlatformException>()),
      );
      expect(mock.log.callCount(PickerCall.openGallery), 1);
    });

    test(highLevelHandler, () async {
      mock.onOpenGallery = (_, _, _) => [MediaData.ts(file)];

      final resultsList = await const MultimediaPicker().openGallery();

      // ignore_for_file: avoid-unsafe-collection-methods, this is test.
      expect(resultsList.single.file.path, file.path);
      expect(mock.log.callCount(PickerCall.openGallery), 1);
    });

    test(lowLevelHandler, () async {
      mock.onOpenGallery =
          (_, _, _) => [RawMediaData(path: file.path, type: MediaType.image)];

      final resultsList = await MultimediaPickerPlatform.instance.openGallery(
        RawEditConfiguration(),
        RawPickerConfiguration(),
        RawUiConfiguration(),
      );

      expect(resultsList?.single.path, file.path);
      expect(mock.log.callCount(PickerCall.openGallery), 1);
    });
  });
});
