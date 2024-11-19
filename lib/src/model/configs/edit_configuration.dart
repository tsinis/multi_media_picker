// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/foundation.dart';

import '../../messages.g.dart';

@immutable
class EditConfiguration {
  const EditConfiguration({
    this.adjustTools = const {},
    this.clipOptions,
    this.dimClippedAreaDuringAdjustments = false,
    this.impactFeedbackStyle = ImpactFeedbackStyle.medium,
    this.impactFeedbackWhenAdjustSliderValueIsZero = true,
    this.minimumZoomScale = 1.0,
    this.showClipDirectlyIfOnlyHasClipTool = false,
    this.tools = const {},
  });

  /// Edit image tools. Provides all the tools if empty.
  /// Default order `draw`, `clip`, `textSticker`, `mosaic`, `filter`, `adjust`.
  final Set<EditTool> tools;

  /// Edit clip type and ratio for the editor.
  final ClipOptions? clipOptions;

  /// Adjust image tools.  Provides all the tools if empty.
  /// Default order: `brightness`, `contrast`, `saturation`.
  final Set<AdjustTool> adjustTools;

  /// If image edit tools only have clip and this property is `true`,
  /// the clipping interface will be displayed directly. Defaults to `false`.
  final bool showClipDirectlyIfOnlyHasClipTool;

  /// Give an impact feedback when the adjust slider value is zero.
  /// Defaults to `true`.
  final bool impactFeedbackWhenAdjustSliderValueIsZero;

  /// Impact feedback style. Defaults to `medium`.
  final ImpactFeedbackStyle impactFeedbackStyle;

  /// Whether to keep the clipped area dimmed during adjustments.
  /// Defaults to `false`.
  final bool dimClippedAreaDuringAdjustments;

  /// Minimum zoom scale, allowing the user to make the edited photo smaller,
  /// so it does not overlap top and bottom tools menu. Defaults to `1.0`.
  final double minimumZoomScale;

  EditConfiguration copyWith({
    Set<AdjustTool>? adjustTools,
    ClipOptions? clipOptions,
    bool? dimClippedAreaDuringAdjustments,
    ImpactFeedbackStyle? impactFeedbackStyle,
    bool? impactFeedbackWhenAdjustSliderValueIsZero,
    double? minimumZoomScale,
    bool? showClipDirectlyIfOnlyHasClipTool,
    Set<EditTool>? tools,
  }) =>
      EditConfiguration(
        adjustTools: adjustTools ?? this.adjustTools,
        clipOptions: clipOptions ?? this.clipOptions,
        dimClippedAreaDuringAdjustments: dimClippedAreaDuringAdjustments ??
            this.dimClippedAreaDuringAdjustments,
        impactFeedbackStyle: impactFeedbackStyle ?? this.impactFeedbackStyle,
        impactFeedbackWhenAdjustSliderValueIsZero:
            impactFeedbackWhenAdjustSliderValueIsZero ??
                this.impactFeedbackWhenAdjustSliderValueIsZero,
        minimumZoomScale: minimumZoomScale ?? this.minimumZoomScale,
        showClipDirectlyIfOnlyHasClipTool: showClipDirectlyIfOnlyHasClipTool ??
            this.showClipDirectlyIfOnlyHasClipTool,
        tools: tools ?? this.tools,
      );

  @override
  String toString() => 'EditConfiguration(tools: $tools, '
      '${clipOptions == null ? '' : 'clipOptions: $clipOptions, '}'
      'adjustTools: $adjustTools, '
      'showClipDirectlyIfOnlyHasClipTool: $showClipDirectlyIfOnlyHasClipTool, '
      '''impactFeedbackWhenAdjustSliderValueIsZero: $impactFeedbackWhenAdjustSliderValueIsZero, '''
      'impactFeedbackStyle: $impactFeedbackStyle, '
      'dimClippedAreaDuringAdjustments: $dimClippedAreaDuringAdjustments, '
      'minimumZoomScale: $minimumZoomScale)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditConfiguration &&
        setEquals(other.tools, tools) &&
        other.clipOptions == clipOptions &&
        setEquals(other.adjustTools, adjustTools) &&
        other.showClipDirectlyIfOnlyHasClipTool ==
            showClipDirectlyIfOnlyHasClipTool &&
        other.impactFeedbackWhenAdjustSliderValueIsZero ==
            impactFeedbackWhenAdjustSliderValueIsZero &&
        other.impactFeedbackStyle == impactFeedbackStyle &&
        other.dimClippedAreaDuringAdjustments ==
            dimClippedAreaDuringAdjustments &&
        other.minimumZoomScale == minimumZoomScale;
  }

  @override
  int get hashCode =>
      tools.hashCode ^
      clipOptions.hashCode ^
      adjustTools.hashCode ^
      showClipDirectlyIfOnlyHasClipTool.hashCode ^
      impactFeedbackWhenAdjustSliderValueIsZero.hashCode ^
      impactFeedbackStyle.hashCode ^
      dimClippedAreaDuringAdjustments.hashCode ^
      minimumZoomScale.hashCode;
}
