import 'dart:math' show max;

import '../../api/multimedia_picker.dart';
import '../../model/configs/camera_configuration.dart';
import '../../model/configs/edit_configuration.dart';
import '../../model/configs/picker_configuration.dart';
import '../../model/configs/ui_configuration.dart';
import '../../model/submodels/named_image.dart';
import '../../model/typedefs.dart';

extension MultimediaPickerExtension on MultimediaPicker {
  MultimediaPicker copyWith({
    CameraConfiguration? cameraConfiguration,
    DateTimeProvider? dateTimeProvider,
    EditConfiguration? editConfiguration,
    PickerConfiguration? pickerConfiguration,
    UiConfiguration? uiConfiguration,
  }) => MultimediaPicker(
    cameraConfiguration: cameraConfiguration ?? this.cameraConfiguration,
    dateTimeProvider: dateTimeProvider ?? this.dateTimeProvider,
    editConfiguration: editConfiguration ?? this.editConfiguration,
    pickerConfiguration: pickerConfiguration ?? this.pickerConfiguration,
    uiConfiguration: uiConfiguration ?? this.uiConfiguration,
  );

  /// Captures multiple photos using the camera.
  ///
  /// If [count] is `null`, the method will continue to capture photos until the
  /// user closes the camera view or an exception occurs. If [count] is not
  /// `null`, the method will capture up to [count] photos.
  ///
  /// The [namedImage] parameter allows specifying a base name for the captured
  /// images, overlays, and directory to save them in.
  /// If `namedImage.name` is not empty, the captured images will have the index
  /// appended to the end of the name (e.g., `picture-1.jpg`, `picture-2.jpg`,
  /// etc.).
  ///
  /// Returns a [Future] that completes with a [MediaDataList] containing the
  /// captured photos.
  ///
  /// Example usage:
  /// ```dart
  /// const picker = MultimediaPicker();
  /// final photos = await picker.multipleFromCameraCount(
  ///   2, namedImage: const NamedImage(imageNameToSave: 'picture'),
  /// );
  /// ```
  Future<MediaDataList> multipleFromCameraCount(
    int? count, {
    NamedImage namedImage = const NamedImage(),
  }) => multipleFromCamera(
    namedOverlays:
        count == null
            ? null
            : Iterable.generate(max(0, count), (index) {
              final name = namedImage.name;

              return name == null || name.isEmpty
                  ? namedImage
                  : NamedImage(
                    directory: namedImage.directory,
                    imageNameToSave: '$name-$index',
                    overlay: namedImage.overlay,
                  );
            }),
  );
}
