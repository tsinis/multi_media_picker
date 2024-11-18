// ignore_for_file: prefer-boolean-prefixes

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

import '../../ui/helpers/extensions/build_context_extension.dart';

class CameraTab extends StatelessWidget {
  const CameraTab(this._cameraConfig, {super.key});

  final ValueNotifier<CameraConfiguration> _cameraConfig;

  // ignore: avoid_setters_without_getters, _cameraConfig itself is immutable.
  set _updateConfig(CameraConfiguration value) => _cameraConfig.value = value;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        builder: (newContext, config, _) => ListView(
          children: [
            SwitchListTile(
              onChanged: (allowRecordVideo) => _updateConfig =
                  config.copyWith(allowRecordVideo: allowRecordVideo),
              subtitle: const SelectableText('allowRecordVideo'),
              title: const Text('Allow Record Video'),
              value: config.allowRecordVideo,
            ),
            SwitchListTile(
              onChanged: (allowSwitchCamera) => _updateConfig =
                  config.copyWith(allowSwitchCamera: allowSwitchCamera),
              subtitle: const SelectableText('allowSwitchCamera'),
              title: const Text('Allow Switch Camera'),
              value: config.allowSwitchCamera,
            ),
            SwitchListTile(
              onChanged: (allowTakePhoto) => _updateConfig =
                  config.copyWith(allowTakePhoto: allowTakePhoto),
              subtitle: const SelectableText('allowTakePhoto'),
              title: const Text('Allow Take Photo'),
              value: config.allowTakePhoto,
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showEnumPicker(
                  config.devicePosition,
                  onSelected: (devicePosition) => _updateConfig =
                      config.copyWith(devicePosition: devicePosition),
                  values: DevicePosition.values,
                ),
              ),
              subtitle: const SelectableText('devicePosition'),
              title: const Text('Device Position'),
              trailing: Text(config.devicePosition.name),
            ),
            SwitchListTile(
              onChanged: (enableWideCameras) => _updateConfig =
                  config.copyWith(enableWideCameras: enableWideCameras),
              subtitle: const SelectableText('enableWideCameras'),
              title: const Text('Enable Wide Cameras'),
              value: config.enableWideCameras,
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showEnumPicker(
                  config.exposureMode,
                  onSelected: (exposureMode) => _updateConfig =
                      config.copyWith(exposureMode: exposureMode),
                  values: ExposureMode.values,
                ),
              ),
              subtitle: const SelectableText('exposureMode'),
              title: const Text('Exposure Mode'),
              trailing: Text(config.exposureMode.name),
            ),
            ListTile(
              subtitle: const SelectableText('directoryPath'),
              title: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Directory where media is saved',
                ),
                initialValue: config.directoryPath,
                onChanged: (directoryPath) => _updateConfig =
                    config.copyWith(directoryPath: directoryPath),
              ),
            ),
            ListTile(
              subtitle: const SelectableText('fileName'),
              title: TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Name of the image file'),
                initialValue: config.imageName,
                onChanged: (imageName) =>
                    _updateConfig = config.copyWith(imageName: imageName),
              ),
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showEnumPicker(
                  config.focusMode,
                  onSelected: (focusMode) =>
                      _updateConfig = config.copyWith(focusMode: focusMode),
                  values: FocusMode.values,
                ),
              ),
              subtitle: const SelectableText('focusMode'),
              title: const Text('Focus Mode'),
              trailing: Text(config.focusMode.name),
            ),
            SwitchListTile(
              onChanged: (isFrontVideoMirrored) => _updateConfig =
                  config.copyWith(isFrontVideoMirrored: isFrontVideoMirrored),
              subtitle: const SelectableText('isFrontVideoMirrored'),
              title: const Text('Is Video Mirrored'),
              value: config.isFrontVideoMirrored,
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showDurationPicker(
                  config.maxDuration,
                  onSelected: (maxDuration) =>
                      _updateConfig = config.copyWith(maxDuration: maxDuration),
                ),
              ),
              subtitle: const SelectableText('maxDuration'),
              title: const Text('Maximum video duration in seconds'),
              trailing: Text(config.maxDuration.inSeconds.toString()),
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showDurationPicker(
                  config.minDuration,
                  onSelected: (minDuration) =>
                      _updateConfig = config.copyWith(minDuration: minDuration),
                ),
              ),
              subtitle: const SelectableText('minDuration'),
              title: const Text('Minimum video duration in seconds'),
              trailing: Text(config.minDuration.inSeconds.toString()),
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showEnumPicker(
                  config.sessionPreset,
                  onSelected: (sessionPreset) => _updateConfig =
                      config.copyWith(sessionPreset: sessionPreset),
                  values: CaptureSessionPreset.values,
                ),
              ),
              subtitle: const SelectableText('sessionPreset'),
              title: const Text('Session Preset'),
              trailing: Text(config.sessionPreset.name),
            ),
            SwitchListTile(
              onChanged: (showFlashSwitch) => _updateConfig =
                  config.copyWith(showFlashSwitch: showFlashSwitch),
              subtitle: const SelectableText('showFlashSwitch'),
              title: const Text('Show Flash Switch'),
              value: config.showFlashSwitch,
            ),
            SwitchListTile(
              onChanged: (tapToRecordVideo) => _updateConfig =
                  config.copyWith(tapToRecordVideo: tapToRecordVideo),
              subtitle: const SelectableText('tapToRecordVideo'),
              title: const Text('Tap to Record Video'),
              value: config.tapToRecordVideo,
            ),
            ListTile(
              leadingAndTrailingTextStyle: const TextStyle(),
              onTap: () => unawaited(
                newContext.showEnumPicker(
                  config.videoExportType,
                  onSelected: (videoExportType) => _updateConfig =
                      config.copyWith(videoExportType: videoExportType),
                  values: VideoExportType.values,
                ),
              ),
              subtitle: const SelectableText('videoExportType'),
              title: const Text('Video Export Type'),
              trailing: Text(config.videoExportType.name),
            ),
          ],
        ),
        valueListenable: _cameraConfig,
      );
}
