import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

/// The iOS implementation of [MultimediaPickerPlatform].
class MultimediaPickerIOS extends MultimediaPickerPlatform {
  /// Creates a new plugin implementation instance.
  MultimediaPickerIOS({@visibleForTesting MultiMediaApi? api})
    : _api = api ?? MultiMediaApi();

  final MultiMediaApi _api;

  /// Registers this class as the default instance
  /// of [MultimediaPickerPlatform].
  static void registerWith() =>
      MultimediaPickerPlatform.instance = MultimediaPickerIOS();

  @override
  Future<RawMediaData?> openCamera(
    RawCameraConfiguration cameraConfig,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) => _api.openCamera(cameraConfig, editConfig, pickerConfig, uiConfig);

  @override
  Future<RawMediaData?> editMedia(
    RawMediaData data,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) => _api.editMedia(data, editConfig, pickerConfig, uiConfig);

  @override
  Future<List<RawMediaData>?> openGallery(
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) => _api.openGallery(editConfig, pickerConfig, uiConfig);
}
