import 'messages.g.dart';

class MultiMediaPicker {
  MultiMediaPicker();
  final _api = MultiMediaApi();

  Future<RawMediaData?> openCamera({
    RawCameraConfiguration? cameraConfig,
    RawPickerConfiguration? pickerConfig,
  }) =>
      _api.openCamera(
        cameraConfig ?? RawCameraConfiguration(),
        pickerConfig ?? RawPickerConfiguration(),
      );
}
