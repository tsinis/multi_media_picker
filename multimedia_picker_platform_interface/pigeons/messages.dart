// Copyright 2025 Roman Cinis. All rights reserved.
// Use of this source code is governed by a MIT license that can be found in the
// LICENSE file.

// ignore_for_file: prefer-single-declaration-per-file, prefer-boolean-prefixes,
// ignore_for_file: enum-constants-ordering, no-magic-number, add-copy-with
// ignore_for_file: prefer-named-parameters,

import 'package:pigeon/pigeon.dart';

// ignore: prefer-match-file-name, this is a source for a code-gen.
enum CaptureSessionPreset {
  cif352x288,
  vga640x480,
  hd1280x720,
  hd1920x1080,
  hd4K3840x2160,
  photo,
}

enum EditTool { draw, clip, imageSticker, textSticker, mosaic, filter, adjust }

enum UiLocale {
  system,
  chineseSimplified,
  chineseTraditional,
  english,
  japanese,
  french,
  german,
  russian,
  vietnamese,
  korean,
  malay,
  italian,
  indonesian,
  portuguese,
  spanish,
  turkish,
  arabic,
  dutch,
}

enum AdjustSliderType { vertical, horizontal }

enum AdjustTool { brightness, contrast, saturation }

enum CancelButtonStyle { text, image }

enum DevicePosition { back, front }

enum ExposureMode { autoExpose, continuousAutoExposure }

enum FocusMode { autoFocus, continuousAutoFocus }

enum HudStyle { light, lightBlur, dark, darkBlur }

enum ImpactFeedbackStyle { light, medium, heavy }

enum MediaType { image, video }

enum PhotoBrowserStyle { embedAlbumList, externalAlbumList }

enum VideoExportType { mov, mp4 }

enum VideoStabilization { off, standard, cinematic, cinematicExtended }

enum CameraOrientation {
  any,
  portrait,
  portraitUpsideDown,
  landscapeRight,
  landscapeLeft,
}

class RawOverlayImage {
  const RawOverlayImage(
    this.path, {
    this.isAsset = false,
    this.opacity = 1,
    this.rotationAngle = 0,
    this.tintColor = 0x00000000,
  });

  final String path;
  final bool isAsset;
  final double opacity;
  final double rotationAngle;
  final int tintColor;
}

class RawLocalizations {
  const RawLocalizations({this.iOsCameraTapToRecordVideoTip});

  final String? iOsCameraTapToRecordVideoTip;
}

class RawUiConfiguration {
  const RawUiConfiguration({
    this.adjustSliderType = AdjustSliderType.vertical,
    this.animateSelectButtonWhenSelectInPreview = true,
    this.animateSelectButtonWhenSelectInThumbnail = false,
    this.cellCornerRadio = 0,
    this.columnCount = 4,
    this.hudStyle = HudStyle.dark,
    this.isDarkStatusBarStyle,
    this.l10n,
    this.languageType = UiLocale.system,
    this.minimumItemSpacing = 2,
    this.minimumLineSpacing = 2,
    this.navCancelButtonStyle = CancelButtonStyle.image,
    this.selectButtonAnimationDuration = 0.5,
    this.shouldCenterTools = false,
    this.showAddPhotoButton = true,
    this.showCaptureImageOnTakePhotoButton = false,
    this.showEnterSettingTips = true,
    this.showIndexOnSelectButton = false,
    this.showInvalidMask = true,
    this.showScrollToBottomButton = false,
    this.showSelectedBorder = false,
    this.showSelectedMask = true,
    this.showSelectedPhotoPreview = true,
    this.showStatusBarInPreviewInterface = false,
    this.sortAscending = true,
    this.style = PhotoBrowserStyle.embedAlbumList,
    this.themeColor = 0xFFf0aa00,
    this.themeFontName,
    this.timeout = 20,
  });

