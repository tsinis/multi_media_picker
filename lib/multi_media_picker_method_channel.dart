import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'multi_media_picker_platform_interface.dart';

/// An implementation of [MultiMediaPickerPlatform] that uses method channels.
class MethodChannelMultiMediaPicker extends MultiMediaPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('multi_media_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
