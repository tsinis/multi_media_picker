import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import '../../ui/helpers/extensions/build_context_extension.dart';

class CameraTab extends StatelessWidget {
  const CameraTab(this._cameraConfig, {super.key});

  final ValueNotifier<CameraConfiguration> _cameraConfig;

  void _updateConfig<T>(CameraConfiguration copyWith) =>
      _cameraConfig.value = copyWith;

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<CameraConfiguration>(
        valueListenable: _cameraConfig,
        builder: (bc, config, _) => ListView(
          children: [
            SwitchListTile(
              title: const Text('Allow Record Video'),
              subtitle: const SelectableText('allowRecordVideo'),
              value: config.allowRecordVideo,
              onChanged: (value) =>
                  _updateConfig(config.copyWith(allowRecordVideo: value)),
            ),
            SwitchListTile(
              title: const Text('Allow Switch Camera'),
              subtitle: const SelectableText('allowSwitchCamera'),
              value: config.allowSwitchCamera,
              onChanged: (value) =>
                  _updateConfig(config.copyWith(allowSwitchCamera: value)),
            ),
            SwitchListTile(
              title: const Text('Allow Take Photo'),
              subtitle: const SelectableText('allowTakePhoto'),
              value: config.allowTakePhoto,
              onChanged: (value) => _updateConfig(
                config.copyWith(allowTakePhoto: value),
              ),
            ),
            ListTile(
              title: const Text('Device Position'),
              subtitle: const SelectableText('devicePosition'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.devicePosition.name),
              onTap: () => bc.showEnumPicker(
                config.devicePosition,
                values: DevicePosition.values,
                onSelected: (value) =>
                    _updateConfig(config.copyWith(devicePosition: value)),
              ),
            ),
            SwitchListTile(
              title: const Text('Enable Wide Cameras'),
              subtitle: const SelectableText('enableWideCameras'),
              value: config.enableWideCameras,
              onChanged: (value) =>
                  _updateConfig(config.copyWith(enableWideCameras: value)),
            ),
            ListTile(
              title: const Text('Exposure Mode'),
              subtitle: const SelectableText('exposureMode'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.exposureMode.name),
              onTap: () => bc.showEnumPicker(
                config.exposureMode,
                values: ExposureMode.values,
                onSelected: (value) => _updateConfig(
                  config.copyWith(exposureMode: value),
                ),
              ),
            ),
            ListTile(
              subtitle: const SelectableText('directoryPath'),
              title: TextFormField(
                initialValue: config.directoryPath,
                decoration:
                    InputDecoration(hintText: 'Directory where media is saved'),
                onChanged: (value) =>
                    _updateConfig(config.copyWith(directoryPath: value)),
              ),
            ),
            ListTile(
              subtitle: const SelectableText('fileName'),
              title: TextFormField(
                initialValue: config.imageName,
                controller: TextEditingController(text: config.imageName),
                decoration: InputDecoration(hintText: 'Name of the image file'),
                onChanged: (value) =>
                    _updateConfig(config.copyWith(imageName: value)),
              ),
            ),
            ListTile(
              title: const Text('Focus Mode'),
              subtitle: const SelectableText('focusMode'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.focusMode.name),
              onTap: () => bc.showEnumPicker(
                config.focusMode,
                values: FocusMode.values,
                onSelected: (value) => _updateConfig(
                  config.copyWith(focusMode: value),
                ),
              ),
            ),
            SwitchListTile(
              title: const Text('Is Video Mirrored'),
              subtitle: const SelectableText('isFrontVideoMirrored'),
              value: config.isFrontVideoMirrored,
              onChanged: (value) => _updateConfig(
                config.copyWith(isFrontVideoMirrored: value),
              ),
            ),
            ListTile(
              title: const Text('Maximum video duration in seconds'),
              subtitle: const SelectableText('maxDuration'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.maxDuration.inSeconds.toString()),
              onTap: () => bc.showDurationPicker(
                config.maxDuration,
                onSelected: (value) => _updateConfig(
                  config.copyWith(maxDuration: value),
                ),
              ),
            ),
            ListTile(
              title: const Text('Minimum video duration in seconds'),
              subtitle: const SelectableText('minDuration'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.minDuration.inSeconds.toString()),
              onTap: () => bc.showDurationPicker(
                config.minDuration,
                onSelected: (value) => _updateConfig(
                  config.copyWith(minDuration: value),
                ),
              ),
            ),
            ListTile(
              title: const Text('Session Preset'),
              subtitle: const SelectableText('sessionPreset'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.sessionPreset.name),
              onTap: () => bc.showEnumPicker(
                config.sessionPreset,
                values: CaptureSessionPreset.values,
                onSelected: (value) => _updateConfig(
                  config.copyWith(sessionPreset: value),
                ),
              ),
            ),
            SwitchListTile(
              title: const Text('Show Flash Switch'),
              subtitle: const SelectableText('showFlashSwitch'),
              value: config.showFlashSwitch,
              onChanged: (value) => _updateConfig(
                config.copyWith(showFlashSwitch: value),
              ),
            ),
            SwitchListTile(
              title: const Text('Tap to Record Video'),
              subtitle: const SelectableText('tapToRecordVideo'),
              value: config.tapToRecordVideo,
              onChanged: (value) =>
                  _updateConfig(config.copyWith(tapToRecordVideo: value)),
            ),
            ListTile(
              title: const Text('Video Export Type'),
              subtitle: const SelectableText('videoExportType'),
              leadingAndTrailingTextStyle: const TextStyle(),
              trailing: Text(config.videoExportType.name),
              onTap: () => bc.showEnumPicker(
                config.videoExportType,
                values: VideoExportType.values,
                onSelected: (value) =>
                    _updateConfig(config.copyWith(videoExportType: value)),
              ),
            ),
          ],
        ),
      );
}
