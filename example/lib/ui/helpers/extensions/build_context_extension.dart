import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<void> showEnumPicker<T extends Enum>(
    T current, {
    required List<T> values,
    required ValueChanged<T> onSelected,
  }) async {
    final selected = await showModalBottomSheet<T>(
      context: this,
      builder: (context) => ListView(
        children: List.unmodifiable(
          values.map(
            (value) => ListTile(
              title: Text(value.name),
              onTap: () => Navigator.of(context).pop(value),
            ),
          ),
        ),
      ),
    );

    if (selected != null && selected != current) onSelected(selected);
  }

  Future<void> showDurationPicker(
    Duration current, {
    required ValueChanged<Duration> onSelected,
  }) async {
    final selected = await showCupertinoModalPopup<Duration>(
      context: this,
      builder: (context) => Container(
        height: 220,
        padding: const EdgeInsets.only(top: 6),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          child: CupertinoTimerPicker(
            initialTimerDuration: current,
            mode: CupertinoTimerPickerMode.ms,
            onTimerDurationChanged: onSelected,
          ),
        ),
      ),
    );

    if (selected != null && selected != current) onSelected(selected);
  }
}
