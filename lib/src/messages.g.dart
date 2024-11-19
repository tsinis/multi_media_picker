// Autogenerated from Pigeon (v22.6.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

enum CaptureSessionPreset {
  cif352x288,
  vga640x480,
  hd1280x720,
  hd1920x1080,
  hd4K3840x2160,
  photo,
}

enum EditTool {
  draw,
  clip,
  imageSticker,
  textSticker,
  mosaic,
  filter,
  adjust,
}

enum UiLocale {
  system,
  chineseSimplified,
  chineseTraditional,
  english,
  japanese,
  french,
  german,
  russian,
  vietnamese,
  korean,
  malay,
  italian,
  indonesian,
  portuguese,
  spanish,
  turkish,
  arabic,
  dutch,
}

enum AdjustTool {
  brightness,
  contrast,
  saturation,
}

enum DevicePosition {
  back,
  front,
}

enum ExposureMode {
  autoExpose,
  continuousAutoExposure,
}

enum FocusMode {
  autoFocus,
  continuousAutoFocus,
}

enum ImpactFeedbackStyle {
  light,
  medium,
  heavy,
}

enum MediaType {
  image,
  video,
}

enum VideoExportType {
  mov,
  mp4,
}

class ClipAspectRatio {
  ClipAspectRatio({
    required this.aspectRatioX,
    required this.aspectRatioY,
  });

  int aspectRatioX;

  int aspectRatioY;

  Object encode() {
    return <Object?>[
      aspectRatioX,
      aspectRatioY,
    ];
  }

  static ClipAspectRatio decode(Object result) {
    result as List<Object?>;
    return ClipAspectRatio(
      aspectRatioX: result[0]! as int,
      aspectRatioY: result[1]! as int,
    );
  }
}

class ClipOptions {
  ClipOptions({
    this.isCircle = false,
    this.aspectRatio,
  });

  bool isCircle;

  ClipAspectRatio? aspectRatio;

  Object encode() {
    return <Object?>[
      isCircle,
      aspectRatio,
    ];
  }

  static ClipOptions decode(Object result) {
    result as List<Object?>;
    return ClipOptions(
      isCircle: result[0]! as bool,
      aspectRatio: result[1] as ClipAspectRatio?,
    );
  }
}

class RawMediaData {
  RawMediaData({
    required this.path,
    required this.type,
    this.thumbPath,
    this.size,
  });

  String path;

  MediaType type;

  String? thumbPath;

  int? size;

  Object encode() {
    return <Object?>[
      path,
      type,
      thumbPath,
      size,
    ];
  }

  static RawMediaData decode(Object result) {
    result as List<Object?>;
    return RawMediaData(
      path: result[0]! as String,
      type: result[1]! as MediaType,
      thumbPath: result[2] as String?,
      size: result[3] as int?,
    );
  }
}

class RawPickerConfiguration {
  RawPickerConfiguration({
    this.maxSelectCount = 9,
    this.maxVideoSelectCount = 0,
    this.minVideoSelectCount = 0,
    this.allowMixSelect = true,
    this.maxPreviewCount = 20,
    this.initialIndex = 1,
    this.allowSelectImage = true,
    this.allowSelectVideo = true,
    this.downloadVideoBeforeSelecting = false,
    this.allowSelectGif = true,
    this.allowSelectLivePhoto = false,
    this.allowTakePhotoInLibrary = true,
    this.callbackDirectlyAfterTakingPhoto = false,
    this.allowEditImage = true,
    this.allowEditVideo = true,
    this.editAfterSelectThumbnailImage = false,
    this.cropVideoAfterSelectThumbnail = true,
    this.saveNewImageAfterEdit = true,
    this.allowSlideSelect = true,
    this.autoScrollWhenSlideSelectIsActive = true,
    this.autoScrollMaxSpeed = 600,
    this.allowDragSelect = false,
    this.allowSelectOriginal = true,
    this.alwaysRequestOriginal = false,
    this.showOriginalSizeWhenSelectOriginal = true,
    this.allowPreviewPhotos = true,
    this.showPreviewButtonInAlbum = true,
    this.showSelectCountOnDoneButton = true,
    this.showSelectButtonWhenSingleSelect = false,
    this.showSelectedIndex = true,
    this.maxEditVideoDurationSeconds = 10,
    this.maxSelectVideoDurationSeconds = 120,
    this.minSelectVideoDurationSeconds = 0,
    this.maxSelectVideoDataSizeKB,
    this.minSelectVideoDataSizeKB = 0,
    this.useCustomCamera = true,
  });

