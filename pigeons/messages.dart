import 'package:pigeon/pigeon.dart';

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
  dutch
}

enum AdjustTool { brightness, contrast, saturation }

enum DevicePosition { back, front }

enum ExposureMode { autoExpose, continuousAutoExposure }

enum FocusMode { autoFocus, continuousAutoFocus }

enum ImpactFeedbackStyle { light, medium, heavy }

enum MediaType { image, video }

enum VideoExportType { mov, mp4 }

class ClipAspectRatio {
  const ClipAspectRatio(this.aspectRatioX, this.aspectRatioY);

  final int aspectRatioX;
  final int aspectRatioY;
}

class ClipOptions {
  const ClipOptions({this.aspectRatio, this.isCircle = false});

  final bool isCircle;
  final ClipAspectRatio? aspectRatio;
}

class RawMediaData {
  const RawMediaData(this.path, this.type, this.thumbPath, this.size);

  final String path;
  final MediaType type;
  final String? thumbPath;
  final int? size;
}

class RawPickerConfiguration {
  const RawPickerConfiguration({
    this.allowDragSelect = false,
    this.allowEditImage = true,
    this.allowEditVideo = true,
    this.allowMixSelect = true,
    this.allowPreviewPhotos = true,
    this.allowSelectGif = true,
    this.allowSelectImage = true,
    this.allowSelectLivePhoto = false,
    this.allowSelectOriginal = true,
    this.allowSelectVideo = true,
    this.allowSlideSelect = true,
    this.allowTakePhotoInLibrary = true,
    this.alwaysRequestOriginal = false,
    this.autoScrollMaxSpeed = 600,
    this.autoScrollWhenSlideSelectIsActive = true,
    this.callbackDirectlyAfterTakingPhoto = false,
    this.cropVideoAfterSelectThumbnail = true,
    this.downloadVideoBeforeSelecting = false,
    this.editAfterSelectThumbnailImage = false,
    this.initialIndex = 1,
    this.maxEditVideoTime = 10,
    this.maxPreviewCount = 20,
    this.maxSelectCount = 9,
    this.maxSelectVideoDataSizeKB,
    this.maxSelectVideoDurationSeconds = 120,
    this.maxVideoSelectCount = 0,
    this.minSelectVideoDataSizeKB = 0,
    this.minSelectVideoDurationSeconds = 0,
    this.minVideoSelectCount = 0,
    this.saveNewImageAfterEdit = true,
    this.showOriginalSizeWhenSelectOriginal = true,
    this.showPreviewButtonInAlbum = true,
    this.showSelectBtnWhenSingleSelect = false,
    this.showSelectCountOnDoneBtn = true,
    this.showSelectedIndex = true,
    this.useCustomCamera = true,
  });

  /// Anything bigger than 1 will enable the multiple selection feature.
  /// Defaults to `9`.
  final int maxSelectCount;

  /// A count for video max selection. Defaults to `0`. Warning: Only valid in
  /// mix selection mode. (i.e. [allowMixSelect] is `true`)
  final int maxVideoSelectCount;

  /// A count for video min selection. Defaults to `0`.
  /// Warning: Only valid in mix selection mode i.e. [allowMixSelect] is `true`.
  final int minVideoSelectCount;

  /// Whether photos and videos can be selected together.
  /// If set to `false`, only one video can be selected. Defaults to `true`.
  final bool allowMixSelect;

  /// Preview selection max preview count, if the value is zero, only show
  /// `Camera`, `Album`, `Cancel` buttons. Defaults to `20`.
  final int maxPreviewCount;

  /// The index of the first selected image, and the indices of subsequently
  /// selected images are incremented based on this value. Defaults to `1`.
  final int initialIndex;

  /// If set to `false`, GIF and live photo cannot be selected either.
  /// Defaults to `true`.
  final bool allowSelectImage;

  /// If set to `false`, videos cannot be selected either. Defaults to `true`.
  final bool allowSelectVideo;

  /// If set to `true`, videos on iCloud will be downloaded before selection.
  /// Defaults to `false`.
  final bool downloadVideoBeforeSelecting;

  /// Allow select GIF, it only controls whether it is displayed in GIF form.
  /// If value is `false`, the GIF logo is not displayed. Defaults to `true`.
  final bool allowSelectGif;

