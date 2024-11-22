// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class CameraTab extends StatelessWidget {
  const CameraTab(this._config, {super.key});

  final ValueNotifier<CameraConfiguration> _config;

  @override
  Widget build(BuildContext context) => CameraConfigurationListView(
        _config,
        directoryPathDecoration: null,
        directoryPathSubtitle: null,
      );
}
