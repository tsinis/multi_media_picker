import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

@immutable
class OverlayImage {
  const OverlayImage(
    String? path, {
    this.isAsset = false,
    this.opacity = 1,
    this.rotationAngle = 0,
    this.tintColor = const Color(0x00000000),
  }) : _path = path ?? '';

  static const empty = OverlayImage(null);

  final bool isAsset;
  final double opacity;
  final double rotationAngle;
  final Color tintColor;

  final String _path;

  String get path => _path.trim();

  OverlayImage copyWith({
    bool? isAsset,
    double? opacity,
    String? path,
    double? rotationAngle,
    Color? tintColor,
  }) =>
      OverlayImage(
        path ?? this.path,
        isAsset: isAsset ?? this.isAsset,
        opacity: opacity ?? this.opacity,
        rotationAngle: rotationAngle ?? this.rotationAngle,
        tintColor: tintColor ?? this.tintColor,
      );

  @override
  String toString() => 'OverlayImage(path: "$path", isAsset: $isAsset, '
      'opacity: $opacity, rotationAngle: $rotationAngle, tintColor: $tintColor'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OverlayImage &&
        other.path == path &&
        other.isAsset == isAsset &&
        other.opacity == opacity &&
        other.rotationAngle == rotationAngle &&
        other.tintColor == tintColor;
  }

  @override
  int get hashCode =>
      path.hashCode ^
      isAsset.hashCode ^
      opacity.hashCode ^
      rotationAngle.hashCode ^
      tintColor.hashCode;
}
