import 'package:freezed_annotation/freezed_annotation.dart';

import '../messages.g.dart';

part 'camera_configuration.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class CameraConfiguration with _$CameraConfiguration {
  const factory CameraConfiguration({
    /// Allow video recording in the camera. Defaults to `true`.
    @Default(true) bool allowRecordVideo,

    /// Whether to support switch camera. Defaults to `true`.
    @Default(true) bool allowSwitchCamera,

    /// Allow taking photos in the camera. Defaults to `true`.
    @Default(true) bool allowTakePhoto,

    /// The default camera position after entering the camera. Defaults to `back`.
    @Default(DevicePosition.back) DevicePosition devicePosition,

    /// Directory path for saving the file.
    /// Defaults to `null` - temporary directory.
    String? directoryPath,

    /// Enable the use of wide cameras (on supported devices). Defaults to `true`.
    @Default(true) bool enableWideCameras,

    /// Camera exposure mode. Defaults to [ExposureMode.continuousAutoExposure].
    @Default(ExposureMode.continuousAutoExposure) ExposureMode exposureMode,

    /// Image file name for saving the image or thumbnail file.
    /// Defaults to `null` - random UUID with `multi_media_` prefix.
    String? imageName,

    /// Camera focus mode. Defaults to [FocusMode.continuousAutoFocus].
    @Default(FocusMode.continuousAutoFocus) FocusMode focusMode,

    /// Indicates whether the video flowing through the connection should be
    /// mirrored about its vertical axis. Defaults to `true`.
    @Default(true) bool isFrontVideoMirrored,

    /// Maximum recording duration. Defaults to `30` seconds, minimum is `1` sec.
    @Default(Duration(seconds: 30)) Duration maxDuration,

    /// Minimum recording duration. Defaults to `0`.
    @Default(Duration.zero) Duration minDuration,

    /// Video resolution. Defaults to [CaptureSessionPreset.hd1920x1080].
    @Default(CaptureSessionPreset.hd1920x1080)
    CaptureSessionPreset sessionPreset,

    /// Camera flash switch. Defaults to `true`.
    @Default(true) bool showFlashSwitch,

    /// Flag to enable tap-to-record functionality. Default is `true`. If
    /// [allowTakePhoto] is set to `true`, [tapToRecordVideo] will be ignored.
    @Default(true) bool tapToRecordVideo,

    /// Video export format for recording/editing video. Defaults to `mp4`.
    @Default(VideoExportType.mp4) VideoExportType videoExportType,
  }) = _CameraConfiguration;
}
