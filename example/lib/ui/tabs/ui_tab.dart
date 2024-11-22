// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class UiTab extends StatelessWidget {
  const UiTab(this._config, {super.key});

  final ValueNotifier<UiConfiguration> _config;

  @override
  Widget build(BuildContext context) => UiConfigurationListView(
        _config,
        themeColorDecoration: null,
        themeColorSubtitle: null,
      );
}
