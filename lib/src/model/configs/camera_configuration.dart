// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/foundation.dart' show immutable;

import '../../messages.g.dart';
import '../submodels/overlay_image.dart';

@immutable
class CameraConfiguration {
  const CameraConfiguration({
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.devicePosition = DevicePosition.back,
    this.enableWideCameras = true,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.isFrontVideoMirrored = true,
    this.maxDuration = const Duration(seconds: 30),
    this.minDuration = Duration.zero,
    this.overlayImage = OverlayImage.empty,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = VideoExportType.mp4,
    this.videoStabilization,
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

  /// Video stabilization configuration. Defaults to `null` - auto detection.
  final VideoStabilization? videoStabilization;

  /// The default camera position after entering the camera. Defaults to `back`.
  final DevicePosition devicePosition;

  /// Overlay image on camera view. Defaults to no overlay (empty image).
  final OverlayImage overlayImage;

  CameraConfiguration copyWith({
    bool? allowRecordVideo,
    bool? allowSwitchCamera,
    bool? allowTakePhoto,
    DevicePosition? devicePosition,
    bool? enableWideCameras,
    ExposureMode? exposureMode,
    FocusMode? focusMode,
    bool? isFrontVideoMirrored,
    Duration? maxDuration,
    Duration? minDuration,
    OverlayImage? overlayImage,
    CaptureSessionPreset? sessionPreset,
    bool? showFlashSwitch,
    bool? tapToRecordVideo,
    VideoExportType? videoExportType,
    VideoStabilization? videoStabilization,
  }) =>
      CameraConfiguration(
        allowRecordVideo: allowRecordVideo ?? this.allowRecordVideo,
        allowSwitchCamera: allowSwitchCamera ?? this.allowSwitchCamera,
        allowTakePhoto: allowTakePhoto ?? this.allowTakePhoto,
        devicePosition: devicePosition ?? this.devicePosition,
        enableWideCameras: enableWideCameras ?? this.enableWideCameras,
        exposureMode: exposureMode ?? this.exposureMode,
        focusMode: focusMode ?? this.focusMode,
        isFrontVideoMirrored: isFrontVideoMirrored ?? this.isFrontVideoMirrored,
        maxDuration: maxDuration ?? this.maxDuration,
        minDuration: minDuration ?? this.minDuration,
        overlayImage: overlayImage ?? this.overlayImage,
        sessionPreset: sessionPreset ?? this.sessionPreset,
        showFlashSwitch: showFlashSwitch ?? this.showFlashSwitch,
        tapToRecordVideo: tapToRecordVideo ?? this.tapToRecordVideo,
        videoExportType: videoExportType ?? this.videoExportType,
        videoStabilization: videoStabilization ?? this.videoStabilization,
      );

  @override
  String toString() => 'CameraConfiguration(allowTakePhoto: $allowTakePhoto, '
      'allowRecordVideo: $allowRecordVideo, minDuration: $minDuration, '
      'maxDuration: $maxDuration, isFrontVideoMirrored: $isFrontVideoMirrored, '
      'sessionPreset: $sessionPreset, focusMode: $focusMode, '
      'exposureMode: $exposureMode, overlayImage: $overlayImage, '
      'showFlashSwitch: $showFlashSwitch, '
      'allowSwitchCamera: $allowSwitchCamera, '
      'tapToRecordVideo: $tapToRecordVideo, '
      'enableWideCameras: $enableWideCameras, '
      'videoExportType: $videoExportType, '
      '''${videoStabilization == null ? '' : 'videoStabilization: $videoStabilization, '}'''
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
        other.showFlashSwitch == showFlashSwitch &&
        other.allowSwitchCamera == allowSwitchCamera &&
        other.tapToRecordVideo == tapToRecordVideo &&
        other.enableWideCameras == enableWideCameras &&
        other.videoExportType == videoExportType &&
        other.videoStabilization == videoStabilization &&
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
      showFlashSwitch.hashCode ^
      allowSwitchCamera.hashCode ^
      tapToRecordVideo.hashCode ^
      enableWideCameras.hashCode ^
      videoExportType.hashCode ^
      videoStabilization.hashCode ^
      devicePosition.hashCode;
}