  int maxSelectCount;

  int maxVideoSelectCount;

  int minVideoSelectCount;

  bool allowMixSelect;

  int maxPreviewCount;

  int initialIndex;

  bool allowSelectImage;

  bool allowSelectVideo;

  bool downloadVideoBeforeSelecting;

  bool allowSelectGif;

  bool allowSelectLivePhoto;

  bool allowTakePhotoInLibrary;

  bool callbackDirectlyAfterTakingPhoto;

  bool allowEditImage;

  bool allowEditVideo;

  bool editAfterSelectThumbnailImage;

  bool cropVideoAfterSelectThumbnail;

  bool saveNewImageAfterEdit;

  bool allowSlideSelect;

  bool autoScrollWhenSlideSelectIsActive;

  double autoScrollMaxSpeed;

  bool allowDragSelect;

  bool allowSelectOriginal;

  bool alwaysRequestOriginal;

  bool showOriginalSizeWhenSelectOriginal;

  bool allowPreviewPhotos;

  bool showPreviewButtonInAlbum;

  bool showSelectCountOnDoneButton;

  bool showSelectButtonWhenSingleSelect;

  bool showSelectedIndex;

  int maxEditVideoDurationSeconds;

  int maxSelectVideoDurationSeconds;

  int minSelectVideoDurationSeconds;

  double? maxSelectVideoDataSizeKB;

  double minSelectVideoDataSizeKB;

  bool useCustomCamera;

  Object encode() {
    return <Object?>[
      maxSelectCount,
      maxVideoSelectCount,
      minVideoSelectCount,
      allowMixSelect,
      maxPreviewCount,
      initialIndex,
      allowSelectImage,
      allowSelectVideo,
      downloadVideoBeforeSelecting,
      allowSelectGif,
      allowSelectLivePhoto,
      allowTakePhotoInLibrary,
      callbackDirectlyAfterTakingPhoto,
      allowEditImage,
      allowEditVideo,
      editAfterSelectThumbnailImage,
      cropVideoAfterSelectThumbnail,
      saveNewImageAfterEdit,
      allowSlideSelect,
      autoScrollWhenSlideSelectIsActive,
      autoScrollMaxSpeed,
      allowDragSelect,
      allowSelectOriginal,
      alwaysRequestOriginal,
      showOriginalSizeWhenSelectOriginal,
      allowPreviewPhotos,
      showPreviewButtonInAlbum,
      showSelectCountOnDoneButton,
      showSelectButtonWhenSingleSelect,
      showSelectedIndex,
      maxEditVideoDurationSeconds,
      maxSelectVideoDurationSeconds,
      minSelectVideoDurationSeconds,
      maxSelectVideoDataSizeKB,
      minSelectVideoDataSizeKB,
      useCustomCamera,
    ];
  }

