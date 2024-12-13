// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/material.dart';

import '../../../helpers/extensions/model/color_extension.dart';
import '../../../messages.g.dart';
import '../../../model/configs/ui_configuration.dart';
import '../interfaces/base_config_list_view.dart';
import '../tiles/text_styled_list_tile.dart';

class UiConfigurationListView extends BaseConfigListView<UiConfiguration> {
  const UiConfigurationListView(
    super.configuration, {
    this.adjustSliderTypeSubtitle = const SelectableText('adjustSliderType'),
    this.adjustSliderTypeTitle = const Text('Adjust Slider Type'),
    this.animateSelectButtonWhenSelectInPreviewSubtitle =
        const SelectableText('animateSelectButtonWhenSelectInPreview'),
    this.animateSelectButtonWhenSelectInPreviewTitle =
        const Text('Animate Select Button When Select In Preview'),
    this.animateSelectButtonWhenSelectInThumbnailSubtitle =
        const SelectableText('animateSelectButtonWhenSelectInThumbnail'),
    this.animateSelectButtonWhenSelectInThumbnailTitle =
        const Text('Animate Select Button When Select In Thumbnail'),
    this.cellCornerRadioDecoration =
        const InputDecoration(hintText: 'Cell Corner Radius'),
    this.cellCornerRadioSubtitle = const SelectableText('cellCornerRadio'),
    this.columnCountDecoration =
        const InputDecoration(hintText: 'Column Count'),
    this.columnCountSubtitle = const SelectableText('columnCount'),
    this.hudStyleSubtitle = const SelectableText('hudStyle'),
    this.hudStyleTitle = const Text('HUD Style'),
    this.isDarkStatusBarStyleSubtitle =
        const SelectableText('isDarkStatusBarStyle'),
    this.isDarkStatusBarStyleTitle = const Text('Is Dark Status Bar Style'),
    this.languageTypeSubtitle = const SelectableText('languageType'),
    this.languageTypeTitle = const Text('Language Type'),
    this.minimumItemSpacingDecoration =
        const InputDecoration(hintText: 'Minimum Item Spacing'),
    this.minimumItemSpacingSubtitle =
        const SelectableText('minimumItemSpacing'),
    this.minimumLineSpacingSubtitle =
        const SelectableText('minimumLineSpacing'),
    this.minimumLineSpacingTitle = const Text('Minimum Line Spacing'),
    this.navCancelButtonStyleSubtitle =
        const SelectableText('navCancelButtonStyle'),
    this.navCancelButtonStyleTitle = const Text('Nav Cancel Button Style'),
    this.selectButtonAnimationDurationSubtitle =
        const SelectableText('selectButtonAnimationDuration'),
    this.selectButtonAnimationDurationTitle =
        const Text('Select Button Animation Duration'),
    this.shouldCenterToolsSubtitle = const SelectableText('shouldCenterTools'),
    this.shouldCenterToolsTitle = const Text('Should Center Tools'),
    this.showAddPhotoButtonSubtitle =
        const SelectableText('showAddPhotoButton'),
    this.showAddPhotoButtonTitle = const Text('Show Add Photo Button'),
    this.showCaptureImageOnTakePhotoButtonSubtitle =
        const SelectableText('showCaptureImageOnTakePhotoButton'),
    this.showCaptureImageOnTakePhotoButtonTitle =
        const Text('Show Capture Image On Take Photo Button'),
    this.showEnterSettingTipsSubtitle =
        const SelectableText('showEnterSettingTips'),
    this.showEnterSettingTipsTitle = const Text('Show Enter Setting Tips'),
    this.showIndexOnSelectButtonSubtitle =
        const SelectableText('showIndexOnSelectButton'),
    this.showIndexOnSelectButtonTitle =
        const Text('Show Index On Select Button'),
    this.showInvalidMaskSubtitle = const SelectableText('showInvalidMask'),
    this.showInvalidMaskTitle = const Text('Show Invalid Mask'),
    this.showScrollToBottomButtonSubtitle =
        const SelectableText('showScrollToBottomButton'),
    this.showScrollToBottomButtonTitle =
        const Text('Show Scroll To Bottom Button'),
    this.showSelectedBorderSubtitle =
        const SelectableText('showSelectedBorder'),
    this.showSelectedBorderTitle = const Text('Show Selected Border'),
    this.showSelectedMaskSubtitle = const SelectableText('showSelectedMask'),
    this.showSelectedMaskTitle = const Text('Show Selected Mask'),
    this.showSelectedPhotoPreviewSubtitle =
        const SelectableText('showSelectedPhotoPreview'),
    this.showSelectedPhotoPreviewTitle =
        const Text('Show Selected Photo Preview'),
    this.showStatusBarInPreviewInterfaceSubtitle =
        const SelectableText('showStatusBarInPreviewInterface'),
    this.showStatusBarInPreviewInterfaceTitle =
        const Text('Show Status Bar In Preview Interface'),
    this.sortAscendingSubtitle = const SelectableText('sortAscending'),
    this.sortAscendingTitle = const Text('Sort Ascending'),
    this.styleSubtitle = const SelectableText('style'),
    this.styleTitle = const Text('Style'),
    this.themeColorDecoration =
        const InputDecoration(hintText: 'Theme Color (ARGB)'),
    this.themeColorSubtitle = const SelectableText('themeColor'),
    this.timeoutSubtitle = const SelectableText('timeout'),
    this.timeoutTitle = const Text('Timeout'),
    super.key,
    super.onShowDurationPicker,
    super.onShowEnumPicker,
  });

