import '../../../model/configs/camera_configuration.dart';
import 'overlay_image_extension.dart';

extension CameraConfigurationExtension on CameraConfiguration {
  bool get hasOverlay => !overlayImage.isEmpty;
}
