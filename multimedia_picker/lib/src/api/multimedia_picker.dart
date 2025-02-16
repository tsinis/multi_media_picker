// ignore_for_file: prefer-getter-over-method, more future-proof solution.

import 'dart:collection' show UnmodifiableListView;

import 'package:flutter/foundation.dart' show visibleForTesting;
// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../helpers/extensions/model/internal/camera_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/edit_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/media_data_extension_internal.dart';
import '../helpers/extensions/model/internal/picker_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/raw_media_data_extension.dart';
import '../helpers/extensions/model/internal/ui_configuration_extension_internal.dart';
import '../model/configs/camera_configuration.dart';
import '../model/configs/edit_configuration.dart';
import '../model/configs/picker_configuration.dart';
import '../model/configs/ui_configuration.dart';
import '../model/media_data.dart';
import '../model/submodels/named_image.dart';
import '../model/typedefs.dart';

class MultimediaPicker {
  const MultimediaPicker({
    this.cameraConfiguration = const CameraConfiguration(),
    DateTimeProvider? dateTimeProvider,
    this.editConfiguration = const EditConfiguration(),
    this.pickerConfiguration = const PickerConfiguration(),
    this.uiConfiguration = const UiConfiguration(),
  }) : _dateTimeProvider = dateTimeProvider;

  @visibleForTesting
  static MultimediaPickerPlatform get platform =>
      MultimediaPickerPlatform.instance;

  final CameraConfiguration cameraConfiguration;
  final EditConfiguration editConfiguration;
  final PickerConfiguration pickerConfiguration;
  final UiConfiguration uiConfiguration;
  // ignore: prefer-correct-callback-field-name, it's provider like callback.
  final DateTimeProvider? _dateTimeProvider;

  Future<MediaData?> openCamera() => _openCamera(hasToThrow: true);

  Future<MediaData?> tryOpenCamera() => _openCamera();

  Future<MediaDataList> openGallery() async =>
      (await _openGallery(hasToThrow: true)) ?? MediaDataList(const []);

  Future<MediaDataList?> tryOpenGallery() => _openGallery();

  Future<MediaData?> editMedia(
    MediaData input, {
    bool shouldEvictThumbnailCache = true,
  }) => _editMedia(
    input,
    hasToThrow: true,
    shouldEvictThumbnailCache: shouldEvictThumbnailCache,
  );

  Future<MediaData?> tryEditMedia(
    MediaData? input, {
    bool shouldEvictThumbnailCache = true,
  }) => _editMedia(input, shouldEvictThumbnailCache: shouldEvictThumbnailCache);

  Future<MediaDataList> multipleFromCamera({
    Iterable<NamedImage>? namedOverlays,
  }) async {
    final count = namedOverlays?.length;
    if (count == 0) return UnmodifiableListView(const []);

    final mediaList = <MediaData>[];
    final maybeNamed =
        namedOverlays == null
            ? null
            : List<NamedImage>.unmodifiable(namedOverlays);

    // ignore: omit_obvious_local_variable_types, avoid-complex-loop-conditions, it's not that complex.,
    for (int index = 0; count == null || index < count; index += 1) {
      final image = maybeNamed?.elementAtOrNull(index);
      final directory = image?.directory;

      assert(
        directory == null || directory.existsSync(),
        'Directory does not exist: ${directory.path}',
      );

      final pick = pickerConfiguration.copyWith(
        directory: directory,
        filename: image?.name,
      );
      final camera = cameraConfiguration.copyWith(overlayImage: image?.overlay);
      final data = await _openCamera(cameraConfig: camera, pickerConfig: pick);
      if (data == null) break;
      mediaList.add(data);
    }

    return MediaDataList(mediaList);
  }

  Future<MediaData?> _openCamera({
    CameraConfiguration? cameraConfig,
    EditConfiguration? editConfig,
    bool hasToThrow = false,
    PickerConfiguration? pickerConfig,
    UiConfiguration? uiConfig,
  }) async {
    final camera = cameraConfig ?? cameraConfiguration;
    final isCameraDisabled = !camera.allowRecordVideo && !camera.allowTakePhoto;
    assert(
      !isCameraDisabled,
      'Either `allowTakePhoto` or `allowRecordVideo` must be set to `true`',
    );
    if (isCameraDisabled) return null;

    final edit = editConfig ?? editConfiguration;
    final pick = pickerConfig ?? pickerConfiguration;
    final ui = uiConfig ?? uiConfiguration;

    try {
      final raw = await platform.openCamera(
        camera.raw,
        edit.raw,
        pick.raw,
        ui.raw,
      );

      return raw?.toMediaData(dateTimeProvider: _dateTimeProvider);
    } catch (_) {
      if (hasToThrow) rethrow;

      return null;
    }
  }

  Future<MediaDataList?> _openGallery({
    EditConfiguration? editConfig,
    bool hasToThrow = false,
    PickerConfiguration? pickerConfig,
    UiConfiguration? uiConfig,
  }) async {
    final edit = editConfig ?? editConfiguration;
    final pick = pickerConfig ?? pickerConfiguration;
    final ui = uiConfig ?? uiConfiguration;
    final list = <RawMediaData>[];

    try {
      final rawList = await platform.openGallery(edit.raw, pick.raw, ui.raw);
      list.addAll(rawList?.nonNulls ?? []);
    } catch (_) {
      if (hasToThrow) rethrow;

      return null;
    }

    return MediaDataList(
      list.map((raw) => raw.toMediaData(dateTimeProvider: _dateTimeProvider)),
    );
  }

  // ignore: avoid-long-parameter-list, it's a private method.
  Future<MediaData?> _editMedia(
    MediaData? input, {
    required bool shouldEvictThumbnailCache,
    EditConfiguration? editConfig,
    bool hasToThrow = false,
    PickerConfiguration? pickerConfig,
    UiConfiguration? uiConfig,
  }) async {
    final rawInput = input?.raw;
    if (rawInput == null) return null; // Assert is done in `raw` getter.

    final edit = editConfig ?? editConfiguration;
    final picker = pickerConfig ?? pickerConfiguration;
    final ui = uiConfig ?? uiConfiguration;
    RawMediaData? raw;

    try {
      raw = await platform.editMedia(rawInput, edit.raw, picker.raw, ui.raw);
    } catch (_) {
      if (hasToThrow) rethrow;
    }

    final output = raw?.toMediaData(dateTimeProvider: _dateTimeProvider);
    if (output == input) return null;
    if (shouldEvictThumbnailCache) raw?.willEvictImageCache(input);

    return output;
  }
}
