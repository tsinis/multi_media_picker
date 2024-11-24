import 'dart:math' show max;

import '../../model/submodels/named_image.dart';
import '../../model/typedefs.dart';
import '../../multi_media_picker.dart';

extension MultiMediaPickerExtension on MultiMediaPicker {
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
  /// const picker = MultiMediaPicker();
  /// final photos = await picker.multipleFromCameraCount(
  ///   5, namedImage: NamedImage(name: 'picture'),
  /// );
  /// ```
  Future<MediaDataList> multipleFromCameraCount(
    int? count, {
    NamedImage namedImage = const NamedImage(),
  }) =>
      multipleFromCamera(
        namedOverlays: count == null
            ? null
            : Iterable.generate(max(0, count), (index) {
                final isNameEmpty = namedImage.name?.isEmpty ?? true;
                if (isNameEmpty) return namedImage;

                return NamedImage(
                  directoryPath: namedImage.directoryPath,
                  // ignore: avoid-nullable-interpolation, empty check is above.
                  imageNameToSave: '${namedImage.name}-$index',
                  overlay: namedImage.overlay,
                );
              }),
      );
}
