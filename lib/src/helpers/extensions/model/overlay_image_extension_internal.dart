import '../../../messages.g.dart';
import '../../../model/submodels/overlay_image.dart';
import '../sdk_model/color_extension.dart';

extension OverlayImageExtensionInternal on OverlayImage {
  RawOverlayImage get raw => RawOverlayImage(
        isAsset: isAsset,
        opacity: opacity.clamp(0, 1),
        path: path,
        rotationAngle: rotationAngle,
        tintColor: tintColor.rawValue,
      );
}
