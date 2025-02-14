import '../../../../model/configs/camera_configuration.dart';

extension CameraConfigurationExtension on CameraConfiguration? {
  bool get hasOverlay => this?.overlayImage.path.isNotEmpty ?? false;
}
