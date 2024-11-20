// ignore_for_file: avoid-long-files, prefer-boolean-prefixes

import 'package:flutter/material.dart' show Color, Colors, immutable;

import '../../messages.g.dart';

@immutable
class UiConfiguration {
  const UiConfiguration({
    this.adjustSliderType = AdjustSliderType.vertical,
    this.animateSelectBtnWhenSelectInPreviewVC = true,
    this.animateSelectBtnWhenSelectInThumbVC = false,
    this.cellCornerRadio = 0,
    this.columnCount = 4,
    this.hudStyle = HudStyle.dark,
    this.isDarkStatusBarStyle = false,
    this.languageType = UiLocale.system,
    this.minimumItemSpacing = 2.0,
    this.minimumLineSpacing = 2.0,
    this.navCancelButtonStyle = CancelButtonStyle.image,
    this.selectBtnAnimationDuration = 1 / 2,
    this.shouldCenterTools = false,
    this.showAddPhotoButton = true,
    this.showCaptureImageOnTakePhotoBtn = false,
    this.showEnterSettingTips = true,
    this.showIndexOnSelectBtn = false,
    this.showInvalidMask = true,
    this.showScrollToBottomBtn = false,
    this.showSelectedBorder = false,
    this.showSelectedMask = true,
    this.showSelectedPhotoPreview = true,
    this.showStatusBarInPreviewInterface = false,
    this.sortAscending = true,
    this.style = PhotoBrowserStyle.embedAlbumList,
    this.themeColor = const Color.fromARGB(255, 240, 170, 0),
    this.timeout = 20.0,
  });

  /// Photo sorting method, the preview interface is not affected by this
  /// parameter. Defaults to `true`.
  final bool sortAscending;

  /// The style of the photo browser. Defaults to `embedAlbumList`.
  final PhotoBrowserStyle style;

  /// The status bar style. Defaults to `lightContent`.
  final bool? isDarkStatusBarStyle;

  /// The style of the cancel button in the navigation bar. Defaults to `image`.
  final CancelButtonStyle navCancelButtonStyle;

  /// Whether to show the status bar when previewing photos.
  /// Defaults to `false`.
  final bool showStatusBarInPreviewInterface;

  /// The style of the HUD. Defaults to `dark`.
  final HudStyle hudStyle;

  /// The type of the adjust slider. Defaults to `vertical`.
  final AdjustSliderType adjustSliderType;

  /// The corner radius of the cells. Defaults to `0`.
  final double cellCornerRadio;

  /// The column count when iPhone is in portrait mode. Minimum is 2, maximum is
  /// 6. Defaults to `4`.
  final int columnCount;

  /// The minimum spacing to use between items
  /// in the same row for thumbnail view.
  final double minimumItemSpacing;

  /// The minimum spacing to use between lines of items in the grid for
  /// `ZLThumbnailViewController`.
  final double minimumLineSpacing;

  /// In thumb image interface, control whether to display the selection button
  /// animation when selecting. Defaults to `false`.
  final bool animateSelectBtnWhenSelectInThumbVC;

  /// In preview interface, control whether to display the selection button
  /// animation when selecting. Defaults to `true`.
  final bool animateSelectBtnWhenSelectInPreviewVC;

  /// Animation duration for select button. Defaults to `0.5`.
  final double selectBtnAnimationDuration;

  /// Whether to display the serial number above the selected button. Defaults
  /// to false.
  final bool showIndexOnSelectBtn;

  /// Whether to display scroll to bottom button. Defaults to `false`.
  final bool showScrollToBottomBtn;

  /// Show the image captured by the camera is displayed on the camera button
  /// inside the album. Defaults to `false`.
  final bool showCaptureImageOnTakePhotoBtn;

  /// Overlay a mask layer on top of the selected photos. Defaults to `true`.
  final bool showSelectedMask;

  /// Display a border on the selected photos cell. Defaults to `false`.
  final bool showSelectedBorder;

  /// Overlay a mask layer above the cells that cannot be selected. Defaults to
  /// true.
  final bool showInvalidMask;

  /// Display the selected photos at the bottom of the preview large photos
  /// interface. Defaults to `true`.
  final bool showSelectedPhotoPreview;

  /// If user choose limited Photo mode, a button with '+' will be added to the
  /// ZLThumbnailViewController. It will call
  /// PHPhotoLibrary.shared().presentLimitedLibraryPicker(from:) to add photo.
  /// Defaults to `true`.
  final bool showAddPhotoButton;

