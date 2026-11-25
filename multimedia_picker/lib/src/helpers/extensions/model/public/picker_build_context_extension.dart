import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

extension PickerBuildContextExtension on BuildContext {
  /// Asks for a whole number of seconds, returns `null` if dismissed or
  /// unchanged.
  Future<Duration?> showDurationPicker(Duration current) async {
    String input = current.inSeconds.toString();
    final seconds = await showDialog<int>(
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(int.tryParse(input)),
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
        content: TextFormField(
          autofocus: true,
          decoration: const InputDecoration(suffixText: 's'),
          initialValue: input,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          onChanged: (text) => input = text,
          onFieldSubmitted: (text) =>
              Navigator.of(context).pop(int.tryParse(text)),
        ),
      ),
      context: this,
    );

    return seconds == null || seconds == current.inSeconds
        ? null
        : Duration(seconds: seconds);
  }

  Future<E?> showEnumPicker<E extends Enum>(E? current, List<E> values) =>
      showModalBottomSheet(
        builder: (context) => ListView.separated(
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
