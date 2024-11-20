import '../../messages.g.dart';
import '../../model/configs/ui_configuration.dart';

extension UiConfigurationExtension on UiConfiguration {
  RawUiConfiguration get raw => RawUiConfiguration(
        adjustSliderType: adjustSliderType,
        animateSelectBtnWhenSelectInPreviewVC:
            animateSelectBtnWhenSelectInPreviewVC,
        animateSelectBtnWhenSelectInThumbVC:
            animateSelectBtnWhenSelectInThumbVC,
        cellCornerRadio: cellCornerRadio,
        columnCount: columnCount.clamp(2, 6),
        hudStyle: hudStyle,
        isDarkStatusBarStyle: isDarkStatusBarStyle,
        languageType: languageType,
        minimumItemSpacing: minimumItemSpacing,
        minimumLineSpacing: minimumLineSpacing,
        navCancelButtonStyle: navCancelButtonStyle,
        selectBtnAnimationDuration: selectBtnAnimationDuration.inMilliseconds /
            Duration.millisecondsPerSecond,
        shouldCenterTools: shouldCenterTools,
        showAddPhotoButton: showAddPhotoButton,
        showCaptureImageOnTakePhotoBtn: showCaptureImageOnTakePhotoBtn,
        showEnterSettingTips: showEnterSettingTips,
        showIndexOnSelectBtn: showIndexOnSelectBtn,
        showInvalidMask: showInvalidMask,
        showScrollToBottomBtn: showScrollToBottomBtn,
        showSelectedBorder: showSelectedBorder,
        showSelectedMask: showSelectedMask,
        showSelectedPhotoPreview: showSelectedPhotoPreview,
        showStatusBarInPreviewInterface: showStatusBarInPreviewInterface,
        sortAscending: sortAscending,
        style: style,
        themeColor: themeColor.value,
        timeout: timeout.inMilliseconds / Duration.millisecondsPerSecond,
      );
}
