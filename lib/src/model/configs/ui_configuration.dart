// ignore_for_file: avoid-long-files, prefer-boolean-prefixes

import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;

import '../../messages.g.dart';

@immutable
class UiConfiguration {
  const UiConfiguration({
    this.adjustSliderType = AdjustSliderType.vertical,
    this.animateSelectButtonWhenSelectInPreview = true,
    this.animateSelectButtonWhenSelectInThumbnail = false,
    this.cellCornerRadio = 0,
    this.columnCount = 4,
    this.hudStyle = HudStyle.dark,
    this.isDarkStatusBarStyle = false,
    this.languageType = UiLocale.system,
    this.minimumItemSpacing = 2,
    this.minimumLineSpacing = 2,
    this.navCancelButtonStyle = CancelButtonStyle.image,
    this.selectButtonAnimationDuration = const Duration(milliseconds: 500),
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
    this.themeColor = const Color.fromARGB(255, 240, 170, 0),
    this.timeout = const Duration(seconds: 20),
  });

  /// Photo sorting method, the preview interface is not affected by this
  /// parameter. Defaults to `true`.
  final bool sortAscending;

  /// The style of the photo browser. Defaults to `embedAlbumList`.
  final PhotoBrowserStyle style;

  /// The status bar style. Defaults to `true`. If `null`, the system `default`
  /// style is used.
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

  /// The column count when iPhone is in portrait mode. Minimum is `2`,
  /// maximum is `6`. Defaults to `4`.
  final int columnCount;

  /// The minimum spacing to use between items
  /// in the same row for thumbnail view. Defaults to `2`.
  final double minimumItemSpacing;

  /// The minimum spacing to use between lines of items in the grid
  /// for thumbnail view. Defaults to `2`.
  final double minimumLineSpacing;

  /// In thumb image interface, control whether to display the selection button
  /// animation when selecting. Defaults to `false`.
  final bool animateSelectButtonWhenSelectInThumbnail;

  /// In preview interface, control whether to display the selection button
  /// animation when selecting. Defaults to `true`.
  final bool animateSelectButtonWhenSelectInPreview;

  /// Animation duration for select button. Defaults to `500` milliseconds.
  final Duration selectButtonAnimationDuration;

  /// Whether to display the serial number above the selected button. Defaults
  /// to `false`.
  final bool showIndexOnSelectButton;

  /// Whether to display scroll to bottom button. Defaults to `false`.
  final bool showScrollToBottomButton;

  /// Show the image captured by the camera is displayed on the camera button
  /// inside the album. Defaults to `false`.
  final bool showCaptureImageOnTakePhotoButton;

  /// Overlay a mask layer on top of the selected photos. Defaults to `true`.
  final bool showSelectedMask;

  /// Display a border on the selected photos cell. Defaults to `false`.
  final bool showSelectedBorder;

  /// Overlay a mask layer above the cells that cannot be selected. Defaults to
  /// `true`.
  final bool showInvalidMask;

  /// Display the selected photos at the bottom of the preview large photos
  /// interface. Defaults to `true`.
  final bool showSelectedPhotoPreview;

  /// If user choose limited Photo mode, a button with '+' will be added to the
  /// thumbnail view. Defaults to `true`.
  final bool showAddPhotoButton;

  /// Will go to system setting if clicked. Defaults to `true`.
  final bool showEnterSettingTips;

  /// Center tools in tools bar. Defaults to `false`.
  final bool shouldCenterTools;

  /// Timeout for image parsing. Defaults to `20` seconds.
  final Duration timeout;

  /// Language for the picker. Defaults to `system`.
  final UiLocale languageType;

  /// The theme color of picker. Defaults to `Color.fromARGB(255, 240, 170, 0)`.
  final Color themeColor;