  /// Will go to system setting if clicked. Defaults to `true`.
  final bool showEnterSettingTips;

  /// Center tools in tools bar. Defaults to `false`.
  final bool shouldCenterTools;

  /// Timeout for image parsing. Defaults to `20`.
  final double timeout;

  /// Language for framework.
  final UiLocale languageType;

  /// The theme color of framework.
  final Color themeColor;

  // ignore: avoid-high-cyclomatic-complexity, regular copyWith of a big class.
  UiConfiguration copyWith({
    AdjustSliderType? adjustSliderType,
    bool? animateSelectBtnWhenSelectInPreviewVC,
    bool? animateSelectBtnWhenSelectInThumbVC,
    double? cellCornerRadio,
    int? columnCount,
    HudStyle? hudStyle,
    bool? isDarkStatusBarStyle,
    UiLocale? languageType,
    double? minimumItemSpacing,
    double? minimumLineSpacing,
    CancelButtonStyle? navCancelButtonStyle,
    double? selectBtnAnimationDuration,
    bool? shouldCenterTools,
    bool? showAddPhotoButton,
    bool? showCaptureImageOnTakePhotoBtn,
    bool? showEnterSettingTips,
    bool? showIndexOnSelectBtn,
    bool? showInvalidMask,
    bool? showScrollToBottomBtn,
    bool? showSelectedBorder,
    bool? showSelectedMask,
    bool? showSelectedPhotoPreview,
    bool? showStatusBarInPreviewInterface,
    bool? sortAscending,
    PhotoBrowserStyle? style,
    Color? themeColor,
    double? timeout,
  }) =>
      UiConfiguration(
        adjustSliderType: adjustSliderType ?? this.adjustSliderType,
        animateSelectBtnWhenSelectInPreviewVC:
            animateSelectBtnWhenSelectInPreviewVC ??
                this.animateSelectBtnWhenSelectInPreviewVC,
        animateSelectBtnWhenSelectInThumbVC:
            animateSelectBtnWhenSelectInThumbVC ??
                this.animateSelectBtnWhenSelectInThumbVC,
        cellCornerRadio: cellCornerRadio ?? this.cellCornerRadio,
        columnCount: columnCount ?? this.columnCount,
        hudStyle: hudStyle ?? this.hudStyle,
        isDarkStatusBarStyle: isDarkStatusBarStyle ?? this.isDarkStatusBarStyle,
        languageType: languageType ?? this.languageType,
        minimumItemSpacing: minimumItemSpacing ?? this.minimumItemSpacing,
        minimumLineSpacing: minimumLineSpacing ?? this.minimumLineSpacing,
        navCancelButtonStyle: navCancelButtonStyle ?? this.navCancelButtonStyle,
        selectBtnAnimationDuration:
            selectBtnAnimationDuration ?? this.selectBtnAnimationDuration,
        shouldCenterTools: shouldCenterTools ?? this.shouldCenterTools,
        showAddPhotoButton: showAddPhotoButton ?? this.showAddPhotoButton,
        showCaptureImageOnTakePhotoBtn: showCaptureImageOnTakePhotoBtn ??
            this.showCaptureImageOnTakePhotoBtn,
        showEnterSettingTips: showEnterSettingTips ?? this.showEnterSettingTips,
        showIndexOnSelectBtn: showIndexOnSelectBtn ?? this.showIndexOnSelectBtn,
        showInvalidMask: showInvalidMask ?? this.showInvalidMask,
        showScrollToBottomBtn:
            showScrollToBottomBtn ?? this.showScrollToBottomBtn,
        showSelectedBorder: showSelectedBorder ?? this.showSelectedBorder,
        showSelectedMask: showSelectedMask ?? this.showSelectedMask,
        showSelectedPhotoPreview:
            showSelectedPhotoPreview ?? this.showSelectedPhotoPreview,
        showStatusBarInPreviewInterface: showStatusBarInPreviewInterface ??
            this.showStatusBarInPreviewInterface,
        sortAscending: sortAscending ?? this.sortAscending,
        style: style ?? this.style,
        themeColor: themeColor ?? this.themeColor,
        timeout: timeout ?? this.timeout,
      );

