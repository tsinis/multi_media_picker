import 'package:multi_media_picker/src/messages.g.dart';

import '../../model/camera_configuration.dart';

extension CameraConfigurationExtension on CameraConfiguration {
  RawCameraConfiguration get raw => RawCameraConfiguration(
        allowRecordVideo: allowRecordVideo,
        allowSwitchCamera: allowSwitchCamera,
        allowTakePhoto: allowTakePhoto,
        devicePosition: devicePosition,
        enableWideCameras: enableWideCameras,
        exposureMode: exposureMode,
        fileDirectoryPath: fileDirectoryPath,
        fileName: fileName,
        focusMode: focusMode,
        isVideoMirrored: isVideoMirrored,
        maxDurationSeconds: maxDuration.inSeconds,
        minDurationSeconds: minDuration.inSeconds,
        sessionPreset: sessionPreset,
        showFlashSwitch: showFlashSwitch,
        tapToRecordVideo: tapToRecordVideo,
        videoExportType: videoExportType,
      );
}
