import 'messages.g.dart';
import 'model/camera_configuration.dart';
import 'helpers/extensions/camera_configuration_extension.dart';

class MultiMediaPicker {
  const MultiMediaPicker({
    this.cameraConfiguration = const CameraConfiguration(),
    this.pickerConfiguration,
    this.editConfiguration,
  });

  final CameraConfiguration cameraConfiguration;
  final RawEditConfiguration? editConfiguration;
  final RawPickerConfiguration? pickerConfiguration;

  MultiMediaApi get _api => MultiMediaApi();

  Future<RawMediaData?> openCamera() => _api.openCamera(
        cameraConfiguration.raw,
        pickerConfiguration ?? RawPickerConfiguration(),
        editConfiguration ?? RawEditConfiguration(),
      );
}
