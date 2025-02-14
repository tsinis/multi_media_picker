import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

/// The Android implementation of [MultimediaPickerPlatform].
class MultimediaPickerAndroid extends MultimediaPickerPlatform {
  /// The API that connects to the Android platform code via Pigeon.
  final _api = MultiMediaApi();

  /// Registers this class as the default instance
  /// of [MultimediaPickerPlatform].
  static void registerWith() =>
      MultimediaPickerPlatform.instance = MultimediaPickerAndroid();

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
