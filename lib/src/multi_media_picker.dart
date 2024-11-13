import 'messages.g.dart';

class MultiMediaPicker {
  MultiMediaPicker();
  final MultiMediaApi _api = MultiMediaApi();

  Future<RawMediaData?> openCamera({
    RawCameraConfiguration? cameraConfiguration,
  }) =>
      _api.openCamera(cameraConfiguration ?? RawCameraConfiguration());
}