  // ignore: avoid-high-cyclomatic-complexity, regular copyWith of a big class.
  UiConfiguration copyWith({
    AdjustSliderType? adjustSliderType,
    bool? animateSelectButtonWhenSelectInPreview,
    bool? animateSelectButtonWhenSelectInThumbnail,
    double? cellCornerRadio,
    int? columnCount,
    HudStyle? hudStyle,
    bool? isDarkStatusBarStyle,
    UiLocale? languageType,
    double? minimumItemSpacing,
    double? minimumLineSpacing,
    CancelButtonStyle? navCancelButtonStyle,
    Duration? selectButtonAnimationDuration,
    bool? shouldCenterTools,
    bool? showAddPhotoButton,
    bool? showCaptureImageOnTakePhotoButton,
    bool? showEnterSettingTips,
    bool? showIndexOnSelectButton,
    bool? showInvalidMask,
    bool? showScrollToBottomButton,
    bool? showSelectedBorder,
    bool? showSelectedMask,
    bool? showSelectedPhotoPreview,
    bool? showStatusBarInPreviewInterface,
    bool? sortAscending,
    PhotoBrowserStyle? style,
    Color? themeColor,
    Duration? timeout,
  }) =>
      UiConfiguration(
        adjustSliderType: adjustSliderType ?? this.adjustSliderType,
        animateSelectButtonWhenSelectInPreview:
            animateSelectButtonWhenSelectInPreview ??
                this.animateSelectButtonWhenSelectInPreview,
        animateSelectButtonWhenSelectInThumbnail:
            animateSelectButtonWhenSelectInThumbnail ??
                this.animateSelectButtonWhenSelectInThumbnail,
        cellCornerRadio: cellCornerRadio ?? this.cellCornerRadio,
        columnCount: columnCount ?? this.columnCount,
        hudStyle: hudStyle ?? this.hudStyle,
        isDarkStatusBarStyle: isDarkStatusBarStyle ?? this.isDarkStatusBarStyle,
        languageType: languageType ?? this.languageType,
        minimumItemSpacing: minimumItemSpacing ?? this.minimumItemSpacing,
        minimumLineSpacing: minimumLineSpacing ?? this.minimumLineSpacing,
        navCancelButtonStyle: navCancelButtonStyle ?? this.navCancelButtonStyle,
        selectButtonAnimationDuration:
            selectButtonAnimationDuration ?? this.selectButtonAnimationDuration,
        shouldCenterTools: shouldCenterTools ?? this.shouldCenterTools,
        showAddPhotoButton: showAddPhotoButton ?? this.showAddPhotoButton,
        showCaptureImageOnTakePhotoButton: showCaptureImageOnTakePhotoButton ??
            this.showCaptureImageOnTakePhotoButton,
        showEnterSettingTips: showEnterSettingTips ?? this.showEnterSettingTips,
        showIndexOnSelectButton:
            showIndexOnSelectButton ?? this.showIndexOnSelectButton,
        showInvalidMask: showInvalidMask ?? this.showInvalidMask,
        showScrollToBottomButton:
            showScrollToBottomButton ?? this.showScrollToBottomButton,
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
      '''animateSelectButtonWhenSelectInThumbnail: $animateSelectButtonWhenSelectInThumbnail, '''
      '''animateSelectButtonWhenSelectInPreview: $animateSelectButtonWhenSelectInPreview, '''
      'selectButtonAnimationDuration: $selectButtonAnimationDuration, '
      'showIndexOnSelectButton: $showIndexOnSelectButton, '
      'showScrollToBottomButton: $showScrollToBottomButton, '
      'showCaptureImageOnTakePhotoButton: $showCaptureImageOnTakePhotoButton, '
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
        other.animateSelectButtonWhenSelectInThumbnail ==
            animateSelectButtonWhenSelectInThumbnail &&
        other.animateSelectButtonWhenSelectInPreview ==
            animateSelectButtonWhenSelectInPreview &&
        other.selectButtonAnimationDuration == selectButtonAnimationDuration &&
        other.showIndexOnSelectButton == showIndexOnSelectButton &&
        other.showScrollToBottomButton == showScrollToBottomButton &&
        other.showCaptureImageOnTakePhotoButton ==
            showCaptureImageOnTakePhotoButton &&
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
      animateSelectButtonWhenSelectInThumbnail.hashCode ^
      animateSelectButtonWhenSelectInPreview.hashCode ^
      selectButtonAnimationDuration.hashCode ^
      showIndexOnSelectButton.hashCode ^
      showScrollToBottomButton.hashCode ^
      showCaptureImageOnTakePhotoButton.hashCode ^
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
