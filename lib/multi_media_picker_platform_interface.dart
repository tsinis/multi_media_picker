import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'multi_media_picker_method_channel.dart';

abstract class MultiMediaPickerPlatform extends PlatformInterface {
  /// Constructs a MultiMediaPickerPlatform.
  MultiMediaPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MultiMediaPickerPlatform _instance = MethodChannelMultiMediaPicker();

  /// The default instance of [MultiMediaPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMultiMediaPicker].
  static MultiMediaPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MultiMediaPickerPlatform] when
  /// they register themselves.
  static set instance(MultiMediaPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
