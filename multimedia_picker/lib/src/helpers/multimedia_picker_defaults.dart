import 'package:flutter/material.dart' show Color;
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

/// Default values for the multimedia picker configuration.
sealed class MultimediaPickerDefaults {
  /// Default image file extension. Value: `'.jpg'`.
  static const imageExtension = '.jpg';

  /// Image file name for saving the media or thumbnail file. Value: `''`.
  static const filename = '';

  /// Default theme color for the picker UI (amber/gold color).
  /// Value: `Color(0xFFf0aa00)`.
  static const themeColor = Color(0xFFf0aa00);

  /// Duration of the selection button animation.
  /// Value: `Duration(milliseconds: 500)`.
  static const selectButtonAnimationDuration = Duration(milliseconds: 500);

  /// Maximum time to wait for picker operations before timing out.
  /// Value: `Duration(seconds: 20)`.
  static const timeout = Duration(seconds: 20);

  /// Minimum spacing between items in the grid.
  /// Value: `2` (logical pixels).
  static const minimumItemSpacing = _defaultGridSpacing;

  /// Minimum spacing between lines in the grid.
  /// Value: `2` (logical pixels).
  static const minimumLineSpacing = _defaultGridSpacing;

  /// Minimum spacing between lines in the grid.
  /// Value: `2` (logical pixels).
  static const gridLineSpacing = _defaultGridSpacing;

  /// Corner radius for media cells in the grid.
  /// Value: `0` (square corners).
  static const cellCornerRadio = 0.0;

  /// Minimum zoom scale for media preview.
  /// Value: `1.0` (no zoom out).
  static const minimumZoomScale = 1.0;

  /// Number of columns to display in the media grid.
  /// Value: `4`.
  static const columnCount = 4;

  /// Maximum auto-scroll speed.
  /// Value: `600.0` pixels per second.
  static const autoScrollMaxSpeed = 600.0;

  /// Maximum number of items to show in the preview.
  /// Value: `20`.
  static const maxPreviewCount = 20;

  /// Maximum number of items that can be selected.
  /// Value: `9`.
  static const maxSelectCount = 9;

  /// Maximum number of videos that can be selected.
  /// Value: `0`.
  static const maxVideoSelectCount = 0;

  /// Minimum number of videos that must be selected.
  /// Value: `0` (optional).
  static const minVideoSelectCount = 0;

  /// Width of generated thumbnails.
  /// Value: `200` pixels.
  static const thumbnailWidth = 200;

  /// Minimum video file size allowed.
  /// Value: `0.0` KB.
  static const minSelectVideoDataSizeKB = 0.0;

  /// Maximum video file size allowed.
  /// Value: `-1.0` KB (no limit).
  static const defaultSelectVideoDataSizeKB = -1.0;

  /// Maximum duration of selectable videos.
  /// Value: `Duration(seconds: 120)`.
  static const maxSelectVideoDuration = Duration(seconds: 120);

  /// Minimum duration of selectable videos.
  /// Value: `Duration.zero`.
  static const minSelectVideoDuration = Duration.zero;

  /// Maximum duration for recorded videos.
  /// Value: `Duration(seconds: 30)`.
  static const maxVideoDuration = Duration(seconds: 30);

  /// Minimum duration for recorded videos.
  /// Value: `Duration.zero`.
  static const minVideoDuration = Duration.zero;

  /// Default capture timer duration before taking a photo.
  /// Value: `Duration.zero` (no countdown).
  static const captureTimer = Duration.zero;

  /// Prefix used for thumbnail file names.
  /// Value: `'.thumbnail_'`.
  static const thumbnailPrefix = '.thumbnail_';

  /// Starting index for numbered items.
  /// Value: `1`.
  static const initialIndex = 1;

  /// Default slider orientation for adjustments.
  /// Value: `AdjustSliderType.vertical`.
  static const adjustSliderType = AdjustSliderType.vertical;

  /// Default HUD (heads-up display) style theme.
  /// Value: `HudStyle.dark`.
  static const hudStyle = HudStyle.dark;

  /// Style of the navigation cancel button.
  /// Value: `CancelButtonStyle.image`.
  static const navCancelButtonStyle = CancelButtonStyle.image;

  /// Default UI language setting.
  /// Value: `UiLocale.system`.
  static const languageType = UiLocale.system;

  /// Default style for the photo browser UI.
  /// Value: `PhotoBrowserStyle.embedAlbumList`.
  static const photoBrowserStyle = PhotoBrowserStyle.embedAlbumList;

  /// Default camera capture quality preset.
  /// Value: `CaptureSessionPreset.hd1920x1080`.
  static const sessionPreset = CaptureSessionPreset.hd1920x1080;

  /// Default camera focus mode.
  /// Value: `FocusMode.continuousAutoFocus`.
  static const focusMode = FocusMode.continuousAutoFocus;

  /// Default camera exposure mode.
  /// Value: `ExposureMode.continuousAutoExposure`.
  static const exposureMode = ExposureMode.continuousAutoExposure;

  /// Default video export format.
  /// Value: `VideoExportType.mp4`.
  static const videoExportType = VideoExportType.mp4;

  /// Default camera position.
  /// Value: `DevicePosition.back`.
  static const devicePosition = DevicePosition.back;

  /// Default camera orientation.
  /// Value: `CameraOrientation.any`.
  static const orientation = CameraOrientation.any;

  /// Default haptic feedback intensity.
  /// Value: `ImpactFeedbackStyle.medium`.
  static const impactFeedbackStyle = ImpactFeedbackStyle.medium;

  /// Default grid spacing value in logical pixels.
  /// Value: `2`.
  static const _defaultGridSpacing = 2.0;
}
