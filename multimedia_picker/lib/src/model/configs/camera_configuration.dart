// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/foundation.dart' show immutable;
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../helpers/multimedia_picker_defaults.dart';
import '../submodels/overlay_image.dart';

@immutable
class CameraConfiguration {
  const CameraConfiguration({
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.captureTimer = MultimediaPickerDefaults.captureTimer,
    this.devicePosition = MultimediaPickerDefaults.devicePosition,
    this.enableWideCameras = true,
    this.exposureMode = MultimediaPickerDefaults.exposureMode,
    this.focusMode = MultimediaPickerDefaults.focusMode,
    this.isFrontVideoMirrored = true,
    this.maxDuration = MultimediaPickerDefaults.maxVideoDuration,
    this.minDuration = MultimediaPickerDefaults.minVideoDuration,
    this.minDurationCountdownSize =
        MultimediaPickerDefaults.minDurationCountdownSize,
    this.orientation = MultimediaPickerDefaults.orientation,
    this.overlayImage = OverlayImage.empty,
    this.playCameraSound = true,
    this.sessionPreset = MultimediaPickerDefaults.sessionPreset,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = MultimediaPickerDefaults.videoExportType,
    this.videoStabilization,
  });

  /// Allow taking photos in the camera. Defaults to `true`.
  final bool allowTakePhoto;

  /// Allow video recording in the camera. Defaults to `true`.
  final bool allowRecordVideo;

  /// Countdown timer before taking a photo. Defaults to `Duration.zero`
  /// (no countdown).
  final Duration captureTimer;

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

  /// Camera outputs orientation. Defaults to `any` (not specified).
  final CameraOrientation orientation;

  /// Play camera shutter sound. Defaults to `true`.
  final bool playCameraSound;

  /// Font size (in logical pixels) for the minimum duration countdown timer displayed
  /// during video recording. Must be a positive value. Defaults to platform-specific value.
  final double minDurationCountdownSize;

  // ignore: avoid-high-cyclomatic-complexity, a lot of configuration options.
  CameraConfiguration copyWith({
    bool? allowRecordVideo,
    bool? allowSwitchCamera,
    bool? allowTakePhoto,
    Duration? captureTimer,
    DevicePosition? devicePosition,
    bool? enableWideCameras,
    ExposureMode? exposureMode,
    FocusMode? focusMode,
    bool? isFrontVideoMirrored,
    Duration? maxDuration,
    Duration? minDuration,
    double? minDurationCountdownSize,
    CameraOrientation? orientation,
    OverlayImage? overlayImage,
    bool? playCameraSound,
    CaptureSessionPreset? sessionPreset,
    bool? showFlashSwitch,
    bool? tapToRecordVideo,
    VideoExportType? videoExportType,
    VideoStabilization? videoStabilization,
  }) => CameraConfiguration(
    allowRecordVideo: allowRecordVideo ?? this.allowRecordVideo,
    allowSwitchCamera: allowSwitchCamera ?? this.allowSwitchCamera,
    allowTakePhoto: allowTakePhoto ?? this.allowTakePhoto,
    captureTimer: captureTimer ?? this.captureTimer,
    devicePosition: devicePosition ?? this.devicePosition,
    enableWideCameras: enableWideCameras ?? this.enableWideCameras,
    exposureMode: exposureMode ?? this.exposureMode,
    focusMode: focusMode ?? this.focusMode,
    isFrontVideoMirrored: isFrontVideoMirrored ?? this.isFrontVideoMirrored,
    maxDuration: maxDuration ?? this.maxDuration,
    minDuration: minDuration ?? this.minDuration,
    minDurationCountdownSize:
        minDurationCountdownSize ?? this.minDurationCountdownSize,
    orientation: orientation ?? this.orientation,
    overlayImage: overlayImage ?? this.overlayImage,
    playCameraSound: playCameraSound ?? this.playCameraSound,
    sessionPreset: sessionPreset ?? this.sessionPreset,
    showFlashSwitch: showFlashSwitch ?? this.showFlashSwitch,
    tapToRecordVideo: tapToRecordVideo ?? this.tapToRecordVideo,
    videoExportType: videoExportType ?? this.videoExportType,
    videoStabilization: videoStabilization ?? this.videoStabilization,
  );

  @override
  String toString() =>
      'CameraConfiguration(allowTakePhoto: $allowTakePhoto, '
      'allowRecordVideo: $allowRecordVideo, captureTimer: $captureTimer, '
      'minDuration: $minDuration, maxDuration: $maxDuration, '
      'isFrontVideoMirrored: $isFrontVideoMirrored, '
      'sessionPreset: $sessionPreset, focusMode: $focusMode, '
      'exposureMode: $exposureMode, orientation: $orientation, '
      'overlayImage: $overlayImage, showFlashSwitch: $showFlashSwitch, '
      'allowSwitchCamera: $allowSwitchCamera, '
      'playCameraSound: $playCameraSound, tapToRecordVideo: $tapToRecordVideo, '
      'enableWideCameras: $enableWideCameras, '
      'minDurationCountdownSize: $minDurationCountdownSize, '
      'videoExportType: $videoExportType, '
      '''${videoStabilization == null ? '' : 'videoStabilization: $videoStabilization, '}'''
      'devicePosition: $devicePosition)';

  @override
  // ignore: avoid-high-cyclomatic-complexity, a lot of fields to compare.
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CameraConfiguration &&
        other.allowTakePhoto == allowTakePhoto &&
        other.allowRecordVideo == allowRecordVideo &&
        other.captureTimer == captureTimer &&
        other.minDuration == minDuration &&
        other.maxDuration == maxDuration &&
        other.orientation == orientation &&
        other.overlayImage == overlayImage &&
        other.isFrontVideoMirrored == isFrontVideoMirrored &&
        other.minDurationCountdownSize == minDurationCountdownSize &&
        other.sessionPreset == sessionPreset &&
        other.focusMode == focusMode &&
        other.exposureMode == exposureMode &&
        other.showFlashSwitch == showFlashSwitch &&
        other.allowSwitchCamera == allowSwitchCamera &&
        other.playCameraSound == playCameraSound &&
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
      captureTimer.hashCode ^
      minDuration.hashCode ^
      maxDuration.hashCode ^
      orientation.hashCode ^
      overlayImage.hashCode ^
      isFrontVideoMirrored.hashCode ^
      minDurationCountdownSize.hashCode ^
      sessionPreset.hashCode ^
      focusMode.hashCode ^
      exposureMode.hashCode ^
      showFlashSwitch.hashCode ^
      allowSwitchCamera.hashCode ^
      playCameraSound.hashCode ^
      tapToRecordVideo.hashCode ^
      enableWideCameras.hashCode ^
      videoExportType.hashCode ^
      videoStabilization.hashCode ^
      devicePosition.hashCode;
}
