import '../../messages.g.dart';
import '../../model/camera_configuration.dart';

extension CameraConfigurationExtension on CameraConfiguration {
  RawCameraConfiguration get raw => RawCameraConfiguration(
        allowRecordVideo: allowRecordVideo,
        allowSwitchCamera: allowSwitchCamera,
        allowTakePhoto: allowTakePhoto,
        devicePosition: devicePosition,
        directoryPath: directoryPath,
        enableWideCameras: enableWideCameras,
        exposureMode: exposureMode,
        focusMode: focusMode,
        imageName: imageName,
        isFrontVideoMirrored: isFrontVideoMirrored,
        maxDurationSeconds: maxDuration.inSeconds,
        minDurationSeconds: minDuration.inSeconds,
        sessionPreset: sessionPreset,
        showFlashSwitch: showFlashSwitch,
        tapToRecordVideo: tapToRecordVideo,
        videoExportType: videoExportType,
      );
}
