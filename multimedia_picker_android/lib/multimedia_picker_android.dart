import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

/// The Android implementation of [MultimediaPickerPlatform].
class MultimediaPickerAndroid extends MultimediaPickerPlatform {
  /// Registers this class as the default instance
  /// of [MultimediaPickerPlatform].
  static void registerWith() =>
      MultimediaPickerPlatform.instance = MultimediaPickerAndroid();
}
