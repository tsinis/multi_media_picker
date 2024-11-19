import '../../messages.g.dart';
import '../../model/configs/edit_configuration.dart';

extension EditConfigurationExtension on EditConfiguration {
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
