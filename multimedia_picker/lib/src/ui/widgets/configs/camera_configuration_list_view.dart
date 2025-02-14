// ignore_for_file: prefer-boolean-prefixes, prefer-typedefs-for-callbacks

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../../helpers/extensions/model/public/device_position_extension.dart';
import '../../../model/configs/camera_configuration.dart';
import '../common/animated_child_switcher.dart';
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
    this.enableWideCamerasSubtitle = const SelectableText('enableWideCameras'),
    this.enableWideCamerasTitle = const Text('Enable Wide Cameras'),
    this.exposureModeSubtitle = const SelectableText('exposureMode'),
    this.exposureModeTitle = const Text('Exposure Mode'),
    this.focusModeSubtitle = const SelectableText('focusMode'),
    this.focusModeTitle = const Text('Focus Mode'),
    this.isFrontVideoMirroredSubtitle = const SelectableText(
      'isFrontVideoMirrored',
    ),
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
    this.thumbnailWidthDecoration = const InputDecoration(
      hintText: 'Thumbnail Width',
    ),
    this.thumbnailWidthSubtitle = const SelectableText('thumbnailWidth'),
    this.videoExportTypeSubtitle = const SelectableText('videoExportType'),
    this.videoExportTypeTitle = const Text('Video Export Type'),
    this.videoStabilizationSubtitle = const SelectableText(
      'videoStabilization',
    ),
    this.videoStabilizationTitle = const Text('Video Stabilization Mode'),
    super.key,
    super.leadingBuilder,
    super.onShowDurationPicker,
    super.onShowEnumPicker,
    super.trailingBuilder,
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
  List<Widget> childrenBuilder(
    BuildContext context,
    CameraConfiguration currentConfig,
  ) => [
    if (allowRecordVideoSubtitle != null && allowRecordVideoTitle != null)
      SwitchListTile(
        onChanged:
            (allowRecordVideo) =>
                updateConfig = currentConfig.copyWith(
                  allowRecordVideo: allowRecordVideo,
                  allowTakePhoto:
                      !allowRecordVideo && !currentConfig.allowTakePhoto
                          ? !allowRecordVideo && !currentConfig.allowTakePhoto
                          : currentConfig.allowTakePhoto,
                ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.allowRecordVideo,
          falseIcon: Icons.videocam_off_outlined,
          trueIcon: Icons.videocam_outlined,
        ),
        subtitle: allowRecordVideoSubtitle,
        title: allowRecordVideoTitle,
        value: currentConfig.allowRecordVideo,
      ),
    if (allowSwitchCameraSubtitle != null && allowSwitchCameraTitle != null)
      SwitchListTile(
        onChanged:
            (allowSwitchCamera) =>
                updateConfig = currentConfig.copyWith(
                  allowSwitchCamera: allowSwitchCamera,
                ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.allowSwitchCamera,
          falseIcon: Icons.sync_disabled_rounded,
          trueIcon: Icons.sync_rounded,
        ),
        subtitle: allowSwitchCameraSubtitle,
        title: allowSwitchCameraTitle,
        value: currentConfig.allowSwitchCamera,
      ),
    if (allowTakePhotoSubtitle != null && allowTakePhotoTitle != null)
      SwitchListTile(
        onChanged:
            (allowTakePhoto) =>
                updateConfig = currentConfig.copyWith(
                  allowRecordVideo:
                      !allowTakePhoto && !currentConfig.allowRecordVideo
                          ? !allowTakePhoto && !currentConfig.allowRecordVideo
                          : currentConfig.allowRecordVideo,
                  allowTakePhoto: allowTakePhoto,
                ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.allowTakePhoto,
          falseIcon: Icons.no_photography_outlined,
          trueIcon: Icons.camera_enhance_outlined,
        ),
        subtitle: allowTakePhotoSubtitle,
        title: allowTakePhotoTitle,
        value: currentConfig.allowTakePhoto,
      ),
    if (devicePositionSubtitle != null && devicePositionTitle != null)
      TextStyledListTile(
        leading: AnimatedChildSwitcher.icon(
          condition: currentConfig.devicePosition.isFront,
          falseIcon: Icons.camera_rear_outlined,
          trueIcon: Icons.camera_front_outlined,
        ),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.devicePosition,
              onSelected:
                  (devicePosition) =>
                      updateConfig = currentConfig.copyWith(
                        devicePosition: devicePosition,
                      ),
              values: DevicePosition.values,
            ),
        subtitle: devicePositionSubtitle,
        title: devicePositionTitle,
        trailing: Text(currentConfig.devicePosition.name.toUpperCase()),
      ),
    if (enableWideCamerasSubtitle != null && enableWideCamerasTitle != null)
      SwitchListTile(
        onChanged:
            (enableWideCameras) =>
                updateConfig = currentConfig.copyWith(
                  enableWideCameras: enableWideCameras,
                ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.enableWideCameras,
          falseIcon: Icons.image_outlined,
          trueIcon: Icons.panorama_outlined,
        ),
        subtitle: enableWideCamerasSubtitle,
        title: enableWideCamerasTitle,
        value: currentConfig.enableWideCameras,
      ),
    if (exposureModeSubtitle != null && exposureModeTitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.exposure_outlined),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.exposureMode,
              onSelected:
                  (exposureMode) =>
                      updateConfig = currentConfig.copyWith(
                        exposureMode: exposureMode,
                      ),
              values: ExposureMode.values,
            ),
        subtitle: exposureModeSubtitle,
        title: exposureModeTitle,
        trailing: Text(currentConfig.exposureMode.name.toUpperCase()),
      ),
    if (focusModeSubtitle != null && focusModeTitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.filter_center_focus_outlined),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.focusMode,
              onSelected:
                  (focusMode) =>
                      updateConfig = currentConfig.copyWith(
                        focusMode: focusMode,
                      ),
              values: FocusMode.values,
            ),
        subtitle: focusModeSubtitle,
        title: focusModeTitle,
        trailing: Text(currentConfig.focusMode.name.toUpperCase()),
      ),
    if (isFrontVideoMirroredSubtitle != null &&
        isFrontVideoMirroredTitle != null)
      SwitchListTile(
        onChanged:
            (isFrontVideoMirrored) =>
                updateConfig = currentConfig.copyWith(
                  isFrontVideoMirrored: isFrontVideoMirrored,
                ),
        secondary: const Icon(Icons.photo_camera_front_outlined),
        subtitle: isFrontVideoMirroredSubtitle,
        title: isFrontVideoMirroredTitle,
        value: currentConfig.isFrontVideoMirrored,
      ),
    if (maxDurationTitle != null && maxDurationSubtitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.timelapse),
        onTap:
            () async => handleDurationPicker(
              context,
              currentConfig.maxDuration,
              onSelected:
                  (maxDuration) =>
                      updateConfig = currentConfig.copyWith(
                        maxDuration: maxDuration,
                      ),
            ),
        subtitle: maxDurationSubtitle,
        title: maxDurationTitle,
        trailing: Text(currentConfig.maxDuration.inSeconds.toString()),
      ),
    if (minDurationTitle != null && minDurationSubtitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.timer_outlined),
        onTap:
            () async => handleDurationPicker(
              context,
              currentConfig.minDuration,
              onSelected:
                  (minDuration) =>
                      updateConfig = currentConfig.copyWith(
                        minDuration: minDuration,
                      ),
            ),
        subtitle: minDurationSubtitle,
        title: minDurationTitle,
        trailing: Text(currentConfig.minDuration.inSeconds.toString()),
      ),
    if (sessionPresetSubtitle != null && sessionPresetTitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.hd_outlined),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.sessionPreset,
              onSelected:
                  (sessionPreset) =>
                      updateConfig = currentConfig.copyWith(
                        sessionPreset: sessionPreset,
                      ),
              values: CaptureSessionPreset.values,
            ),
        subtitle: sessionPresetSubtitle,
        title: sessionPresetTitle,
        trailing: Text(currentConfig.sessionPreset.name.toUpperCase()),
      ),
    if (showFlashSwitchSubtitle != null && showFlashSwitchTitle != null)
      SwitchListTile(
        onChanged:
            (showFlashSwitch) =>
                updateConfig = currentConfig.copyWith(
                  showFlashSwitch: showFlashSwitch,
                ),
        secondary: AnimatedChildSwitcher.icon(
          condition: currentConfig.showFlashSwitch,
          falseIcon: Icons.flash_off_outlined,
          trueIcon: Icons.flash_on_outlined,
        ),
        subtitle: showFlashSwitchSubtitle,
        title: showFlashSwitchTitle,
        value: currentConfig.showFlashSwitch,
      ),
    if (tapToRecordVideoSubtitle != null && tapToRecordVideoTitle != null)
      SwitchListTile(
        onChanged:
            (tapToRecordVideo) =>
                updateConfig = currentConfig.copyWith(
                  tapToRecordVideo: tapToRecordVideo,
                ),
        secondary: const Icon(Icons.touch_app_outlined),
        subtitle: tapToRecordVideoSubtitle,
        title: tapToRecordVideoTitle,
        value: currentConfig.tapToRecordVideo,
      ),
    if (videoExportTypeSubtitle != null && videoExportTypeTitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.local_movies_outlined),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.videoExportType,
              onSelected:
                  (videoExportType) =>
                      updateConfig = currentConfig.copyWith(
                        videoExportType: videoExportType,
                      ),
              values: VideoExportType.values,
            ),
        subtitle: videoExportTypeSubtitle,
        title: videoExportTypeTitle,
        trailing: Text(currentConfig.videoExportType.name.toUpperCase()),
      ),
    if (videoStabilizationSubtitle != null && videoStabilizationTitle != null)
      TextStyledListTile(
        leading: const Icon(Icons.video_stable_outlined),
        onTap:
            () async => handleShowEnumPicker(
              context,
              currentConfig.videoStabilization,
              onSelected:
                  (videoStabilization) =>
                      updateConfig = currentConfig.copyWith(
                        videoStabilization: videoStabilization,
                      ),
              values: VideoStabilization.values,
            ),
        subtitle: videoStabilizationSubtitle,
        title: videoStabilizationTitle,
        trailing: Text(
          currentConfig.videoStabilization?.name.toUpperCase() ?? 'AUTO',
        ),
      ),
  ];
}
