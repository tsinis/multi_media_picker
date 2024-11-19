import 'helpers/extensions/camera_configuration_extension.dart';
import 'helpers/extensions/edit_configuration_extension.dart';
import 'helpers/extensions/media_data_extension.dart';
import 'helpers/extensions/picker_configuration_extension.dart';
import 'messages.g.dart';
import 'model/configs/camera_configuration.dart';
import 'model/configs/edit_configuration.dart';
import 'model/configs/picker_configuration.dart';
import 'model/media_data.dart';

class MultiMediaPicker {
  const MultiMediaPicker({
    CameraConfiguration cameraConfiguration = const CameraConfiguration(),
    EditConfiguration editConfiguration = const EditConfiguration(),
    PickerConfiguration pickerConfiguration = const PickerConfiguration(),
  })  : _cameraConfig = cameraConfiguration,
        _editConfig = editConfiguration,
        _pickerConfig = pickerConfiguration;

  final CameraConfiguration _cameraConfig;
  final EditConfiguration _editConfig;
  final PickerConfiguration _pickerConfig;

  MultiMediaApi get _api => MultiMediaApi();

  // ignore: prefer-getter-over-method, for better developer experience.
  Future<MediaData?> openCamera() async {
    assert(
      _cameraConfig.allowRecordVideo || _cameraConfig.allowTakePhoto,
      'Either `allowTakePhoto` or `allowRecordVideo` must be `true`',
    );

    final rawMedia = await _api.openCamera(
      _cameraConfig.raw,
      _pickerConfig.raw,
      _editConfig.raw,
    );

    return rawMedia?.toMediaData();
  }
}