  final Widget? adjustSliderTypeSubtitle;
  final Widget? adjustSliderTypeTitle;
  final Widget? animateSelectButtonWhenSelectInPreviewSubtitle;
  final Widget? animateSelectButtonWhenSelectInPreviewTitle;
  final Widget? animateSelectButtonWhenSelectInThumbnailSubtitle;
  final Widget? animateSelectButtonWhenSelectInThumbnailTitle;
  final InputDecoration? cellCornerRadioDecoration;
  final Widget? cellCornerRadioSubtitle;
  final InputDecoration? columnCountDecoration;
  final Widget? columnCountSubtitle;
  final Widget? hudStyleSubtitle;
  final Widget? hudStyleTitle;
  final Widget? isDarkStatusBarStyleSubtitle;
  final Widget? isDarkStatusBarStyleTitle;
  final Widget? languageTypeSubtitle;
  final Widget? languageTypeTitle;
  final InputDecoration? minimumItemSpacingDecoration;
  final Widget? minimumItemSpacingSubtitle;
  final Widget? minimumLineSpacingSubtitle;
  final Widget? minimumLineSpacingTitle;
  final Widget? navCancelButtonStyleSubtitle;
  final Widget? navCancelButtonStyleTitle;
  final Widget? selectButtonAnimationDurationSubtitle;
  final Widget? selectButtonAnimationDurationTitle;
  final Widget? shouldCenterToolsSubtitle;
  final Widget? shouldCenterToolsTitle;
  final Widget? showAddPhotoButtonSubtitle;
  final Widget? showAddPhotoButtonTitle;
  final Widget? showCaptureImageOnTakePhotoButtonSubtitle;
  final Widget? showCaptureImageOnTakePhotoButtonTitle;
  final Widget? showEnterSettingTipsSubtitle;
  final Widget? showEnterSettingTipsTitle;
  final Widget? showIndexOnSelectButtonSubtitle;
  final Widget? showIndexOnSelectButtonTitle;
  final Widget? showInvalidMaskSubtitle;
  final Widget? showInvalidMaskTitle;
  final Widget? showScrollToBottomButtonSubtitle;
  final Widget? showScrollToBottomButtonTitle;
  final Widget? showSelectedBorderSubtitle;
  final Widget? showSelectedBorderTitle;
  final Widget? showSelectedMaskSubtitle;
  final Widget? showSelectedMaskTitle;
  final Widget? showSelectedPhotoPreviewSubtitle;
  final Widget? showSelectedPhotoPreviewTitle;
  final Widget? showStatusBarInPreviewInterfaceSubtitle;
  final Widget? showStatusBarInPreviewInterfaceTitle;
  final Widget? sortAscendingSubtitle;
  final Widget? sortAscendingTitle;
  final Widget? styleSubtitle;
  final Widget? styleTitle;
  final Widget? themeColorSubtitle;
  final InputDecoration? themeColorDecoration;
  final Widget? timeoutSubtitle;
  final Widget? timeoutTitle;