  @override
  String toString() =>
      'UiConfiguration(sortAscending: $sortAscending, style: $style, '
      '''${isDarkStatusBarStyle == null ? '' : 'isDarkStatusBarStyle: $isDarkStatusBarStyle, '}'''
      'navCancelButtonStyle: $navCancelButtonStyle, '
      'showStatusBarInPreviewInterface: $showStatusBarInPreviewInterface, '
      'hudStyle: $hudStyle, adjustSliderType: $adjustSliderType, '
      'cellCornerRadio: $cellCornerRadio, columnCount: $columnCount, '
      'minimumItemSpacing: $minimumItemSpacing, '
      'minimumLineSpacing: $minimumLineSpacing, '
      '''animateSelectBtnWhenSelectInThumbVC: $animateSelectBtnWhenSelectInThumbVC, '''
      '''animateSelectBtnWhenSelectInPreviewVC: $animateSelectBtnWhenSelectInPreviewVC, '''
      'selectBtnAnimationDuration: $selectBtnAnimationDuration, '
      'showIndexOnSelectBtn: $showIndexOnSelectBtn, '
      'showScrollToBottomBtn: $showScrollToBottomBtn, '
      'showCaptureImageOnTakePhotoBtn: $showCaptureImageOnTakePhotoBtn, '
      'showSelectedMask: $showSelectedMask, '
      'showSelectedBorder: $showSelectedBorder, '
      'showInvalidMask: $showInvalidMask, '
      'showSelectedPhotoPreview: $showSelectedPhotoPreview, '
      'showAddPhotoButton: $showAddPhotoButton, '
      'showEnterSettingTips: $showEnterSettingTips, '
      'shouldCenterTools: $shouldCenterTools, '
      'timeout: $timeout, languageType: $languageType, '
      'themeColor: $themeColor)';

  @override
  // ignore: avoid-high-cyclomatic-complexity, big class.
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UiConfiguration &&
        other.sortAscending == sortAscending &&
        other.style == style &&
        other.isDarkStatusBarStyle == isDarkStatusBarStyle &&
        other.navCancelButtonStyle == navCancelButtonStyle &&
        other.showStatusBarInPreviewInterface ==
            showStatusBarInPreviewInterface &&
        other.hudStyle == hudStyle &&
        other.adjustSliderType == adjustSliderType &&
        other.cellCornerRadio == cellCornerRadio &&
        other.columnCount == columnCount &&
        other.minimumItemSpacing == minimumItemSpacing &&
        other.minimumLineSpacing == minimumLineSpacing &&
        other.animateSelectBtnWhenSelectInThumbVC ==
            animateSelectBtnWhenSelectInThumbVC &&
        other.animateSelectBtnWhenSelectInPreviewVC ==
            animateSelectBtnWhenSelectInPreviewVC &&
        other.selectBtnAnimationDuration == selectBtnAnimationDuration &&
        other.showIndexOnSelectBtn == showIndexOnSelectBtn &&
        other.showScrollToBottomBtn == showScrollToBottomBtn &&
        other.showCaptureImageOnTakePhotoBtn ==
            showCaptureImageOnTakePhotoBtn &&
        other.showSelectedMask == showSelectedMask &&
        other.showSelectedBorder == showSelectedBorder &&
        other.showInvalidMask == showInvalidMask &&
        other.showSelectedPhotoPreview == showSelectedPhotoPreview &&
        other.showAddPhotoButton == showAddPhotoButton &&
        other.showEnterSettingTips == showEnterSettingTips &&
        other.shouldCenterTools == shouldCenterTools &&
        other.timeout == timeout &&
        other.languageType == languageType &&
        other.themeColor == themeColor;
  }

  @override
  int get hashCode =>
      sortAscending.hashCode ^
      style.hashCode ^
      isDarkStatusBarStyle.hashCode ^
      navCancelButtonStyle.hashCode ^
      showStatusBarInPreviewInterface.hashCode ^
      hudStyle.hashCode ^
      adjustSliderType.hashCode ^
      cellCornerRadio.hashCode ^
      columnCount.hashCode ^
      minimumItemSpacing.hashCode ^
      minimumLineSpacing.hashCode ^
      animateSelectBtnWhenSelectInThumbVC.hashCode ^
      animateSelectBtnWhenSelectInPreviewVC.hashCode ^
      selectBtnAnimationDuration.hashCode ^
      showIndexOnSelectBtn.hashCode ^
      showScrollToBottomBtn.hashCode ^
      showCaptureImageOnTakePhotoBtn.hashCode ^
      showSelectedMask.hashCode ^
      showSelectedBorder.hashCode ^
      showInvalidMask.hashCode ^
      showSelectedPhotoPreview.hashCode ^
      showAddPhotoButton.hashCode ^
      showEnterSettingTips.hashCode ^
      shouldCenterTools.hashCode ^
      timeout.hashCode ^
      languageType.hashCode ^
      themeColor.hashCode;
}
