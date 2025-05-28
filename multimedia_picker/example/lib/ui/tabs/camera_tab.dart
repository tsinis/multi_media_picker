// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/material.dart';
import 'package:multimedia_picker/multimedia_picker.dart';

class CameraTab extends StatelessWidget {
  const CameraTab(this._config, {super.key});

  static const defaultOverlay = OverlayImage(
    'assets/grid.gif',
    isAsset: true,
    opacity: 1 / 2,
    tintColor: Colors.white,
  );

  final ValueNotifier<CameraConfiguration> _config;

  @override
  Widget build(BuildContext context) => CameraConfigurationListView(
    _config,
    leadingBuilder: (_, currentConfig, onUpdate) => [
      SwitchListTile(
        onChanged: (showOverlay) => onUpdate(
          currentConfig.copyWith(
            overlayImage: showOverlay ? defaultOverlay : OverlayImage.empty,
          ),
        ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.hasOverlay,
          falseIcon: Icons.grid_off_outlined,
          trueIcon: Icons.grid_on_outlined,
        ),
        subtitle: const Text('On top of the camera view'),
        title: const Text('Show overlay image'),
        value: currentConfig.hasOverlay,
      ),
    ],
  );
}