  /// Allow select live photo, it only controls whether it is displayed in
  /// live photo form. If value is `false`, the live photo logo is not displayed.
  /// Defaults to `false`.
  final bool allowSelectLivePhoto;

  /// Allow take photos in the album. Defaults to `true`.
  /// Warning: If [allowTakePhoto] and [allowRecordVideo] are both `false`,
  /// it will not be displayed.
  final bool allowTakePhotoInLibrary;

  /// Whether to callback directly after taking a photo. Defaults to `false`.
  final bool callbackDirectlyAfterTakingPhoto;

  /// Allows edit images. Defaults to `true`.
  final bool allowEditImage;

  /// Warning: The video can only be edited when no photos are selected, or only
  /// one video is selected, and the selection callback is executed immediately
  /// after editing is completed.
  final bool allowEditVideo;

  /// After selecting a image/video in the thumbnail interface, enter the editing
  /// interface directly. Defaults to `false`.
  ///
  /// Note: Editing image is only valid when [allowEditImage] is `true` and
  /// [maxSelectCount] is `1`. Editing video is only valid when [allowEditVideo]
  /// is `true` and [maxSelectCount] is `1`.
  final bool editAfterSelectThumbnailImage;

  /// Only valid when [allowMixSelect] is `false` and [allowEditVideo] is `true`.
  /// Defaults to `true`.  If you  want to crop the video after select thumbnail
  /// under [allowMixSelect] is `true`, please use [editAfterSelectThumbnailImage].
  final bool cropVideoAfterSelectThumbnail;

  /// Save the edited image to the album after editing. Defaults to `true`.
  final bool saveNewImageAfterEdit;

  /// If `true`, you can slide select photos in album. Defaults to `true`.
  final bool allowSlideSelect;

  /// When slide select is active, will auto scroll to top or bottom when your
  /// finger at the top or bottom. Defaults to `true`.
  final bool autoScrollWhenSlideSelectIsActive;

  /// The max speed (pt/s) of auto scroll. Defaults to `600`.
  final double autoScrollMaxSpeed;

  /// If `true`, you can drag select photo when preview selection style.
  /// Defaults to `false`.
  final bool allowDragSelect;

  /// Allow select full image. Defaults to `true`.
  final bool allowSelectOriginal;

  /// Always return the original photo. Warning: Only valid when
  /// [allowSelectOriginal] is `false`. Defaults to `false`.
  final bool alwaysRequestOriginal;

  /// Whether to show the total size of selected photos when selecting the
  /// original image. Defaults to `true`.
  ///
  /// Note: The framework uses a conversion ratio of 1KB=1024Byte, while the
  /// system album uses 1KB=1000Byte, so the displayed photo size within the
  /// framework will be smaller than the size in the system album.
  final bool showOriginalSizeWhenSelectOriginal;

  /// Allow access to the preview large image interface (whether to
  /// allow access to the large image interface after clicking the thumbnail
  /// image). Defaults to `true`.
  final bool allowPreviewPhotos;

  /// Whether to show the preview button (i.e. the preview button in the lower
  /// left corner of the thumbnail interface). Defaults to `true`.
  final bool showPreviewButtonInAlbum;

  /// Whether to display the selected count on the button. Defaults to `true`.
  final bool showSelectCountOnDoneBtn;

  /// In single selection mode, whether to display the selection button.
  /// Defaults to `false`.
  final bool showSelectBtnWhenSingleSelect;

  /// Display the index of the selected photos. Defaults to `true`.
  final bool showSelectedIndex;

  /// Maximum cropping time when editing video, unit: second. Defaults to `10`.
  final int maxEditVideoTime;

  /// Allow to choose the maximum duration of the video. Defaults to `120`.
  final int maxSelectVideoDurationSeconds;

  /// Allow to choose the minimum duration of the video. Defaults to `0`.
  final int minSelectVideoDurationSeconds;

  /// Allow to choose the maximum data size of the video (in KB).
  /// Defaults to `null` (no limit).
  final double? maxSelectVideoDataSizeKB;

  /// Allow to choose the minimum data size of the video. Defaults to `0` KB.
  final double minSelectVideoDataSizeKB;

