// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';
import '../../../../model/configs/edit_configuration.dart';

extension EditConfigurationExtensionInternal on EditConfiguration {
  RawEditConfiguration get raw => RawEditConfiguration(
    adjustTools: adjustTools.toList(growable: false),
    clipOptions: clipOptions,
    dimClippedAreaDuringAdjustments: dimClippedAreaDuringAdjustments,
    impactFeedbackStyle: impactFeedbackStyle,
    impactFeedbackWhenAdjustSliderValueIsZero:
        impactFeedbackWhenAdjustSliderValueIsZero,
    minimumZoomScale: minimumZoomScale,
    showClipDirectlyIfOnlyHasClipTool: showClipDirectlyIfOnlyHasClipTool,
    tools: tools.toList(growable: false),
  );
}
