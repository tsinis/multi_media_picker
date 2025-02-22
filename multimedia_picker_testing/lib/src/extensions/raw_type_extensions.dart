// ignore_for_file: prefer-single-declaration-per-file,prefer-getter-over-method

import 'dart:io' show Directory;
import 'dart:math' show max;

import 'package:flutter/material.dart' show Color;
import 'package:multimedia_picker/multimedia_picker.dart';
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

// Extensions for converting Raw* types to their public counterparts.

// ignore: prefer-match-file-name, it's testing package.
extension RawEditConfigurationTestingExtensions on RawEditConfiguration {
  /// Converts [RawEditConfiguration] to [EditConfiguration].
  EditConfiguration fromRaw() => EditConfiguration(
    adjustTools: adjustTools.toSet(),
    clipOptions: clipOptions,
    dimClippedAreaDuringAdjustments: dimClippedAreaDuringAdjustments,
    impactFeedbackStyle: impactFeedbackStyle,
    impactFeedbackWhenAdjustSliderValueIsZero:
        impactFeedbackWhenAdjustSliderValueIsZero,
    minimumZoomScale: minimumZoomScale,
    showClipDirectlyIfOnlyHasClipTool: showClipDirectlyIfOnlyHasClipTool,
    tools: tools.toSet(),
  );
}

extension RawUiConfigurationTestingExtensions on RawUiConfiguration {
  static const _millisecondsPerSecond = 1000;

  /// Converts [RawUiConfiguration] to [UiConfiguration].
  UiConfiguration fromRaw() => UiConfiguration(
    adjustSliderType: adjustSliderType,
    animateSelectButtonWhenSelectInPreview:
        animateSelectButtonWhenSelectInPreview,
    animateSelectButtonWhenSelectInThumbnail:
        animateSelectButtonWhenSelectInThumbnail,
    cellCornerRadio: cellCornerRadio,
    columnCount: columnCount,
    hudStyle: hudStyle,
    isDarkStatusBarStyle: isDarkStatusBarStyle,
    l10n: PickerLocalizations(
      iOsCameraTapToRecordVideoTip: l10n?.iOsCameraTapToRecordVideoTip,
    ),
    languageType: languageType,
    minimumItemSpacing: minimumItemSpacing,
    minimumLineSpacing: minimumLineSpacing,
    navCancelButtonStyle: navCancelButtonStyle,
    selectButtonAnimationDuration: Duration(
      milliseconds:
          (selectButtonAnimationDuration * _millisecondsPerSecond).round(),
    ),
    shouldCenterTools: shouldCenterTools,
    showAddPhotoButton: showAddPhotoButton,
    showCaptureImageOnTakePhotoButton: showCaptureImageOnTakePhotoButton,
    showEnterSettingTips: showEnterSettingTips,
    showIndexOnSelectButton: showIndexOnSelectButton,
    showInvalidMask: showInvalidMask,
    showScrollToBottomButton: showScrollToBottomButton,
    showSelectedBorder: showSelectedBorder,
    showSelectedMask: showSelectedMask,
    showSelectedPhotoPreview: showSelectedPhotoPreview,
    showStatusBarInPreviewInterface: showStatusBarInPreviewInterface,
    sortAscending: sortAscending,
    style: style,
    themeColor: Color(themeColor),
    timeout: Duration(milliseconds: (timeout * _millisecondsPerSecond).round()),
  );
}

extension RawCameraConfigurationTestingExtensions on RawCameraConfiguration {
  /// Converts [RawCameraConfiguration] to [CameraConfiguration].
  CameraConfiguration fromRaw() => CameraConfiguration(
    allowRecordVideo: allowRecordVideo,
    allowSwitchCamera: allowSwitchCamera,
    allowTakePhoto: allowTakePhoto,
    devicePosition: devicePosition,
    enableWideCameras: enableWideCameras,
    exposureMode: exposureMode,
    focusMode: focusMode,
    isFrontVideoMirrored: isFrontVideoMirrored,
    maxDuration: maxDurationSeconds.duration,
    minDuration: minDurationSeconds.duration,
    overlayImage: OverlayImage(
      overlayImage?.path,
      isAsset: overlayImage?.isAsset ?? false,
      opacity: overlayImage?.opacity ?? 1,
      rotationAngle: overlayImage?.rotationAngle ?? 0,
      tintColor: Color(overlayImage?.tintColor ?? 0x00000000),
    ),
    sessionPreset: sessionPreset,
    showFlashSwitch: showFlashSwitch,
    tapToRecordVideo: tapToRecordVideo,
    videoExportType: videoExportType,
    videoStabilization: videoStabilization,
  );
}

extension RawPickerConfigurationTestingExtensions on RawPickerConfiguration {
  /// Converts [RawPickerConfiguration] to [PickerConfiguration].
  PickerConfiguration fromRaw() => PickerConfiguration(
    allowDragSelect: allowDragSelect,
    allowEditImage: allowEditImage,
    allowEditVideo: allowEditVideo,
    allowMixSelect: allowMixSelect,
    allowPreviewPhotos: allowPreviewPhotos,
    allowSelectImage: allowSelectImage,
    allowSelectLivePhoto: allowSelectLivePhoto,
    allowSelectOriginal: allowSelectOriginal,
    allowSelectVideo: allowSelectVideo,
    allowSlideSelect: allowSlideSelect,
    allowTakePhotoInLibrary: allowTakePhotoInLibrary,
    alwaysRequestOriginal: alwaysRequestOriginal,
    autoScrollMaxSpeed: autoScrollMaxSpeed,
    autoScrollWhenSlideSelectIsActive: autoScrollWhenSlideSelectIsActive,
    callbackDirectlyAfterTakingPhoto: callbackDirectlyAfterTakingPhoto,
    cropVideoAfterSelectThumbnail: cropVideoAfterSelectThumbnail,
    directory:
        (directoryPath?.isEmpty ?? true)
            ? null
            : Directory(directoryPath ?? ''),
    downloadVideoBeforeSelecting: downloadVideoBeforeSelecting,
    editAfterSelectThumbnailImage: editAfterSelectThumbnailImage,
    filename: filename ?? '',
    initialIndex: initialIndex,
    maxEditVideoDuration: maxEditVideoDurationSeconds.duration,
    maxPreviewCount: maxPreviewCount,
    maxSelectCount: maxSelectCount,
    maxSelectVideoDataSizeKB: maxSelectVideoDataSizeKB ?? -1,
    maxSelectVideoDuration: maxSelectVideoDurationSeconds.duration,
    maxVideoSelectCount: maxVideoSelectCount,
    minSelectVideoDataSizeKB: minSelectVideoDataSizeKB,
    minSelectVideoDuration: minSelectVideoDurationSeconds.duration,
    minVideoSelectCount: minVideoSelectCount,
    saveNewImageAfterEdit: saveNewImageAfterEdit,
    showOriginalSizeWhenSelectOriginal: showOriginalSizeWhenSelectOriginal,
    showPreviewButtonInAlbum: showPreviewButtonInAlbum,
    showSelectButtonWhenSingleSelect: showSelectButtonWhenSingleSelect,
    showSelectCountOnDoneButton: showSelectCountOnDoneButton,
    showSelectedIndex: showSelectedIndex,
    thumbnailPrefix: thumbnailPrefix,
    thumbnailWidth: thumbnailWidth,
    useCustomCamera: useCustomCamera,
  );
}

extension _RawConfigurationDuration on int {
  Duration get duration => Duration(seconds: max(0, this));
}
