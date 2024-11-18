// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/foundation.dart' show immutable;

import '../../messages.g.dart';

@immutable
class CameraConfiguration {
  const CameraConfiguration({
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.devicePosition = DevicePosition.back,
    this.directoryPath,
    this.enableWideCameras = true,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.imageName,
    this.isFrontVideoMirrored = true,
    this.maxDuration = const Duration(seconds: 30),
    this.minDuration = Duration.zero,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = VideoExportType.mp4,
  });

  /// Allow taking photos in the camera. Defaults to `true`.
  final bool allowTakePhoto;

  /// Allow video recording in the camera. Defaults to `true`.
  final bool allowRecordVideo;

  /// Minimum recording duration. Defaults to `0`.
  final Duration minDuration;

  /// Maximum recording duration. Defaults to `30`, minimum is `1`.
  final Duration maxDuration;

  /// Indicates whether the video flowing through the connection should be
  /// mirrored about its vertical axis. Defaults to `true`.
  final bool isFrontVideoMirrored;

  /// Video resolution. Defaults to [CaptureSessionPreset.hd1920x1080].
  final CaptureSessionPreset sessionPreset;

  /// Camera focus mode. Defaults to [FocusMode.continuousAutoFocus].
  final FocusMode focusMode;

  /// Camera exposure mode. Defaults to [ExposureMode.continuousAutoExposure].
  final ExposureMode exposureMode;

  /// Directory path for saving the file. Defaults to `null`,
  /// the temporary directory.
  final String? directoryPath;

  /// Image file name for saving the image or thumbnail file.
  /// Defaults to `null`, random UUID with `multi_media_` prefix.
  final String? imageName;

  /// Camera flash switch. Defaults to `true`.
  final bool showFlashSwitch;

  /// Whether to support switch camera. Defaults to `true`.
  final bool allowSwitchCamera;

  /// Flag to enable tap-to-record functionality. Default is `true`. If
  /// [allowTakePhoto] is set to `true`, [tapToRecordVideo] will be ignored.
  final bool tapToRecordVideo;

  /// Enable the use of wide cameras (on supported devices). Defaults to `true`.
  final bool enableWideCameras;

  /// Video export format for recording/editing video. Defaults to `mp4`.
  final VideoExportType videoExportType;

  /// The default camera position after entering the camera. Defaults to `back`.
  final DevicePosition devicePosition;

  CameraConfiguration copyWith({
    bool? allowRecordVideo,
    bool? allowSwitchCamera,
    bool? allowTakePhoto,
    DevicePosition? devicePosition,
    String? directoryPath,
    bool? enableWideCameras,
    ExposureMode? exposureMode,
    FocusMode? focusMode,
    String? imageName,
    bool? isFrontVideoMirrored,
    Duration? maxDuration,
    Duration? minDuration,
    CaptureSessionPreset? sessionPreset,
    bool? showFlashSwitch,
    bool? tapToRecordVideo,
    VideoExportType? videoExportType,
  }) =>
      CameraConfiguration(
        allowRecordVideo: allowRecordVideo ?? this.allowRecordVideo,
        allowSwitchCamera: allowSwitchCamera ?? this.allowSwitchCamera,
        allowTakePhoto: allowTakePhoto ?? this.allowTakePhoto,
        devicePosition: devicePosition ?? this.devicePosition,
        directoryPath: directoryPath ?? this.directoryPath,
        enableWideCameras: enableWideCameras ?? this.enableWideCameras,
        exposureMode: exposureMode ?? this.exposureMode,
        focusMode: focusMode ?? this.focusMode,
        imageName: imageName ?? this.imageName,
        isFrontVideoMirrored: isFrontVideoMirrored ?? this.isFrontVideoMirrored,
        maxDuration: maxDuration ?? this.maxDuration,
        minDuration: minDuration ?? this.minDuration,
        sessionPreset: sessionPreset ?? this.sessionPreset,
        showFlashSwitch: showFlashSwitch ?? this.showFlashSwitch,
        tapToRecordVideo: tapToRecordVideo ?? this.tapToRecordVideo,
        videoExportType: videoExportType ?? this.videoExportType,
      );

  @override
  String toString() => 'CameraConfiguration(allowTakePhoto: $allowTakePhoto, '
      'allowRecordVideo: $allowRecordVideo, minDuration: $minDuration, '
      'maxDuration: $maxDuration, isFrontVideoMirrored: $isFrontVideoMirrored, '
      'sessionPreset: $sessionPreset, focusMode: $focusMode, '
      'exposureMode: $exposureMode, '
      '${directoryPath == null ? '' : 'directoryPath: $directoryPath, '}'
      '${imageName == null ? '' : 'imageName: $imageName, '}'
      'showFlashSwitch: $showFlashSwitch, '
      'allowSwitchCamera: $allowSwitchCamera, '
      'tapToRecordVideo: $tapToRecordVideo, '
      'enableWideCameras: $enableWideCameras, '
      'videoExportType: $videoExportType, '
      'devicePosition: $devicePosition)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CameraConfiguration &&
        other.allowTakePhoto == allowTakePhoto &&
        other.allowRecordVideo == allowRecordVideo &&
        other.minDuration == minDuration &&
        other.maxDuration == maxDuration &&
        other.isFrontVideoMirrored == isFrontVideoMirrored &&
        other.sessionPreset == sessionPreset &&
        other.focusMode == focusMode &&
        other.exposureMode == exposureMode &&
        other.directoryPath == directoryPath &&
        other.imageName == imageName &&
        other.showFlashSwitch == showFlashSwitch &&
        other.allowSwitchCamera == allowSwitchCamera &&
        other.tapToRecordVideo == tapToRecordVideo &&
        other.enableWideCameras == enableWideCameras &&
        other.videoExportType == videoExportType &&
        other.devicePosition == devicePosition;
  }

  @override
  int get hashCode =>
      allowTakePhoto.hashCode ^
      allowRecordVideo.hashCode ^
      minDuration.hashCode ^
      maxDuration.hashCode ^
      isFrontVideoMirrored.hashCode ^
      sessionPreset.hashCode ^
      focusMode.hashCode ^
      exposureMode.hashCode ^
      directoryPath.hashCode ^
      imageName.hashCode ^
      showFlashSwitch.hashCode ^
      allowSwitchCamera.hashCode ^
      tapToRecordVideo.hashCode ^
      enableWideCameras.hashCode ^
      videoExportType.hashCode ^
      devicePosition.hashCode;
}
