import '../../../messages.g.dart';
import '../../../model/configs/camera_configuration.dart';
import 'overlay_image_extension.dart';

extension CameraConfigurationExtension on CameraConfiguration {
  RawCameraConfiguration get raw => RawCameraConfiguration(
        allowRecordVideo: allowRecordVideo,
        allowSwitchCamera: allowSwitchCamera,
        allowTakePhoto: allowTakePhoto,
        devicePosition: devicePosition,
        enableWideCameras: enableWideCameras,
        exposureMode: exposureMode,
        focusMode: focusMode,
        isFrontVideoMirrored: isFrontVideoMirrored,
        maxDurationSeconds: maxDuration.inSeconds,
        minDurationSeconds: minDuration.inSeconds,
        overlayImage: overlayImage?.raw,
        sessionPreset: sessionPreset,
        showFlashSwitch: showFlashSwitch,
        tapToRecordVideo: tapToRecordVideo,
        videoExportType: videoExportType,
      );
}
