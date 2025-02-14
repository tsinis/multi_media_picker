// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';
import '../../../../model/submodels/overlay_image.dart';
import '../../sdk_model/color_extension.dart';

extension OverlayImageExtensionInternal on OverlayImage {
  RawOverlayImage get raw => RawOverlayImage(
    isAsset: isAsset,
    opacity: opacity.clamp(0, 1),
    path: path,
    rotationAngle: rotationAngle,
    tintColor: tintColor.rawValue,
  );
}
