import 'dart:collection' show UnmodifiableListView;

import '../helpers/extensions/model/internal/camera_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/edit_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/media_data_extension_internal.dart';
import '../helpers/extensions/model/internal/picker_configuration_extension_internal.dart';
import '../helpers/extensions/model/internal/raw_media_data_extension.dart';
import '../helpers/extensions/model/internal/ui_configuration_extension_internal.dart';
import '../messages.g.dart';
import '../model/configs/camera_configuration.dart';
import '../model/configs/edit_configuration.dart';
import '../model/configs/picker_configuration.dart';
import '../model/configs/ui_configuration.dart';
import '../model/media_data.dart';
import '../model/submodels/named_image.dart';
import '../model/submodels/overlay_image.dart';
import '../model/typedefs.dart';

class MultiMediaPicker {
  const MultiMediaPicker({
    this.cameraConfiguration = const CameraConfiguration(),
    DateTimeProvider? dateTimeProvider,
    this.editConfiguration = const EditConfiguration(),
    this.pickerConfiguration = const PickerConfiguration(),
    this.uiConfiguration = const UiConfiguration(),
  }) : _dateTimeProvider = dateTimeProvider;

  final CameraConfiguration cameraConfiguration;
  final EditConfiguration editConfiguration;
  final PickerConfiguration pickerConfiguration;
  final UiConfiguration uiConfiguration;
  // ignore: prefer-correct-callback-field-name, it's provider like callback.
  final DateTimeProvider? _dateTimeProvider;

  MultiMediaApi get _api => MultiMediaApi();

  // ignore: prefer-getter-over-method, method is more future-proof solution.
  Future<MediaData?> openCamera() => _openCamera(hasToThrow: true);

  // ignore: prefer-getter-over-method, same reason as above.
  Future<MediaData?> tryOpenCamera() => _openCamera();

  Future<MediaData?> editMedia(
    MediaData input, {
    bool shouldEvictThumbnailCache = true,
  }) =>
      _editMedia(
        input,
        hasToThrow: true,
        shouldEvictThumbnailCache: shouldEvictThumbnailCache,
      );

  Future<MediaData?> tryEditMedia(
    MediaData? input, {
    bool shouldEvictThumbnailCache = true,
  }) =>
      _editMedia(input, shouldEvictThumbnailCache: shouldEvictThumbnailCache);

  Future<MediaDataList> multipleFromCamera({
    Iterable<NamedImage>? namedOverlays,
  }) async {
    final count = namedOverlays?.length;
    if (count == 0) return UnmodifiableListView(const []);

    final mediaList = <MediaData>[];
    final maybeNamed = namedOverlays == null
        ? null
        : List<NamedImage>.unmodifiable(namedOverlays);

    // ignore: avoid-complex-loop-conditions, it's not that complex.
    for (int index = 0; count == null || index < count; index += 1) {
      final image = maybeNamed?.elementAtOrNull(index);
      final pick = pickerConfiguration.copyWith(
        directoryPath: image?.directoryPath,
        imageName: image?.name,
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
    CameraConfiguration camera = cameraConfig ?? cameraConfiguration;
    final isCameraDisabled = !camera.allowRecordVideo && !camera.allowTakePhoto;
    assert(
      !isCameraDisabled,
      'Either `allowTakePhoto` or `allowRecordVideo` must be set to `true`',
    );
    if (isCameraDisabled) return null;
    if (camera.allowRecordVideo) {
      // Due to bug on iOS side in video preview.
      camera = camera.copyWith(overlayImage: OverlayImage.empty);
    }

    final edit = editConfig ?? editConfiguration;
    final pick = pickerConfig ?? pickerConfiguration;
    final ui = uiConfig ?? uiConfiguration;

    try {
      final raw = await _api.openCamera(camera.raw, edit.raw, pick.raw, ui.raw);

      return raw?.toMediaData(dateTimeProvider: _dateTimeProvider);
    } catch (_) {
      if (hasToThrow) rethrow;

      return null;
    }
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
    RawMediaData? rawOutput;

    try {
      rawOutput = await _api.editMedia(rawInput, edit.raw, picker.raw, ui.raw);
    } catch (_) {
      if (hasToThrow) rethrow;
    }

    final output = rawOutput?.toMediaData(dateTimeProvider: _dateTimeProvider);
    if (output == input) return null;
    if (shouldEvictThumbnailCache) rawOutput?.willEvictImageCache(input);

    return output;
  }
}
