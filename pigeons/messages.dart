import 'package:pigeon/pigeon.dart';

enum CaptureSessionPreset {
  cif352x288,
  vga640x480,
  hd1280x720,
  hd1920x1080,
  hd4K3840x2160,
  photo,
}

enum CropType { rectangle, circle }

enum DevicePosition { back, front }

enum ExposureMode { autoExpose, continuousAutoExposure }

enum FocusMode { autoFocus, continuousAutoFocus }

enum MediaType { image, video }

enum VideoExportType { mov, mp4 }

class CropAspectRatio {
  const CropAspectRatio(this.aspectRatioX, this.aspectRatioY);

  final int aspectRatioX;
  final int aspectRatioY;
}

class CropOptions {
  const CropOptions({this.aspectRatio, this.type = CropType.rectangle});

  final CropType type;
  final CropAspectRatio? aspectRatio;
}

class RawMediaData {
  const RawMediaData(this.path, this.type, this.thumbPath, this.size);

  final String path;
  final MediaType type;
  final String? thumbPath;
  final int? size;
}

class RawCameraConfiguration {
  const RawCameraConfiguration({
    this.mediaType = MediaType.image,
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.cropOptions,
    this.devicePosition = DevicePosition.back,
    this.enableWideCameras = true,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.isVideoMirrored = true,
    this.locale,
    this.maxDurationSeconds = 30,
    this.maxSizeKB,
    this.minDurationSeconds = 0,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = VideoExportType.mp4,
  });

  /// The type of media to use. Defaults to [MediaType.image].
  final MediaType mediaType;

  /// Max size of the media file in KB.
  final int? maxSizeKB;

  /// The locale of the camera. Defaults to the system locale.
  final String? locale;

  final CropOptions? cropOptions; // TODO? Move out of here?

  /// Allow taking photos in the camera. Defaults to `true`.
  final bool allowTakePhoto;

  /// Allow video recording in the camera. Defaults to `true`.
  final bool allowRecordVideo;

  /// Minimum recording duration. Defaults to `0`.
  final int minDurationSeconds;

  /// Maximum recording duration. Defaults to `30`, minimum is `1`.
  final int maxDurationSeconds;

  /// Indicates whether the video flowing through the connection
  /// should be mirrored about its vertical axis. Defaults to `true`.
  final bool isVideoMirrored;

  /// Video resolution. Defaults to [CaptureSessionPreset.hd1920x1080].
  final CaptureSessionPreset sessionPreset;

  /// Camera focus mode. Defaults to [FocusMode.continuousAutoFocus].
  final FocusMode focusMode;

  /// Camera exposure mode. Defaults to [ExposureMode.continuousAutoExposure].
  final ExposureMode exposureMode;

  /// Camera flash switch. Defaults to `true`.
  final bool showFlashSwitch;

  /// Whether to support switch camera. Defaults to `true`.
  final bool allowSwitchCamera;

  /// Flag to enable tap-to-record functionality. Default is `true`.
  /// If [allowTakePhoto] is set to `true`, [tapToRecordVideo] will be ignored.
  final bool tapToRecordVideo;

  /// Enable the use of wide cameras (on supported devices). Defaults to `true`.
  final bool enableWideCameras;

  /// Video export format for recording/editing video. Defaults to `mp4`.
  final VideoExportType videoExportType;

  /// The default camera position after entering the camera. Defaults to `back`.
  final DevicePosition devicePosition;
}

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  swiftOut: 'ios/Classes/messages.g.swift',
))
@HostApi()
abstract class MultiMediaApi {
  @async
  RawMediaData? openCamera(RawCameraConfiguration cameraConfig);
}
