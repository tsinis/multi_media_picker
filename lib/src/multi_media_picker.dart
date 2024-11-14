import 'messages.g.dart';

class MultiMediaPicker {
  MultiMediaPicker();
  final _api = MultiMediaApi();

  Future<RawMediaData?> openCamera({
    RawCameraConfiguration? cameraConfig,
    RawPickerConfiguration? pickerConfig,
    RawEditConfiguration? editConfig,
  }) =>
      _api.openCamera(
        cameraConfig ?? RawCameraConfiguration(),
        pickerConfig ?? RawPickerConfiguration(),
        editConfig ?? RawEditConfiguration(),
      );
}
