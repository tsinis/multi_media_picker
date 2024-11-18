import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<void> showEnumPicker<T extends Enum>(
    T current, {
    required ValueChanged<T> onSelected,
    required List<T> values,
  }) async {
    final selected = await showModalBottomSheet<T>(
      builder: (context) => ListView(
        children: List.unmodifiable(
          values.map(
            (value) => ListTile(
              onTap: () => Navigator.of(context).pop(value),
              title: Text(value.name),
            ),
          ),
        ),
      ),
      context: this,
    );

    if (selected != null && selected != current) onSelected(selected);
  }

  Future<void> showDurationPicker(
    Duration current, {
    required ValueChanged<Duration> onSelected,
  }) async {
    final selected = await showCupertinoModalPopup<Duration>(
      builder: (context) => Container(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        height: 220,
        margin:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        padding: const EdgeInsets.only(top: 6),
        child: SafeArea(
          child: CupertinoTimerPicker(
            initialTimerDuration: current,
            mode: CupertinoTimerPickerMode.ms,
            onTimerDurationChanged: onSelected,
          ),
        ),
      ),
      context: this,
    );

    if (selected != null && selected != current) onSelected(selected);
  }
}
