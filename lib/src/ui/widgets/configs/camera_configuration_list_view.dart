// ignore_for_file: prefer-boolean-prefixes, prefer-typedefs-for-callbacks

import 'package:flutter/material.dart';

import '../../../messages.g.dart';
import '../../../model/configs/camera_configuration.dart';
import '../interfaces/base_config_list_view.dart';
import '../tiles/text_styled_list_tile.dart';

class CameraConfigurationListView
    extends BaseConfigListView<CameraConfiguration> {
  const CameraConfigurationListView(
    super.configuration, {
    this.allowRecordVideoSubtitle = const SelectableText('allowRecordVideo'),
    this.allowRecordVideoTitle = const Text('Allow Record Video'),
    this.allowSwitchCameraSubtitle = const SelectableText('allowSwitchCamera'),
    this.allowSwitchCameraTitle = const Text('Allow Switch Camera'),
    this.allowTakePhotoSubtitle = const SelectableText('allowTakePhoto'),
    this.allowTakePhotoTitle = const Text('Allow Take Photo'),
    this.devicePositionSubtitle = const SelectableText('devicePosition'),
    this.devicePositionTitle = const Text('Device Position'),
    this.directoryPathDecoration =
        const InputDecoration(hintText: 'Directory where media is saved'),
    this.directoryPathSubtitle = const SelectableText('directoryPath'),
    this.enableWideCamerasSubtitle = const SelectableText('enableWideCameras'),
    this.enableWideCamerasTitle = const Text('Enable Wide Cameras'),
    this.exposureModeSubtitle = const SelectableText('exposureMode'),
    this.exposureModeTitle = const Text('Exposure Mode'),
    this.fileNameDecoration =
        const InputDecoration(hintText: 'Name of the image file'),
    this.fileNameSubtitle = const SelectableText('fileName'),
    this.focusModeSubtitle = const SelectableText('focusMode'),
    this.focusModeTitle = const Text('Focus Mode'),
    this.isFrontVideoMirroredSubtitle =
        const SelectableText('isFrontVideoMirrored'),
    this.isFrontVideoMirroredTitle = const Text('Is Front Video Mirrored'),
    this.maxDurationSubtitle = const SelectableText('maxDuration'),
    this.maxDurationTitle = const Text('Maximum video duration in seconds'),
    this.minDurationSubtitle = const SelectableText('minDuration'),
    this.minDurationTitle = const Text('Minimum video duration in seconds'),
    this.sessionPresetSubtitle = const SelectableText('sessionPreset'),
    this.sessionPresetTitle = const Text('Session Preset'),
    this.showFlashSwitchSubtitle = const SelectableText('showFlashSwitch'),
    this.showFlashSwitchTitle = const Text('Show Flash Switch'),
    this.tapToRecordVideoSubtitle = const SelectableText('tapToRecordVideo'),
    this.tapToRecordVideoTitle = const Text('Tap to Record Video'),
    this.thumbnailWidthDecoration =
        const InputDecoration(hintText: 'Thumbnail Width'),
    this.thumbnailWidthSubtitle = const SelectableText('thumbnailWidth'),
    this.videoExportTypeSubtitle = const SelectableText('videoExportType'),
    this.videoExportTypeTitle = const Text('Video Export Type'),
    this.videoStabilizationSubtitle =
        const SelectableText('videoStabilization'),
    this.videoStabilizationTitle = const Text('Video Stabilization Mode'),
    super.key,
    super.onShowDurationPicker,
    super.onShowEnumPicker,
  });

  final Widget? allowRecordVideoSubtitle;
  final Widget? allowRecordVideoTitle;
  final Widget? allowSwitchCameraSubtitle;
  final Widget? allowSwitchCameraTitle;
  final Widget? allowTakePhotoSubtitle;
  final Widget? allowTakePhotoTitle;
  final Widget? devicePositionSubtitle;
  final Widget? devicePositionTitle;
  final Widget? enableWideCamerasSubtitle;
  final Widget? enableWideCamerasTitle;
  final Widget? exposureModeSubtitle;
  final Widget? exposureModeTitle;
  final InputDecoration? directoryPathDecoration;
  final Widget? directoryPathSubtitle;
  final InputDecoration? fileNameDecoration;
  final Widget? fileNameSubtitle;
  final Widget? focusModeSubtitle;
  final Widget? focusModeTitle;
  final Widget? isFrontVideoMirroredSubtitle;
  final Widget? isFrontVideoMirroredTitle;
  final Widget? maxDurationSubtitle;
  final Widget? maxDurationTitle;
  final Widget? minDurationSubtitle;
  final Widget? minDurationTitle;
  final Widget? sessionPresetSubtitle;
  final Widget? sessionPresetTitle;
  final Widget? showFlashSwitchSubtitle;
  final Widget? showFlashSwitchTitle;
  final Widget? tapToRecordVideoSubtitle;
  final Widget? tapToRecordVideoTitle;
  final Widget? thumbnailWidthSubtitle;
  final InputDecoration? thumbnailWidthDecoration;
  final Widget? videoExportTypeSubtitle;
  final Widget? videoExportTypeTitle;
  final Widget? videoStabilizationSubtitle;
  final Widget? videoStabilizationTitle;

  @override
  // ignore: avoid-high-cyclomatic-complexity, a lot of configuration options.
  Widget build(BuildContext context) =>
      ValueListenableBuilder<CameraConfiguration>(
        builder: (_, config, __) => ListView(
          children: [
            if (allowRecordVideoSubtitle != null &&
                allowRecordVideoTitle != null)
              SwitchListTile(
                onChanged: (allowRecordVideo) => updateConfig = config.copyWith(
                  allowRecordVideo: allowRecordVideo,
                  allowTakePhoto: !allowRecordVideo && !config.allowTakePhoto
                      ? !allowRecordVideo && !config.allowTakePhoto
                      : config.allowTakePhoto,
                ),
                subtitle: allowRecordVideoSubtitle,
                title: allowRecordVideoTitle,
                value: config.allowRecordVideo,
              ),
            if (allowSwitchCameraSubtitle != null &&
                allowSwitchCameraTitle != null)
              SwitchListTile(
                onChanged: (allowSwitchCamera) => updateConfig =
                    config.copyWith(allowSwitchCamera: allowSwitchCamera),
                subtitle: allowSwitchCameraSubtitle,
                title: allowSwitchCameraTitle,
                value: config.allowSwitchCamera,
              ),
            if (allowTakePhotoSubtitle != null && allowTakePhotoTitle != null)
              SwitchListTile(
                onChanged: (allowTakePhoto) => updateConfig = config.copyWith(
                  allowRecordVideo: !allowTakePhoto && !config.allowRecordVideo
                      ? !allowTakePhoto && !config.allowRecordVideo
                      : config.allowRecordVideo,
                  allowTakePhoto: allowTakePhoto,
                ),
                subtitle: allowTakePhotoSubtitle,
                title: allowTakePhotoTitle,
                value: config.allowTakePhoto,
              ),
            if (devicePositionSubtitle != null && devicePositionTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.devicePosition,
                  onSelected: (devicePosition) => updateConfig =
                      config.copyWith(devicePosition: devicePosition),
                  values: DevicePosition.values,
                ),
                subtitle: devicePositionSubtitle,
                title: devicePositionTitle,
                trailing: Text(config.devicePosition.name.toUpperCase()),
              ),
            if (enableWideCamerasSubtitle != null &&
                enableWideCamerasTitle != null)
              SwitchListTile(
                onChanged: (enableWideCameras) => updateConfig =
                    config.copyWith(enableWideCameras: enableWideCameras),
                subtitle: enableWideCamerasSubtitle,
                title: enableWideCamerasTitle,
                value: config.enableWideCameras,
              ),
            if (exposureModeSubtitle != null && exposureModeTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.exposureMode,
                  onSelected: (exposureMode) => updateConfig =
                      config.copyWith(exposureMode: exposureMode),
                  values: ExposureMode.values,
                ),
                subtitle: exposureModeSubtitle,
                title: exposureModeTitle,
                trailing: Text(config.exposureMode.name.toUpperCase()),
              ),
            if (showFlashSwitchSubtitle != null && showFlashSwitchTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.focusMode,
                  onSelected: (focusMode) =>
                      updateConfig = config.copyWith(focusMode: focusMode),
                  values: FocusMode.values,
                ),
                subtitle: focusModeSubtitle,
                title: focusModeTitle,
                trailing: Text(config.focusMode.name.toUpperCase()),
              ),
            if (isFrontVideoMirroredSubtitle != null &&
                isFrontVideoMirroredTitle != null)
              SwitchListTile(
                onChanged: (isFrontVideoMirrored) => updateConfig =
                    config.copyWith(isFrontVideoMirrored: isFrontVideoMirrored),
                subtitle: isFrontVideoMirroredSubtitle,
                title: isFrontVideoMirroredTitle,
                value: config.isFrontVideoMirrored,
              ),
            if (maxDurationTitle != null && maxDurationSubtitle != null)
              TextStyledListTile(
                onTap: () async => handleDurationPicker(
                  context,
                  config.maxDuration,
                  onSelected: (maxDuration) =>
                      updateConfig = config.copyWith(maxDuration: maxDuration),
                ),
                subtitle: maxDurationSubtitle,
                title: maxDurationTitle,
                trailing: Text(config.maxDuration.inSeconds.toString()),
              ),
            if (minDurationTitle != null && minDurationSubtitle != null)
              TextStyledListTile(
                onTap: () async => handleDurationPicker(
                  context,
                  config.minDuration,
                  onSelected: (minDuration) =>
                      updateConfig = config.copyWith(minDuration: minDuration),
                ),
                subtitle: minDurationSubtitle,
                title: minDurationTitle,
                trailing: Text(config.minDuration.inSeconds.toString()),
              ),
            if (sessionPresetSubtitle != null && sessionPresetTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.sessionPreset,
                  onSelected: (sessionPreset) => updateConfig =
                      config.copyWith(sessionPreset: sessionPreset),
                  values: CaptureSessionPreset.values,
                ),
                subtitle: sessionPresetSubtitle,
                title: sessionPresetTitle,
                trailing: Text(config.sessionPreset.name.toUpperCase()),
              ),
            if (showFlashSwitchSubtitle != null && showFlashSwitchTitle != null)
              SwitchListTile(
                onChanged: (showFlashSwitch) => updateConfig =
                    config.copyWith(showFlashSwitch: showFlashSwitch),
                subtitle: showFlashSwitchSubtitle,
                title: showFlashSwitchTitle,
                value: config.showFlashSwitch,
              ),
            if (tapToRecordVideoSubtitle != null &&
                tapToRecordVideoTitle != null)
              SwitchListTile(
                onChanged: (tapToRecordVideo) => updateConfig =
                    config.copyWith(tapToRecordVideo: tapToRecordVideo),
                subtitle: tapToRecordVideoSubtitle,
                title: tapToRecordVideoTitle,
                value: config.tapToRecordVideo,
              ),
            if (thumbnailWidthSubtitle != null &&
                thumbnailWidthDecoration != null)
              ListTile(
                subtitle: thumbnailWidthSubtitle,
                title: TextFormField(
                  decoration: thumbnailWidthDecoration,
                  initialValue: config.thumbnailWidth.toString(),
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  onChanged: (value) => updateConfig = config.copyWith(
                    thumbnailWidth: int.tryParse(value),
                  ),
                ),
              ),
            if (videoExportTypeSubtitle != null && videoExportTypeTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.videoExportType,
                  onSelected: (videoExportType) => updateConfig =
                      config.copyWith(videoExportType: videoExportType),
                  values: VideoExportType.values,
                ),
                subtitle: videoExportTypeSubtitle,
                title: videoExportTypeTitle,
                trailing: Text(config.videoExportType.name.toUpperCase()),
              ),
            if (videoStabilizationSubtitle != null &&
                videoStabilizationTitle != null)
              TextStyledListTile(
                onTap: () async => handleShowEnumPicker(
                  context,
                  config.videoStabilization,
                  onSelected: (videoStabilization) => updateConfig =
                      config.copyWith(videoStabilization: videoStabilization),
                  values: VideoStabilization.values,
                ),
                subtitle: videoStabilizationSubtitle,
                title: videoStabilizationTitle,
                trailing: Text(
                  config.videoStabilization?.name.toUpperCase() ?? 'AUTO',
                ),
              ),
          ],
        ),
        valueListenable: configuration,
      );
}
