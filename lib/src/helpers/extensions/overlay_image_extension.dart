import '../../messages.g.dart';
import '../../model/submodels/overlay_image.dart';

extension OverlayImageExtension on OverlayImage {
  RawOverlayImage get raw => RawOverlayImage(
        alignment: RawAlignment(
          x: _nativeAlignment(alignment.x),
          y: _nativeAlignment(alignment.y),
        ),
        contentMode: contentMode,
        margin: RawEdgeInsets(
          bottom: margin.bottom,
          left: margin.left,
          right: margin.right,
          top: margin.top,
        ),
        opacity: opacity.clamp(0, 1),
        path: path,
        rotationAngle: rotationAngle,
        tintColor: tintColor.value,
      );

  /// UIKit's `CGPoint` uses 0.5 for a center alignment.
  double _nativeAlignment(double alignment) => (alignment.clamp(-1, 1) + 1) / 2;
}
