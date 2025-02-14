// ignore_for_file: prefer-named-parameters

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'messages.g.dart';
import 'method_channel_multimedia_picker.dart';

/// The interface that implementations of `multimedia_picker` must implement.
///
/// Platform implementations should extend this class rather than implement it
/// as `multimedia_picker`. Extending this class (using `extends`) ensures that
/// the subclass will get the default implementation, while platform
/// implementations that `implements` this interface will be broken by newly
/// added [MultimediaPickerPlatform] methods.
abstract class MultimediaPickerPlatform extends PlatformInterface {
  /// Constructs a [MultimediaPickerPlatform].
  MultimediaPickerPlatform() : super(token: _token);

  static final _token = Object();

  // ignore: avoid-referencing-subclasses, it's standard for federated plugins.
  static MultimediaPickerPlatform _instance = MethodChannelMultimediaPicker();

  /// The default instance of [MultimediaPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMultimediaPicker].
  static MultimediaPickerPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MultimediaPickerPlatform] when they register
  /// themselves.
  static set instance(MultimediaPickerPlatform value) {
    PlatformInterface.verify(value, _token);
    _instance = value;
  }

  Future<RawMediaData?> openCamera(
    /// Configuration for camera settings like position, flash, etc.
    RawCameraConfiguration cameraConfig,

    /// Configuration for editing capabilities.
    RawEditConfiguration editConfig,

    /// Configuration for picker UI and behavior.
    RawPickerConfiguration pickerConfig,

    /// Configuration for UI elements and localization.
    RawUiConfiguration uiConfig,
  ) => throw UnimplementedError('openCamera() has not been implemented.');

  Future<RawMediaData?> editMedia(
    /// The media data to be edited.
    RawMediaData data,

    /// Configuration for editing capabilities.
    RawEditConfiguration editConfig,

    /// Configuration for picker UI and behavior.
    RawPickerConfiguration pickerConfig,

    /// Configuration for UI elements and localization.
    RawUiConfiguration uiConfig,
  ) => throw UnimplementedError('editMedia() has not been implemented.');

  Future<List<RawMediaData>?> openGallery(
    /// Configuration for editing capabilities.
    RawEditConfiguration editConfig,

    /// Configuration for picker UI and behavior.
    RawPickerConfiguration pickerConfig,

    /// Configuration for UI elements and localization.
    RawUiConfiguration uiConfig,
  ) => throw UnimplementedError('openGallery() has not been implemented.');
}