  static RawPickerConfiguration decode(Object result) {
    result as List<Object?>;
    return RawPickerConfiguration(
      maxSelectCount: result[0]! as int,
      maxVideoSelectCount: result[1]! as int,
      minVideoSelectCount: result[2]! as int,
      allowMixSelect: result[3]! as bool,
      maxPreviewCount: result[4]! as int,
      initialIndex: result[5]! as int,
      allowSelectImage: result[6]! as bool,
      allowSelectVideo: result[7]! as bool,
      downloadVideoBeforeSelecting: result[8]! as bool,
      allowSelectGif: result[9]! as bool,
      allowSelectLivePhoto: result[10]! as bool,
      allowTakePhotoInLibrary: result[11]! as bool,
      callbackDirectlyAfterTakingPhoto: result[12]! as bool,
      allowEditImage: result[13]! as bool,
      allowEditVideo: result[14]! as bool,
      editAfterSelectThumbnailImage: result[15]! as bool,
      cropVideoAfterSelectThumbnail: result[16]! as bool,
      saveNewImageAfterEdit: result[17]! as bool,
      allowSlideSelect: result[18]! as bool,
      autoScrollWhenSlideSelectIsActive: result[19]! as bool,
      autoScrollMaxSpeed: result[20]! as double,
      allowDragSelect: result[21]! as bool,
      allowSelectOriginal: result[22]! as bool,
      alwaysRequestOriginal: result[23]! as bool,
      showOriginalSizeWhenSelectOriginal: result[24]! as bool,
      allowPreviewPhotos: result[25]! as bool,
      showPreviewButtonInAlbum: result[26]! as bool,
      showSelectCountOnDoneButton: result[27]! as bool,
      showSelectButtonWhenSingleSelect: result[28]! as bool,
      showSelectedIndex: result[29]! as bool,
      maxEditVideoDurationSeconds: result[30]! as int,
      maxSelectVideoDurationSeconds: result[31]! as int,
      minSelectVideoDurationSeconds: result[32]! as int,
      maxSelectVideoDataSizeKB: result[33] as double?,
      minSelectVideoDataSizeKB: result[34]! as double,
      useCustomCamera: result[35]! as bool,
    );
  }
}

class RawEditConfiguration {
  RawEditConfiguration({
    this.tools = const [],
    this.clipOptions,
    this.adjustTools = const [],
    this.showClipDirectlyIfOnlyHasClipTool = false,
    this.impactFeedbackWhenAdjustSliderValueIsZero = true,
    this.impactFeedbackStyle = ImpactFeedbackStyle.medium,
    this.dimClippedAreaDuringAdjustments = false,
    this.minimumZoomScale = 1.0,
  });

  List<EditTool> tools;

  ClipOptions? clipOptions;

  List<AdjustTool> adjustTools;

  bool showClipDirectlyIfOnlyHasClipTool;

  bool impactFeedbackWhenAdjustSliderValueIsZero;

  ImpactFeedbackStyle impactFeedbackStyle;

  bool dimClippedAreaDuringAdjustments;

  double minimumZoomScale;

  Object encode() {
    return <Object?>[
      tools,
      clipOptions,
      adjustTools,
      showClipDirectlyIfOnlyHasClipTool,
      impactFeedbackWhenAdjustSliderValueIsZero,
      impactFeedbackStyle,
      dimClippedAreaDuringAdjustments,
      minimumZoomScale,
    ];
  }

  static RawEditConfiguration decode(Object result) {
    result as List<Object?>;
    return RawEditConfiguration(
      tools: (result[0] as List<Object?>?)!.cast<EditTool>(),
      clipOptions: result[1] as ClipOptions?,
      adjustTools: (result[2] as List<Object?>?)!.cast<AdjustTool>(),
      showClipDirectlyIfOnlyHasClipTool: result[3]! as bool,
      impactFeedbackWhenAdjustSliderValueIsZero: result[4]! as bool,
      impactFeedbackStyle: result[5]! as ImpactFeedbackStyle,
      dimClippedAreaDuringAdjustments: result[6]! as bool,
      minimumZoomScale: result[7]! as double,
    );
  }
}

class RawCameraConfiguration {
  RawCameraConfiguration({
    this.allowTakePhoto = true,
    this.allowRecordVideo = true,
    this.minDurationSeconds = 0,
    this.maxDurationSeconds = 30,
    this.isFrontVideoMirrored = true,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.directoryPath,
    this.imageName,
    this.showFlashSwitch = true,
    this.allowSwitchCamera = true,
    this.tapToRecordVideo = true,
    this.enableWideCameras = true,
    this.videoExportType = VideoExportType.mp4,
    this.devicePosition = DevicePosition.back,
  });

  bool allowTakePhoto;

  bool allowRecordVideo;

  int minDurationSeconds;

  int maxDurationSeconds;

  bool isFrontVideoMirrored;

  CaptureSessionPreset sessionPreset;

  FocusMode focusMode;

  ExposureMode exposureMode;

  String? directoryPath;