  final bool sortAscending;
  final PhotoBrowserStyle style;
  final bool? isDarkStatusBarStyle;
  final CancelButtonStyle navCancelButtonStyle;
  final bool showStatusBarInPreviewInterface;
  final HudStyle hudStyle;
  final AdjustSliderType adjustSliderType;
  final double cellCornerRadio;
  final int columnCount;
  final double minimumItemSpacing;
  final double minimumLineSpacing;
  final bool animateSelectButtonWhenSelectInThumbnail;
  final bool animateSelectButtonWhenSelectInPreview;
  final double selectButtonAnimationDuration;
  final bool showIndexOnSelectButton;
  final bool showScrollToBottomButton;
  final bool showCaptureImageOnTakePhotoButton;
  final bool showSelectedMask;
  final bool showSelectedBorder;
  final bool showInvalidMask;
  final bool showSelectedPhotoPreview;
  final bool showAddPhotoButton;
  final bool showEnterSettingTips;
  final bool shouldCenterTools;
  final double timeout;
  final UiLocale languageType;
  final String? themeFontName;
  final int themeColor;
  final RawLocalizations? l10n;
}

class ClipAspectRatio {
  const ClipAspectRatio({
    required this.aspectRatioX,
    required this.aspectRatioY,
  });

  final int aspectRatioX;
  final int aspectRatioY;
}

class ClipOptions {
  const ClipOptions({this.aspectRatio, this.isCircle = false});

  final bool isCircle;
  final ClipAspectRatio? aspectRatio;
}

class RawMediaData {
  const RawMediaData(this.path, this.thumbPath, this.type, {this.durationSec});

  final String path;
  final String? thumbPath;
  final MediaType type;
  final int? durationSec;
}

class RawPickerConfiguration {
  const RawPickerConfiguration({
    this.allowDragSelect = false,
    this.allowEditImage = true,
    this.allowEditVideo = true,
    this.allowMixSelect = true,
    this.allowPreviewPhotos = true,
    this.allowSelectGif = true,
    this.allowSelectImage = true,
    this.allowSelectLivePhoto = false,
    this.allowSelectOriginal = true,
    this.allowSelectVideo = true,
    this.allowSlideSelect = true,
    this.allowTakePhotoInLibrary = true,
    this.alwaysRequestOriginal = false,
    this.autoScrollMaxSpeed = 600,
    this.autoScrollWhenSlideSelectIsActive = true,
    this.callbackDirectlyAfterTakingPhoto = false,
    this.cropVideoAfterSelectThumbnail = true,
    this.directoryPath,
    this.downloadVideoBeforeSelecting = false,
    this.editAfterSelectThumbnailImage = false,
    this.filename,
    this.initialIndex = 1,
    this.maxEditVideoDurationSeconds = 30,
    this.maxPreviewCount = 20,
    this.maxSelectCount = 9,
    this.maxSelectVideoDataSizeKB,
    this.maxSelectVideoDurationSeconds = 120,
    this.maxVideoSelectCount = 0,
    this.minSelectVideoDataSizeKB = 0,
    this.minSelectVideoDurationSeconds = 0,
    this.minVideoSelectCount = 0,
    this.saveNewImageAfterEdit = true,
    this.showOriginalSizeWhenSelectOriginal = true,
    this.showPreviewButtonInAlbum = true,
    this.showSelectButtonWhenSingleSelect = false,
    this.showSelectCountOnDoneButton = true,
    this.showSelectedIndex = true,
    this.thumbnailPrefix = '.thumbnail_',
    this.thumbnailWidth = 200,
    this.useCustomCamera = true,
  });

