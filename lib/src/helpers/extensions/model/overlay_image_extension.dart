import '../../../model/submodels/overlay_image.dart';

extension OverlayImageExtension on OverlayImage {
  bool get isEmpty => path.trim().isEmpty;
}
