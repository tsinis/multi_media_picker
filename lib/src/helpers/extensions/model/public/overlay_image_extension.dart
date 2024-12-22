import '../../../../model/submodels/overlay_image.dart';

extension OverlayImageExtension on OverlayImage? {
  bool get isEmpty => this?.path.isEmpty ?? true;
}
