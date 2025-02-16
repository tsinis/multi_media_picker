import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension PickerBuildContextExtension on BuildContext {
  Future<Duration?> showCupertinoDurationPicker(Duration current) async {
    Duration? selected;
    final poppedDuration = await showCupertinoModalPopup<Duration>(
      builder:
          (context) => Container(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            height: 220,
            margin: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            padding: const EdgeInsets.only(top: 6),
            child: SafeArea(
              child: CupertinoTimerPicker(
                initialTimerDuration: current,
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (newDuration) => selected = newDuration,
              ),
            ),
          ),
      context: this,
    );

    if (poppedDuration != null) return selected = poppedDuration;

    return selected == current ? null : selected;
  }

  Future<E?> showEnumPicker<E extends Enum>(E? current, List<E> values) =>
      showModalBottomSheet(
        builder:
            (context) => ListView.separated(
              itemBuilder: (_, index) {
                final value = values[index];

                return ListTile(
                  onTap: () => Navigator.of(context).pop(value),
                  title: Text(value.name.toUpperCase()),
                  trailing: current == value ? const Icon(Icons.check) : null,
                );
              },
              itemCount: values.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
            ),
        context: this,
      );
}
