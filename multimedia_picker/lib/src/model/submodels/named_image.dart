import 'dart:io' show Directory;

import 'package:flutter/foundation.dart' show immutable;

import 'overlay_image.dart';

/// Represents an image with an optional name and overlay.
///
/// The image can be associated with a specific directory and
/// can have an optional overlay applied to it.
@immutable
class NamedImage<T extends Object> {
  const NamedImage({this.directory, T? imageNameToSave, this.overlay})
    : _imageNameToSave = imageNameToSave;

  final Directory? directory;
  final OverlayImage? overlay;
  final T? _imageNameToSave;

  String? get name => _imageNameToSave?.toString().trim();
}