  String? imageName;

  bool showFlashSwitch;

  bool allowSwitchCamera;

  bool tapToRecordVideo;

  bool enableWideCameras;

  VideoExportType videoExportType;

  DevicePosition devicePosition;

  Object encode() {
    return <Object?>[
      allowTakePhoto,
      allowRecordVideo,
      minDurationSeconds,
      maxDurationSeconds,
      isFrontVideoMirrored,
      sessionPreset,
      focusMode,
      exposureMode,
      directoryPath,
      imageName,
      showFlashSwitch,
      allowSwitchCamera,
      tapToRecordVideo,
      enableWideCameras,
      videoExportType,
      devicePosition,
    ];
  }

  static RawCameraConfiguration decode(Object result) {
    result as List<Object?>;
    return RawCameraConfiguration(
      allowTakePhoto: result[0]! as bool,
      allowRecordVideo: result[1]! as bool,
      minDurationSeconds: result[2]! as int,
      maxDurationSeconds: result[3]! as int,
      isFrontVideoMirrored: result[4]! as bool,
      sessionPreset: result[5]! as CaptureSessionPreset,
      focusMode: result[6]! as FocusMode,
      exposureMode: result[7]! as ExposureMode,
      directoryPath: result[8] as String?,
      imageName: result[9] as String?,
      showFlashSwitch: result[10]! as bool,
      allowSwitchCamera: result[11]! as bool,
      tapToRecordVideo: result[12]! as bool,
      enableWideCameras: result[13]! as bool,
      videoExportType: result[14]! as VideoExportType,
      devicePosition: result[15]! as DevicePosition,
    );
  }
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is CaptureSessionPreset) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    }    else if (value is EditTool) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    }    else if (value is UiLocale) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    }    else if (value is AdjustTool) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    }    else if (value is DevicePosition) {
      buffer.putUint8(133);
      writeValue(buffer, value.index);
    }    else if (value is ExposureMode) {
      buffer.putUint8(134);
      writeValue(buffer, value.index);
    }    else if (value is FocusMode) {
      buffer.putUint8(135);
      writeValue(buffer, value.index);
    }    else if (value is ImpactFeedbackStyle) {
      buffer.putUint8(136);
      writeValue(buffer, value.index);
    }    else if (value is MediaType) {
      buffer.putUint8(137);
      writeValue(buffer, value.index);
    }    else if (value is VideoExportType) {
      buffer.putUint8(138);
      writeValue(buffer, value.index);
    }    else if (value is ClipAspectRatio) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    }    else if (value is ClipOptions) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    }    else if (value is RawMediaData) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    }    else if (value is RawPickerConfiguration) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    }    else if (value is RawEditConfiguration) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    }    else if (value is RawCameraConfiguration) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : CaptureSessionPreset.values[value];
      case 130: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : EditTool.values[value];
      case 131: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : UiLocale.values[value];
      case 132: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AdjustTool.values[value];
      case 133: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : DevicePosition.values[value];
      case 134: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : ExposureMode.values[value];
      case 135: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : FocusMode.values[value];
      case 136: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : ImpactFeedbackStyle.values[value];
      case 137: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : MediaType.values[value];
      case 138: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : VideoExportType.values[value];
      case 139: 
        return ClipAspectRatio.decode(readValue(buffer)!);
      case 140: 
        return ClipOptions.decode(readValue(buffer)!);
      case 141: 
        return RawMediaData.decode(readValue(buffer)!);
      case 142: 
        return RawPickerConfiguration.decode(readValue(buffer)!);
      case 143: 
        return RawEditConfiguration.decode(readValue(buffer)!);
      case 144: 
        return RawCameraConfiguration.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class MultiMediaApi {
  /// Constructor for [MultiMediaApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MultiMediaApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<RawMediaData?> openCamera(RawCameraConfiguration cameraConfig, RawPickerConfiguration pickerConfig, RawEditConfiguration editConfig) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.multi_media_picker.MultiMediaApi.openCamera$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[cameraConfig, pickerConfig, editConfig]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return (pigeonVar_replyList[0] as RawMediaData?);
    }
  }
}
