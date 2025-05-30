import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../../../model/configs/ui_configuration.dart';
import '../../sdk_model/color_extension.dart';

extension UiConfigurationExtensionInternal on UiConfiguration {
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
    l10n: RawLocalizations(
      iOsCameraTapToRecordVideoTip: l10n.iOsCameraTapToRecordVideoTip.isNotEmpty
          ? l10n.iOsCameraTapToRecordVideoTip
          : null,
    ),
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
    themeFontName: themeFontName,
    timeout: timeout.inMilliseconds / Duration.millisecondsPerSecond,
  );
}
