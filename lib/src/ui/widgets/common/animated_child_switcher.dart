import 'package:flutter/material.dart';

class AnimatedChildSwitcher extends AnimatedSwitcher {
  AnimatedChildSwitcher({
    required bool condition,
    Widget? falseChild,
    Widget? trueChild,
    super.duration = kThemeAnimationDuration,
    super.key,
    super.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    super.reverseDuration,
    super.switchInCurve = Curves.linear,
    super.switchOutCurve = Curves.linear,
    super.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  }) : super(
          child: SizedBox(
            key: ValueKey(condition),
            child: condition ? trueChild : falseChild,
          ),
        );

  AnimatedChildSwitcher.icon({
    required bool condition,
    IconData? falseIcon,
    IconData? trueIcon,
    super.duration = kThemeAnimationDuration,
    super.key,
    super.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    super.reverseDuration,
    super.switchInCurve = Curves.linear,
    super.switchOutCurve = Curves.linear,
    super.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  }) : super(
          child: Icon(
            condition ? trueIcon : falseIcon,
            key: ValueKey(condition),
          ),
        );
}
