// ignore_for_file: lines_longer_than_80_chars, it's just a testing package.
// ignore_for_file: prefer-typedefs-for-callbacks, prefer-named-parameters
// ignore_for_file: avoid-collection-mutating-methods, avoid-accessing-other-classes-private-members

import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:multimedia_picker/multimedia_picker.dart';
// ignore: implementation_imports, it's a testing package.
import 'package:multimedia_picker/src/helpers/extensions/model/internal/raw_media_data_extension.dart';
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import 'extensions/raw_type_extensions.dart';
import 'models/picker_call.dart';

/// A mock implementation of the [MultimediaPickerPlatform] for testing.
///
/// This implementation tracks method invocations and allows setting predefined
/// responses for method calls.
class MockMultimediaPickerPlatform<T extends RawMediaData>
    extends MultimediaPickerPlatform {
  /// Creates a new mock instance.
  @visibleForTesting
  MockMultimediaPickerPlatform({
    this.dateTimeProvider,
    this.onEditMedia,
    this.onOpenCamera,
    this.onOpenGallery,
  });

  /// Registers this mock implementation as the default platform implementation.
  void registerAsPlatform() => MultimediaPickerPlatform.instance = this;

  /// Storage for method call counts.
  final log = _MethodCallLog();

  /// An optional provider for [DateTime], used when converting raw media data.
  // ignore: prefer-correct-callback-field-name, to match parent defenition.
  final DateTime Function()? dateTimeProvider;

  /// Handlers that can be assigned (or changed) in tests.
  /// By default, these are null, and the method returns `null` or an empty list.
  FutureOr<T?> Function(
    CameraConfiguration cameraConfig,
    EditConfiguration editConfig,
    PickerConfiguration pickerConfig,
    UiConfiguration uiConfig,
  )?
  onOpenCamera;

  FutureOr<T?> Function(
    T data,
    EditConfiguration editConfig,
    PickerConfiguration pickerConfig,
    UiConfiguration uiConfig,
  )?
  onEditMedia;

  FutureOr<List<T>?> Function(
    EditConfiguration editConfig,
    PickerConfiguration pickerConfig,
    UiConfiguration uiConfig,
  )?
  onOpenGallery;

  @override
  Future<T?> openCamera(
    RawCameraConfiguration cameraConfig,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    log._addCall(PickerCall.openCamera);

    return onOpenCamera?.call(
      cameraConfig.fromRaw(),
      editConfig.fromRaw(),
      pickerConfig.fromRaw(),
      uiConfig.fromRaw(),
    );
  }

  @override
  Future<T?> editMedia(
    RawMediaData data,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    log._addCall(PickerCall.editMedia);

    return onEditMedia?.call(
      // ignore: avoid-type-casts, there is a type check actually...
      (T == MediaData
              ? data
              : data.toMediaData(dateTimeProvider: dateTimeProvider))
          as T,
      editConfig.fromRaw(),
      pickerConfig.fromRaw(),
      uiConfig.fromRaw(),
    );
  }

  @override
  Future<List<T>?> openGallery(
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  ) async {
    log._addCall(PickerCall.openGallery);

    return onOpenGallery?.call(
      editConfig.fromRaw(),
      pickerConfig.fromRaw(),
      uiConfig.fromRaw(),
    );
  }

  /// Resets all method call counts to zero.
  void reset() => log._calls.clear();
}

/// Tracks method invocations for testing purposes.
class _MethodCallLog {
  /// Storage for method call counts.
  final _calls = <PickerCall, int>{};

  /// Adds a call to the log for the given method.
  void _addCall(PickerCall callType) =>
      _calls[callType] = callCount(callType) + 1;

  /// Returns whether there were no method calls.
  bool get hasZeroInteractions => _calls.isEmpty;

  /// Gets the number of times a method was called.
  int callCount(PickerCall callType) => _calls[callType] ?? 0;

  /// Returns whether a method was ever called.
  bool wasCalled(PickerCall callType) => callCount(callType) > 0;

  /// Returns all logged method calls.
  Map<PickerCall, int> get calls => Map.unmodifiable(_calls);
}
