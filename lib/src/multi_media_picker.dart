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
    this.cameraConfiguration = const CameraConfiguration(),
    this.editConfiguration = const EditConfiguration(),
    this.pickerConfiguration = const PickerConfiguration(),
  });

  final CameraConfiguration cameraConfiguration;
  final EditConfiguration editConfiguration;
  final PickerConfiguration pickerConfiguration;

  MultiMediaApi get _api => MultiMediaApi();

  // ignore: prefer-getter-over-method, for better developer experience.
  Future<MediaData?> openCamera() async {
    assert(
      cameraConfiguration.allowRecordVideo ||
          cameraConfiguration.allowTakePhoto,
      'Either `allowTakePhoto` or `allowRecordVideo` must be `true`',
    );

    final rawMedia = await _api.openCamera(
      cameraConfiguration.raw,
      pickerConfiguration.raw,
      editConfiguration.raw,
    );

    return rawMedia?.toMediaData();
  }
}