  final int maxSelectCount;
  final int maxVideoSelectCount;
  final int minVideoSelectCount;
  final bool allowMixSelect;
  final int maxPreviewCount;
  final int initialIndex;
  final bool allowSelectImage;
  final bool allowSelectVideo;
  final bool downloadVideoBeforeSelecting;
  final bool allowSelectGif;
  final bool allowSelectLivePhoto;
  final bool allowTakePhotoInLibrary;
  final bool callbackDirectlyAfterTakingPhoto;
  final bool allowEditImage;
  final bool allowEditVideo;
  final bool editAfterSelectThumbnailImage;
  final bool cropVideoAfterSelectThumbnail;
  final bool saveNewImageAfterEdit;
  final bool allowSlideSelect;
  final bool autoScrollWhenSlideSelectIsActive;
  final double autoScrollMaxSpeed;
  final bool allowDragSelect;
  final bool allowSelectOriginal;
  final bool alwaysRequestOriginal;
  final bool showOriginalSizeWhenSelectOriginal;
  final bool allowPreviewPhotos;
  final bool showPreviewButtonInAlbum;
  final bool showSelectCountOnDoneButton;
  final bool showSelectButtonWhenSingleSelect;
  final bool showSelectedIndex;
  final String thumbnailPrefix;
  final int thumbnailWidth;
  final int maxEditVideoDurationSeconds;
  final int maxSelectVideoDurationSeconds;
  final int minSelectVideoDurationSeconds;
  final double? maxSelectVideoDataSizeKB;
  final double minSelectVideoDataSizeKB;
  final bool useCustomCamera;
  final String? directoryPath;
  final String? filename;
}

class RawEditConfiguration {
  const RawEditConfiguration({
    this.adjustTools = const [],
    this.clipOptions,
    this.dimClippedAreaDuringAdjustments = false,
    this.impactFeedbackStyle = ImpactFeedbackStyle.medium,
    this.impactFeedbackWhenAdjustSliderValueIsZero = true,
    this.minimumZoomScale = 1,
    this.showClipDirectlyIfOnlyHasClipTool = false,
    this.tools = const [],
  });

  final List<EditTool> tools;
  final ClipOptions? clipOptions;
  final List<AdjustTool> adjustTools;
  final bool showClipDirectlyIfOnlyHasClipTool;
  final bool impactFeedbackWhenAdjustSliderValueIsZero;
  final ImpactFeedbackStyle impactFeedbackStyle;
  final bool dimClippedAreaDuringAdjustments;
  final double minimumZoomScale;
}

class RawCameraConfiguration {
  const RawCameraConfiguration({
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.captureTimerSeconds = 0,
    this.devicePosition = DevicePosition.back,
    this.enableWideCameras = true,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.isFrontVideoMirrored = true,
    this.maxDurationSeconds = 30,
    this.minDurationCountdownSize,
    this.minDurationSeconds = 0,
    this.orientation = CameraOrientation.any,
    this.overlayImage,
    this.playCameraSound = true,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = VideoExportType.mp4,
    this.videoStabilization,
  });

  final bool allowTakePhoto;
  final bool allowRecordVideo;
  final int captureTimerSeconds;
  final int minDurationSeconds;
  final int maxDurationSeconds;
  final bool isFrontVideoMirrored;
  final CaptureSessionPreset sessionPreset;
  final FocusMode focusMode;
  final ExposureMode exposureMode;
  final bool showFlashSwitch;
  final bool allowSwitchCamera;
  final bool tapToRecordVideo;
  final bool enableWideCameras;
  final VideoExportType videoExportType;
  final DevicePosition devicePosition;
  final bool playCameraSound;
  final RawOverlayImage? overlayImage;
  final VideoStabilization? videoStabilization;
  final double? minDurationCountdownSize;
  final CameraOrientation orientation;
}

@ConfigurePigeon(
  PigeonOptions(
    copyrightHeader: 'pigeons/copyright_header.txt',
    dartOut: 'lib/src/messages.g.dart',
    dartPackageName: 'multimedia_picker',
    dartTestOut:
        '../multimedia_picker_testing/lib/src/test_multimedia_api.g.dart',
    debugGenerators: true,
    swiftOut:
        '../multimedia_picker_ios/ios/multimedia_picker_ios/Sources/multimedia_picker_ios/Classes/messages.g.swift',
  ),
)
@HostApi(dartHostTestHandler: 'TestMultimediaApi')
abstract class MultiMediaApi {
  @async
  RawMediaData? openCamera(
    RawCameraConfiguration cameraConfig,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  );

  @async
  RawMediaData? editMedia(
    RawMediaData data,
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  );

  @async
  List<RawMediaData>? openGallery(
    RawEditConfiguration editConfig,
    RawPickerConfiguration pickerConfig,
    RawUiConfiguration uiConfig,
  );
}