  /// Whether to use custom camera. Defaults to `true`.
  final bool useCustomCamera;
}

class RawEditConfiguration {
  const RawEditConfiguration({
    this.adjustTools = const [],
    this.clipOptions,
    this.dimClippedAreaDuringAdjustments = false,
    this.impactFeedbackStyle = ImpactFeedbackStyle.medium,
    this.impactFeedbackWhenAdjustSliderValueIsZero = true,
    this.minimumZoomScale = 1.0,
    this.showClipDirectlyIfOnlyHasClipTool = false,
    this.tools = const [],
  });

  /// Edit image tools.
  /// Default order: `draw`, `clip`, `textSticker`, `mosaic`, `filter`, `adjust`.
  final List<EditTool> tools;

  /// Edit clip type and ratio for the editor.
  final ClipOptions? clipOptions;

  /// Adjust image tools. Default order: `brightness`, `contrast`, `saturation`.
  final List<AdjustTool> adjustTools;

  /// If image edit tools only have clip and this property is `true`,
  /// the clipping interface will be displayed directly. Defaults to `false`.
  final bool showClipDirectlyIfOnlyHasClipTool;

  /// Give an impact feedback when the adjust slider value is zero.
  /// Defaults to `true`.
  final bool impactFeedbackWhenAdjustSliderValueIsZero;

  /// Impact feedback style. Defaults to `medium`.
  final ImpactFeedbackStyle impactFeedbackStyle;

  /// Whether to keep the clipped area dimmed during adjustments.
  /// Defaults to `false`.
  final bool dimClippedAreaDuringAdjustments;

  /// Minimum zoom scale, allowing the user to make the edited photo smaller,
  /// so it does not overlap top and bottom tools menu. Defaults to `1.0`.
  final double minimumZoomScale;
}

class RawCameraConfiguration {
  const RawCameraConfiguration({
    this.allowRecordVideo = true,
    this.allowSwitchCamera = true,
    this.allowTakePhoto = true,
    this.devicePosition = DevicePosition.back,
    this.enableWideCameras = true,
    this.exposureMode = ExposureMode.continuousAutoExposure,
    this.fileDirectoryPath,
    this.fileName,
    this.focusMode = FocusMode.continuousAutoFocus,
    this.isVideoMirrored = true,
    this.maxDurationSeconds = 30,
    this.minDurationSeconds = 0,
    this.sessionPreset = CaptureSessionPreset.hd1920x1080,
    this.showFlashSwitch = true,
    this.tapToRecordVideo = true,
    this.videoExportType = VideoExportType.mp4,
  });

  /// Allow taking photos in the camera. Defaults to `true`.
  final bool allowTakePhoto;

  /// Allow video recording in the camera. Defaults to `true`.
  final bool allowRecordVideo;

  /// Minimum recording duration. Defaults to `0`.
  final int minDurationSeconds;

  /// Maximum recording duration. Defaults to `30`, minimum is `1`.
  final int maxDurationSeconds;

  /// Indicates whether the video flowing through the connection should be
  /// mirrored about its vertical axis. Defaults to `true`.
  final bool isVideoMirrored;

  /// Video resolution. Defaults to [CaptureSessionPreset.hd1920x1080].
  final CaptureSessionPreset sessionPreset;

  /// Camera focus mode. Defaults to [FocusMode.continuousAutoFocus].
  final FocusMode focusMode;

  /// Camera exposure mode. Defaults to [ExposureMode.continuousAutoExposure].
  final ExposureMode exposureMode;

  /// Directory path for saving the file. Defaults to `null`, temporary directory.
  final String? fileDirectoryPath;

  /// File name for saving the file.
  /// Defaults to `null`, random UUID with `multi_media_` prefix.
  final String? fileName;

  /// Camera flash switch. Defaults to `true`.
  final bool showFlashSwitch;

  /// Whether to support switch camera. Defaults to `true`.
  final bool allowSwitchCamera;

  /// Flag to enable tap-to-record functionality. Default is `true`. If
  /// [allowTakePhoto] is set to `true`, [tapToRecordVideo] will be ignored.
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
  RawMediaData? openCamera(
    RawCameraConfiguration cameraConfig,
    RawPickerConfiguration pickerConfig,
    RawEditConfiguration editConfig,
  );
}
