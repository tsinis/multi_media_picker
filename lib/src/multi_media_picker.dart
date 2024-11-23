import 'dart:collection' show UnmodifiableListView;
import 'dart:math' show max;

import 'helpers/extensions/camera_configuration_extension.dart';
import 'helpers/extensions/edit_configuration_extension.dart';
import 'helpers/extensions/media_data_extension.dart';
import 'helpers/extensions/picker_configuration_extension.dart';
import 'helpers/extensions/ui_configuration_extension.dart';
import 'messages.g.dart';
import 'model/configs/camera_configuration.dart';
import 'model/configs/edit_configuration.dart';
import 'model/configs/picker_configuration.dart';
import 'model/configs/ui_configuration.dart';
import 'model/media_data.dart';
import 'model/submodels/named_image.dart';
import 'model/typedefs.dart';

class MultiMediaPicker {
  const MultiMediaPicker({
    CameraConfiguration cameraConfiguration = const CameraConfiguration(),
    EditConfiguration editConfiguration = const EditConfiguration(),
    PickerConfiguration pickerConfiguration = const PickerConfiguration(),
    UiConfiguration uiConfiguration = const UiConfiguration(),
  })  : _cameraConfig = cameraConfiguration,
        _editConfig = editConfiguration,
        _pickerConfig = pickerConfiguration,
        _uiConfig = uiConfiguration;

  final CameraConfiguration _cameraConfig;
  final EditConfiguration _editConfig;
  final PickerConfiguration _pickerConfig;
  final UiConfiguration _uiConfig;

  MultiMediaApi get _api => MultiMediaApi();

  // ignore: prefer-getter-over-method, more future-proof solution.
  Future<MediaData?> openCamera() => _tryOpenCamera(hasToThrow: true);

  // ignore: prefer-getter-over-method, same reason as above.
  Future<MediaData?> tryOpenCamera() => _tryOpenCamera();

  Future<MediaDataList> multipleFromCameraCount([
    int? count, // TODO! Move it to extension.
  ]) =>
      multipleFromCamera(
        namedOverlays: count == null
            ? null
            : Iterable.generate(max(0, count), (_) => const NamedImage()),
      );

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
      final cameraConfig = _cameraConfig.copyWith(
        imageName: image?.fileName,
        overlayImage: image?.overlay,
      );
      final mediaData = await _tryOpenCamera(cameraConfiguration: cameraConfig);
      if (mediaData == null) break;
      mediaList.add(mediaData);
    }

    return MediaDataList(mediaList);
  }

  Future<MediaData?> _tryOpenCamera({
    CameraConfiguration? cameraConfiguration,
    EditConfiguration? editConfiguration,
    bool hasToThrow = false,
    PickerConfiguration? pickerConfiguration,
    // ignore: avoid-similar-names, more convenient, it's a private method.
    UiConfiguration? uiConfiguration,
  }) async {
    final camera = cameraConfiguration ?? _cameraConfig;
    final edit = editConfiguration ?? _editConfig;
    final picker = pickerConfiguration ?? _pickerConfig;
    final ui = uiConfiguration ?? _uiConfig;

    final isCameraDisabled = !camera.allowRecordVideo && !camera.allowTakePhoto;
    assert(
      !isCameraDisabled,
      'Either `allowTakePhoto` or `allowRecordVideo` must be `true`',
    );
    if (isCameraDisabled) return null;

    try {
      final rawMedia =
          await _api.openCamera(camera.raw, edit.raw, picker.raw, ui.raw);

      return rawMedia?.toMediaData();
    } catch (_) {
      if (hasToThrow) rethrow;

      return null;
    }
  }
}
