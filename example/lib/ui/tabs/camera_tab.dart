// ignore_for_file: prefer-boolean-prefixes

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class CameraTab extends StatelessWidget {
  const CameraTab(this._config, {super.key});

  static const _defaultOverlay = OverlayImage(
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
                allowRecordVideo: showOverlay ? false : null,
                overlayImage:
                    showOverlay ? _defaultOverlay : OverlayImage.empty,
              ),
            ),
            secondary: AnimatedChildSwitcher.icon(
              condition: currentConfig.hasOverlay,
              falseIcon: Icons.grid_off_outlined,
              trueIcon: Icons.grid_on_outlined,
            ),
            subtitle: const Text('When taking a photo'),
            title: const Text('Show overlay image'),
            value: currentConfig.hasOverlay,
          ),
        ],
      );
}
