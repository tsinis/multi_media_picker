import 'helpers/extensions/camera_configuration_extension.dart';
import 'messages.g.dart';
import 'model/camera_configuration.dart';

class MultiMediaPicker {
  const MultiMediaPicker({
    this.cameraConfiguration = const CameraConfiguration(),
    this.editConfiguration,
    this.pickerConfiguration,
  });

  final CameraConfiguration cameraConfiguration;
  final RawEditConfiguration? editConfiguration;
  final RawPickerConfiguration? pickerConfiguration;

  MultiMediaApi get _api => MultiMediaApi();

  // ignore: prefer-getter-over-method, for better developer experience.
  Future<RawMediaData?> openCamera() => _api.openCamera(
        cameraConfiguration.raw,
        pickerConfiguration ?? RawPickerConfiguration(),
        editConfiguration ?? RawEditConfiguration(),
      );
}
