import '../../../messages.g.dart';
import '../../../model/configs/ui_configuration.dart';
import 'color_extension.dart';

extension UiConfigurationExtension on UiConfiguration {
  RawUiConfiguration get raw => RawUiConfiguration(
        adjustSliderType: adjustSliderType,
        animateSelectButtonWhenSelectInPreview:
            animateSelectButtonWhenSelectInPreview,
        animateSelectButtonWhenSelectInThumbnail:
            animateSelectButtonWhenSelectInThumbnail,
        cellCornerRadio: cellCornerRadio,
        columnCount: columnCount.clamp(2, 6),
        hudStyle: hudStyle,
        isDarkStatusBarStyle: isDarkStatusBarStyle,
        languageType: languageType,
        minimumItemSpacing: minimumItemSpacing,
        minimumLineSpacing: minimumLineSpacing,
        navCancelButtonStyle: navCancelButtonStyle,
        selectButtonAnimationDuration:
            selectButtonAnimationDuration.inMilliseconds /
                Duration.millisecondsPerSecond,
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
        themeColor: themeColor.rawValue,
        timeout: timeout.inMilliseconds / Duration.millisecondsPerSecond,
      );
}
