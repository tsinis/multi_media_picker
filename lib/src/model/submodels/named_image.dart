import 'dart:io' show Directory;

import 'overlay_image.dart';

class NamedImage<T extends Object> {
  const NamedImage({this.directory, T? imageNameToSave, this.overlay})
      : _imageNameToSave = imageNameToSave;

  final Directory? directory;
  final OverlayImage? overlay;
  final T? _imageNameToSave;

  String? get name => _imageNameToSave?.toString().trim();
}