  @override
  // ignore: avoid-high-cyclomatic-complexity, very rich UI configuration.
  Widget build(BuildContext context) => ValueListenableBuilder<UiConfiguration>(
        builder: (_, config, __) => ListView(
          children: [
            if (adjustSliderTypeSubtitle != null &&
                adjustSliderTypeTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.adjustSliderType,
                  onSelected: (adjustSliderType) => updateConfig =
                      config.copyWith(adjustSliderType: adjustSliderType),
                  values: AdjustSliderType.values,
                ),
                subtitle: adjustSliderTypeSubtitle,
                title: adjustSliderTypeTitle,
                trailing: Text(config.adjustSliderType.name.toUpperCase()),
              ),
            if (animateSelectButtonWhenSelectInPreviewSubtitle != null &&
                animateSelectButtonWhenSelectInPreviewTitle != null)
              SwitchListTile(
                onChanged: (animateSelectButtonWhenSelectInPreview) =>
                    updateConfig = config.copyWith(
                  animateSelectButtonWhenSelectInPreview:
                      animateSelectButtonWhenSelectInPreview,
                ),
                subtitle: animateSelectButtonWhenSelectInPreviewSubtitle,
                title: animateSelectButtonWhenSelectInPreviewTitle,
                value: config.animateSelectButtonWhenSelectInPreview,
              ),
            if (animateSelectButtonWhenSelectInThumbnailSubtitle != null &&
                animateSelectButtonWhenSelectInThumbnailTitle != null)
              SwitchListTile(
                onChanged: (animateSelectButtonWhenSelectInThumbnail) =>
                    updateConfig = config.copyWith(
                  animateSelectButtonWhenSelectInThumbnail:
                      animateSelectButtonWhenSelectInThumbnail,
                ),
                subtitle: animateSelectButtonWhenSelectInThumbnailSubtitle,
                title: animateSelectButtonWhenSelectInThumbnailTitle,
                value: config.animateSelectButtonWhenSelectInThumbnail,
              ),
            if (cellCornerRadioSubtitle != null &&
                cellCornerRadioDecoration != null)
              ListTile(
                subtitle: cellCornerRadioSubtitle,
                title: TextFormField(
                  decoration: cellCornerRadioDecoration,
                  initialValue: config.cellCornerRadio.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateConfig = config.copyWith(
                    cellCornerRadio: double.tryParse(value) ?? 0,
                  ),
                ),
              ),
            if (columnCountSubtitle != null && columnCountDecoration != null)
              ListTile(
                subtitle: columnCountSubtitle,
                title: TextFormField(
                  decoration: columnCountDecoration,
                  initialValue: config.columnCount.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateConfig =
                      config.copyWith(columnCount: int.tryParse(value) ?? 4),
                ),
              ),
            if (hudStyleSubtitle != null && hudStyleTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.hudStyle,
                  onSelected: (hudStyle) =>
                      updateConfig = config.copyWith(hudStyle: hudStyle),
                  values: HudStyle.values,
                ),
                subtitle: hudStyleSubtitle,
                title: hudStyleTitle,
                trailing: Text(config.hudStyle.name.toUpperCase()),
              ),
            if (isDarkStatusBarStyleSubtitle != null &&
                isDarkStatusBarStyleTitle != null)
              SwitchListTile(
                onChanged: (isDarkStatusBarStyle) => updateConfig =
                    config.copyWith(isDarkStatusBarStyle: isDarkStatusBarStyle),
                subtitle: isDarkStatusBarStyleSubtitle,
                title: isDarkStatusBarStyleTitle,
                value: config.isDarkStatusBarStyle ?? false,
              ),
            if (languageTypeSubtitle != null && languageTypeTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.languageType,
                  onSelected: (languageType) => updateConfig =
                      config.copyWith(languageType: languageType),
                  values: UiLocale.values,
                ),
                subtitle: languageTypeSubtitle,
                title: languageTypeTitle,
                trailing: Text(config.languageType.name.toUpperCase()),
              ),
            if (minimumItemSpacingSubtitle != null &&
                minimumItemSpacingDecoration != null)
              ListTile(
                subtitle: minimumItemSpacingSubtitle,
                title: TextFormField(
                  decoration: minimumItemSpacingDecoration,
                  initialValue: config.minimumItemSpacing.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateConfig = config.copyWith(
                    minimumItemSpacing: double.tryParse(value) ?? 2,
                  ),
                ),
              ),
            if (minimumLineSpacingSubtitle != null &&
                minimumLineSpacingTitle != null)
              ListTile(
                subtitle: minimumLineSpacingSubtitle,
                title: TextFormField(
                  decoration: minimumItemSpacingDecoration,
                  initialValue: config.minimumLineSpacing.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateConfig = config.copyWith(
                    minimumLineSpacing: double.tryParse(value) ?? 2,
                  ),
                ),
              ),
            if (navCancelButtonStyleSubtitle != null &&
                navCancelButtonStyleTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.navCancelButtonStyle,
                  onSelected: (navCancelButtonStyle) => updateConfig = config
                      .copyWith(navCancelButtonStyle: navCancelButtonStyle),
                  values: CancelButtonStyle.values,
                ),
                subtitle: navCancelButtonStyleSubtitle,
                title: navCancelButtonStyleTitle,
                trailing: Text(config.navCancelButtonStyle.name.toUpperCase()),
              ),
            if (selectButtonAnimationDurationSubtitle != null &&
                selectButtonAnimationDurationTitle != null)
              TextStyledListTile(
                onTap: () async => handleDurationPicker(
                  context,
                  config.selectButtonAnimationDuration,
                  onSelected: (selectButtonAnimationDuration) =>
                      updateConfig = config.copyWith(
                    selectButtonAnimationDuration:
                        selectButtonAnimationDuration,
                  ),
                ),
                subtitle: selectButtonAnimationDurationSubtitle,
                title: selectButtonAnimationDurationTitle,
                trailing: Text(
                  config.selectButtonAnimationDuration.inSeconds.toString(),
                ),
              ),
            if (shouldCenterToolsSubtitle != null &&
                shouldCenterToolsTitle != null)
              SwitchListTile(
                onChanged: (shouldCenterTools) => updateConfig =
                    config.copyWith(shouldCenterTools: shouldCenterTools),
                subtitle: shouldCenterToolsSubtitle,
                title: shouldCenterToolsTitle,
                value: config.shouldCenterTools,
              ),
            if (showAddPhotoButtonSubtitle != null &&
                showAddPhotoButtonTitle != null)
              SwitchListTile(
                onChanged: (showAddPhotoButton) => updateConfig =
                    config.copyWith(showAddPhotoButton: showAddPhotoButton),
                subtitle: showAddPhotoButtonSubtitle,
                title: showAddPhotoButtonTitle,
                value: config.showAddPhotoButton,
              ),
            if (showCaptureImageOnTakePhotoButtonSubtitle != null &&
                showCaptureImageOnTakePhotoButtonTitle != null)
              SwitchListTile(
                onChanged: (showCaptureImageOnTakePhotoButton) =>
                    updateConfig = config.copyWith(
                  showCaptureImageOnTakePhotoButton:
                      showCaptureImageOnTakePhotoButton,
                ),
                subtitle: showCaptureImageOnTakePhotoButtonSubtitle,
                title: showCaptureImageOnTakePhotoButtonTitle,
                value: config.showCaptureImageOnTakePhotoButton,
              ),
            if (showEnterSettingTipsSubtitle != null &&
                showEnterSettingTipsTitle != null)
              SwitchListTile(
                onChanged: (showEnterSettingTips) => updateConfig =
                    config.copyWith(showEnterSettingTips: showEnterSettingTips),
                subtitle: showEnterSettingTipsSubtitle,
                title: showEnterSettingTipsTitle,
                value: config.showEnterSettingTips,
              ),
            if (showIndexOnSelectButtonSubtitle != null &&
                showIndexOnSelectButtonTitle != null)
              SwitchListTile(
                onChanged: (showIndexOnSelectButton) => updateConfig = config
                    .copyWith(showIndexOnSelectButton: showIndexOnSelectButton),
                subtitle: showIndexOnSelectButtonSubtitle,
                title: showIndexOnSelectButtonTitle,
                value: config.showIndexOnSelectButton,
              ),
            if (showInvalidMaskSubtitle != null && showInvalidMaskTitle != null)
              SwitchListTile(
                onChanged: (showInvalidMask) => updateConfig =
                    config.copyWith(showInvalidMask: showInvalidMask),
                subtitle: showInvalidMaskSubtitle,
                title: showInvalidMaskTitle,
                value: config.showInvalidMask,
              ),
            if (showScrollToBottomButtonSubtitle != null &&
                showScrollToBottomButtonTitle != null)
              SwitchListTile(
                onChanged: (showScrollToBottomButton) =>
                    updateConfig = config.copyWith(
                  showScrollToBottomButton: showScrollToBottomButton,
                ),
                subtitle: showScrollToBottomButtonSubtitle,
                title: showScrollToBottomButtonTitle,
                value: config.showScrollToBottomButton,
              ),
            if (showSelectedBorderSubtitle != null &&
                showSelectedBorderTitle != null)
              SwitchListTile(
                onChanged: (showSelectedBorder) => updateConfig =
                    config.copyWith(showSelectedBorder: showSelectedBorder),
                subtitle: showSelectedBorderSubtitle,
                title: showSelectedBorderTitle,
                value: config.showSelectedBorder,
              ),
            if (showSelectedMaskSubtitle != null &&
                showSelectedMaskTitle != null)
              SwitchListTile(
                onChanged: (showSelectedMask) => updateConfig =
                    config.copyWith(showSelectedMask: showSelectedMask),
                subtitle: showSelectedMaskSubtitle,
                title: showSelectedMaskTitle,
                value: config.showSelectedMask,
              ),
            if (showSelectedPhotoPreviewSubtitle != null &&
                showSelectedPhotoPreviewTitle != null)
              SwitchListTile(
                onChanged: (showSelectedPhotoPreview) =>
                    updateConfig = config.copyWith(
                  showSelectedPhotoPreview: showSelectedPhotoPreview,
                ),
                subtitle: showSelectedPhotoPreviewSubtitle,
                title: showSelectedPhotoPreviewTitle,
                value: config.showSelectedPhotoPreview,
              ),
            if (showStatusBarInPreviewInterfaceSubtitle != null &&
                showStatusBarInPreviewInterfaceTitle != null)
              SwitchListTile(
                onChanged: (showStatusBarInPreviewInterface) =>
                    updateConfig = config.copyWith(
                  showStatusBarInPreviewInterface:
                      showStatusBarInPreviewInterface,
                ),
                subtitle: showStatusBarInPreviewInterfaceSubtitle,
                title: showStatusBarInPreviewInterfaceTitle,
                value: config.showStatusBarInPreviewInterface,
              ),
            if (sortAscendingSubtitle != null && sortAscendingTitle != null)
              SwitchListTile(
                onChanged: (sortAscending) => updateConfig =
                    config.copyWith(sortAscending: sortAscending),
                subtitle: sortAscendingSubtitle,
                title: sortAscendingTitle,
                value: config.sortAscending,
              ),
            if (styleSubtitle != null && styleTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.style,
                  onSelected: (style) =>
                      updateConfig = config.copyWith(style: style),
                  values: PhotoBrowserStyle.values,
                ),
                subtitle: styleSubtitle,
                title: styleTitle,
                trailing: Text(config.style.name.toUpperCase()),
              ),
            if (themeColorSubtitle != null && themeColorDecoration != null)
              ListTile(
                subtitle: themeColorSubtitle,
                title: TextFormField(
                  decoration: themeColorDecoration,
                  initialValue: config.themeColor.rawValue.toRadixString(16),
                  onChanged: (value) => updateConfig = config.copyWith(
                    // ignore: no-magic-number, this is TODO!
                    themeColor: Color(int.parse(value, radix: 16)),
                  ),
                ),
              ),
            if (timeoutSubtitle != null && timeoutTitle != null)
              TextStyledListTile(
                onTap: () async => handleDurationPicker(
                  context,
                  config.timeout,
                  onSelected: (timeout) =>
                      updateConfig = config.copyWith(timeout: timeout),
                ),
                subtitle: timeoutSubtitle,
                title: timeoutTitle,
                trailing: Text(config.timeout.inSeconds.toString()),
              ),
          ],
        ),
        valueListenable: configuration,
      );
}
