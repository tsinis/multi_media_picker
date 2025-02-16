import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../../../model/configs/camera_configuration.dart';
import '../public/camera_configuration_extension.dart';
import 'overlay_image_extension_internal.dart';

extension CameraConfigurationExtensionInternal on CameraConfiguration {
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
    overlayImage: hasOverlay ? overlayImage.raw : null,
    sessionPreset: sessionPreset,
    showFlashSwitch: showFlashSwitch,
    tapToRecordVideo: tapToRecordVideo,
    videoExportType: videoExportType,
    videoStabilization: videoStabilization,
  );
}
