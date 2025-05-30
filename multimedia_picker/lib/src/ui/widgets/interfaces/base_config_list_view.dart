// ignore_for_file: prefer-boolean-prefixes, prefer-typedefs-for-callbacks

import 'dart:async';

import 'package:flutter/material.dart';

import '../../../helpers/extensions/model/public/picker_build_context_extension.dart';

abstract class BaseConfigListView<T extends Object> extends StatelessWidget {
  const BaseConfigListView(
    this.configuration, {
    this.leadingBuilder,
    Future<Duration> Function(Duration current)? onShowDurationPicker,
    Future<E?> Function<E extends Enum>(E? current, List<E> values)?
    onShowEnumPicker,
    this.trailingBuilder,
    super.key,
  }) : _onShowEnumPicker = onShowEnumPicker,
       _onShowDurationPicker = onShowDurationPicker;

  @protected
  final ValueNotifier<T> configuration;
  final Future<Duration?> Function(Duration current)? _onShowDurationPicker;
  final Future<E?> Function<E extends Enum>(E? current, List<E> values)?
  _onShowEnumPicker;

  @protected
  Future<void> handleShowEnumPicker<E extends Enum>(
    BuildContext context,
    E? current, {
    required ValueChanged<E> onSelected,
    required List<E> values,
  }) async {
    final picker = _onShowEnumPicker ?? context.showEnumPicker;
    final result = await picker(current, values);
    if (result != null && result != current) onSelected(result);
  }

  @protected
  Future<void> handleDurationPicker(
    BuildContext context,
    Duration current, {
    required ValueChanged<Duration> onSelected,
  }) async {
    final picker = _onShowDurationPicker ?? context.showCupertinoDurationPicker;
    final result = await picker(current);
    if (result != null && result != current) onSelected(result);
  }

  @protected
  // ignore: avoid_setters_without_getters, [configuration] itself is immutable.
  set updateConfig(T value) => configuration.value = value;

  final List<Widget?>? Function(
    BuildContext context,
    T currentConfig,
    ValueSetter<T> onUpdate,
  )?
  leadingBuilder;

  final List<Widget?>? Function(
    BuildContext context,
    T currentConfig,
    ValueSetter<T> onUpdate,
  )?
  trailingBuilder;

  @protected
  List<Widget?>? childrenBuilder(BuildContext context, T currentConfig);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<T>(
    builder: (newContext, config, _) => ListView(
      children: List.unmodifiable(
        [
          ...?leadingBuilder?.call(
            newContext,
            config,
            (updatedConfig) => updateConfig = updatedConfig,
          ),
          ...?childrenBuilder(newContext, config),
          ...?trailingBuilder?.call(
            newContext,
            config,
            (updatedConfig) => updateConfig = updatedConfig,
          ),
        ].nonNulls,
      ),
    ),
    valueListenable: configuration,
  );
}
