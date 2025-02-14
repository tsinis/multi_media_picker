// ignore_for_file: avoid-dynamic

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

import 'messages.g.dart';
import 'multimedia_picker_platform.dart';

// ignore: prefer-static-class, prefer-prefixed-global-constants, on purpose.
const _channel = MethodChannel('is.tsin/multimedia_picker');

/// An implementation of [MultimediaPickerPlatform] that uses method channels.
class MethodChannelMultimediaPicker extends MultimediaPickerPlatform {
  /// The [MethodChannel] that is being used by this implementation of the
  /// plugin.
  @visibleForTesting
  MethodChannel get channel => _channel;

  @override
  Future<RawMediaData?> openCamera(
    RawCameraConfiguration cameraConfig,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    final Map<String, dynamic>? result = await channel
        .invokeMapMethod('openCamera', {
          'cameraConfig': cameraConfig.encode(),
          'editConfig': editConfig.encode(),
          'pickerConfig': pickerConfig.encode(),
          'uiConfig': uiConfig.encode(),
        });

    return result == null ? null : RawMediaData.decode(result);
  }

  @override
  Future<RawMediaData?> editMedia(
    RawMediaData data,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    final Map<String, dynamic>? result = await channel
        .invokeMapMethod('editMedia', {
          'data': data.encode(),
          'editConfig': editConfig.encode(),
          'pickerConfig': pickerConfig.encode(),
          'uiConfig': uiConfig.encode(),
        });

    return result == null ? null : RawMediaData.decode(result);
  }

  @override
  Future<List<RawMediaData>?> openGallery(
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    final List<dynamic>? results = await channel
        .invokeListMethod('openGallery', {
          'editConfig': editConfig.encode(),
          'pickerConfig': pickerConfig.encode(),
          'uiConfig': uiConfig.encode(),
        });

    return results?.whereType<Object>().map(RawMediaData.decode).toList();
  }
}
