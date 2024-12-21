import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../../messages.g.dart';

@immutable
class OverlayImage {
  const OverlayImage(
    this.path, {
    this.alignment = Alignment.center,
    this.contentMode = ContentMode.scaleAspectFit,
    this.isAsset = false,
    this.margin = EdgeInsets.zero,
    this.opacity = 1,
    this.rotationAngle = 0,
    this.tintColor = const Color(0x00000000),
  });

  final String path;
  final Alignment alignment;
  final ContentMode contentMode;
  final bool isAsset;
  final EdgeInsets margin;
  final double opacity;
  final double rotationAngle;
  final Color tintColor;

  OverlayImage copyWith({
    Alignment? alignment,
    ContentMode? contentMode,
    bool? isAsset,
    EdgeInsets? margin,
    double? opacity,
    String? path,
    double? rotationAngle,
    Color? tintColor,
  }) =>
      OverlayImage(
        path ?? this.path,
        alignment: alignment ?? this.alignment,
        contentMode: contentMode ?? this.contentMode,
        isAsset: isAsset ?? this.isAsset,
        margin: margin ?? this.margin,
        opacity: opacity ?? this.opacity,
        rotationAngle: rotationAngle ?? this.rotationAngle,
        tintColor: tintColor ?? this.tintColor,
      );

  @override
  String toString() => 'OverlayImage(path: $path, alignment: $alignment, '
      'contentMode: $contentMode, isAsset: $isAsset, margin: $margin, '
      'opacity: $opacity, rotationAngle: $rotationAngle, tintColor: $tintColor '
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OverlayImage &&
        other.path == path &&
        other.alignment == alignment &&
        other.contentMode == contentMode &&
        other.isAsset == isAsset &&
        other.margin == margin &&
        other.opacity == opacity &&
        other.rotationAngle == rotationAngle &&
        other.tintColor == tintColor;
  }

  @override
  int get hashCode =>
      path.hashCode ^
      alignment.hashCode ^
      contentMode.hashCode ^
      isAsset.hashCode ^
      margin.hashCode ^
      opacity.hashCode ^
      rotationAngle.hashCode ^
      tintColor.hashCode;
}
