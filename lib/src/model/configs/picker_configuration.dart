// ignore_for_file: prefer-boolean-prefixes

import 'dart:io' show Directory;

import 'package:flutter/foundation.dart' show immutable;

@immutable
class PickerConfiguration {
  const PickerConfiguration({
    this.allowDragSelect = false,
    this.allowEditImage = true,
    this.allowEditVideo = true,
    this.allowMixSelect = true,
    this.allowPreviewPhotos = true,
    // TODO this.allowSelectGif = true, // Implement this in the future.
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
    this.directory,
    this.downloadVideoBeforeSelecting = false,
    this.editAfterSelectThumbnailImage = true,
    String imageName = '',
    this.initialIndex = 1,
    this.maxEditVideoDuration = const Duration(seconds: 10),
    this.maxPreviewCount = 20,
    this.maxSelectCount = 9,
    this.maxSelectVideoDataSizeKB = -1,
    this.maxSelectVideoDuration = const Duration(seconds: 120),
    this.maxVideoSelectCount = 0,
    this.minSelectVideoDataSizeKB = 0,
    this.minSelectVideoDuration = Duration.zero,
    this.minVideoSelectCount = 0,
    this.saveNewImageAfterEdit = true,
    this.showOriginalSizeWhenSelectOriginal = true,
    this.showPreviewButtonInAlbum = true,
    this.showSelectButtonWhenSingleSelect = false,
    this.showSelectCountOnDoneButton = true,
    this.showSelectedIndex = true,
    this.thumbnailPrefix = '.thumbnail_',
    this.thumbnailWidth = 200,
    this.useCustomCamera = true,
  }) : _imageName = imageName;

  /// Anything bigger than 1 will enable the multiple selection feature.
  /// Defaults to `9`.
  final int maxSelectCount;

  /// A count for video max selection. Defaults to `0`. Warning: only valid in
  /// mix selection mode (i.e. [allowMixSelect] is `true`).
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
  // TODO final bool allowSelectGif; // Implement this in the future.

  /// Allow select live photo, it only controls whether it is displayed in
  /// live photo form. If value is `false` the live photo logo is not displayed.
  /// Defaults to `false`.
  final bool allowSelectLivePhoto;

  /// Allow take photos in the album. Defaults to `true`.
  /// Warning: If `allowTakePhoto` and `allowRecordVideo` are both `false`,
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
  /// [maxSelectCount] is `1`.
  final bool editAfterSelectThumbnailImage;

  /// Only valid when [allowMixSelect] is `false` and [allowEditVideo] is `true`
  /// Defaults to `true`.  If you  want to crop the video after select thumbnail
  /// under [allowMixSelect] is `true`,
  /// please use [editAfterSelectThumbnailImage].
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
  final bool showSelectCountOnDoneButton;

  /// In single selection mode, whether to display the selection button.
  /// Defaults to `false`.
  final bool showSelectButtonWhenSingleSelect;

  /// Display the index of the selected photos. Defaults to `true`.
  final bool showSelectedIndex;

  /// The prefix of the thumbnail image. Defaults to `.thumbnail_`.
  final String thumbnailPrefix;

  /// The width of the thumbnail image. Defaults to `200`.
  final int thumbnailWidth;

  /// Maximum cropping time when editing video, unit: second. Defaults to `10`.
  final Duration maxEditVideoDuration;

  /// Allow to choose the maximum duration of the video. Defaults to `120`.
  final Duration maxSelectVideoDuration;

  /// Allow to choose the minimum duration of the video. Defaults to `0`.
  final Duration minSelectVideoDuration;

  /// Allow to choose the maximum data size of the video (in KB).
  /// Defaults to `-1` (no limit).
  final double maxSelectVideoDataSizeKB;

  /// Allow to choose the minimum data size of the video. Defaults to `0` KB.
  final double minSelectVideoDataSizeKB;

  /// Whether to use custom camera. Defaults to `true`.
  final bool useCustomCamera;

  /// [Directory] path for saving the file. Defaults to `null` - the temporary
  /// directory.
  final Directory? directory;

  final String _imageName;

  /// Image file name for saving the image or thumbnail file.
  /// Defaults to empty string - random UUID with `multi_media_` prefix.
  String get imageName => _imageName.trim();

  // ignore: avoid-high-cyclomatic-complexity, a lot of parameters.
  PickerConfiguration copyWith({
    bool? allowDragSelect,
    bool? allowEditImage,
    bool? allowEditVideo,
    bool? allowMixSelect,
    bool? allowPreviewPhotos,
    // TODO bool? allowSelectGif, // Implement this in the future.
    bool? allowSelectImage,
    bool? allowSelectLivePhoto,
    bool? allowSelectOriginal,
    bool? allowSelectVideo,
    bool? allowSlideSelect,
    bool? allowTakePhotoInLibrary,
    bool? alwaysRequestOriginal,
    double? autoScrollMaxSpeed,
    bool? autoScrollWhenSlideSelectIsActive,
    bool? callbackDirectlyAfterTakingPhoto,
    bool? cropVideoAfterSelectThumbnail,
    Directory? directory,
    bool? downloadVideoBeforeSelecting,
    bool? editAfterSelectThumbnailImage,
    String? imageName,
    int? initialIndex,
    Duration? maxEditVideoDuration,
    int? maxPreviewCount,
    int? maxSelectCount,
    double? maxSelectVideoDataSizeKB,
    Duration? maxSelectVideoDuration,
    int? maxVideoSelectCount,
    double? minSelectVideoDataSizeKB,
    Duration? minSelectVideoDuration,
    int? minVideoSelectCount,
    bool? saveNewImageAfterEdit,
    bool? showOriginalSizeWhenSelectOriginal,
    bool? showPreviewButtonInAlbum,
    bool? showSelectButtonWhenSingleSelect,
    bool? showSelectCountOnDoneButton,
    bool? showSelectedIndex,
    String? thumbnailPrefix,
    int? thumbnailWidth,
    bool? useCustomCamera,
  }) =>
      PickerConfiguration(
        allowDragSelect: allowDragSelect ?? this.allowDragSelect,
        allowEditImage: allowEditImage ?? this.allowEditImage,
        allowEditVideo: allowEditVideo ?? this.allowEditVideo,
        allowMixSelect: allowMixSelect ?? this.allowMixSelect,
        allowPreviewPhotos: allowPreviewPhotos ?? this.allowPreviewPhotos,
        // TODO: allowSelectGif: allowSelectGif ?? this.allowSelectGif.
        allowSelectImage: allowSelectImage ?? this.allowSelectImage,
        allowSelectLivePhoto: allowSelectLivePhoto ?? this.allowSelectLivePhoto,
        allowSelectOriginal: allowSelectOriginal ?? this.allowSelectOriginal,
        allowSelectVideo: allowSelectVideo ?? this.allowSelectVideo,
        allowSlideSelect: allowSlideSelect ?? this.allowSlideSelect,
        allowTakePhotoInLibrary:
            allowTakePhotoInLibrary ?? this.allowTakePhotoInLibrary,
        alwaysRequestOriginal:
            alwaysRequestOriginal ?? this.alwaysRequestOriginal,
        autoScrollMaxSpeed: autoScrollMaxSpeed ?? this.autoScrollMaxSpeed,
        autoScrollWhenSlideSelectIsActive: autoScrollWhenSlideSelectIsActive ??
            this.autoScrollWhenSlideSelectIsActive,
        callbackDirectlyAfterTakingPhoto: callbackDirectlyAfterTakingPhoto ??
            this.callbackDirectlyAfterTakingPhoto,
        cropVideoAfterSelectThumbnail:
            cropVideoAfterSelectThumbnail ?? this.cropVideoAfterSelectThumbnail,
        directory: directory ?? this.directory,
        downloadVideoBeforeSelecting:
            downloadVideoBeforeSelecting ?? this.downloadVideoBeforeSelecting,
        editAfterSelectThumbnailImage:
            editAfterSelectThumbnailImage ?? this.editAfterSelectThumbnailImage,
        imageName: imageName ?? this.imageName,
        initialIndex: initialIndex ?? this.initialIndex,
        maxEditVideoDuration: maxEditVideoDuration ?? this.maxEditVideoDuration,
        maxPreviewCount: maxPreviewCount ?? this.maxPreviewCount,
        maxSelectCount: maxSelectCount ?? this.maxSelectCount,
        maxSelectVideoDataSizeKB:
            maxSelectVideoDataSizeKB ?? this.maxSelectVideoDataSizeKB,
        maxSelectVideoDuration:
            maxSelectVideoDuration ?? this.maxSelectVideoDuration,
        maxVideoSelectCount: maxVideoSelectCount ?? this.maxVideoSelectCount,
        minSelectVideoDataSizeKB:
            minSelectVideoDataSizeKB ?? this.minSelectVideoDataSizeKB,
        minSelectVideoDuration:
            minSelectVideoDuration ?? this.minSelectVideoDuration,
        minVideoSelectCount: minVideoSelectCount ?? this.minVideoSelectCount,
        saveNewImageAfterEdit:
            saveNewImageAfterEdit ?? this.saveNewImageAfterEdit,
        showOriginalSizeWhenSelectOriginal:
            showOriginalSizeWhenSelectOriginal ??
                this.showOriginalSizeWhenSelectOriginal,
        showPreviewButtonInAlbum:
            showPreviewButtonInAlbum ?? this.showPreviewButtonInAlbum,
        showSelectButtonWhenSingleSelect: showSelectButtonWhenSingleSelect ??
            this.showSelectButtonWhenSingleSelect,
        showSelectCountOnDoneButton:
            showSelectCountOnDoneButton ?? this.showSelectCountOnDoneButton,
        showSelectedIndex: showSelectedIndex ?? this.showSelectedIndex,
        thumbnailPrefix: thumbnailPrefix ?? this.thumbnailPrefix,
        thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth,
        useCustomCamera: useCustomCamera ?? this.useCustomCamera,
      );

  @override
  String toString() => 'PickerConfiguration(maxSelectCount: $maxSelectCount, '
      'maxVideoSelectCount: $maxVideoSelectCount, '
      'minVideoSelectCount: $minVideoSelectCount, '
      'allowMixSelect: $allowMixSelect, maxPreviewCount: $maxPreviewCount, '
      'initialIndex: $initialIndex, allowSelectImage: $allowSelectImage, '
      'allowSelectVideo: $allowSelectVideo, '
      'downloadVideoBeforeSelecting: $downloadVideoBeforeSelecting, '
      // TODO 'allowSelectGif: $allowSelectGif, ', Implement this in the future.
      'allowSelectLivePhoto: $allowSelectLivePhoto, '
      'allowTakePhotoInLibrary: $allowTakePhotoInLibrary, '
      'callbackDirectlyAfterTakingPhoto: $callbackDirectlyAfterTakingPhoto, '
      'allowEditImage: $allowEditImage, allowEditVideo: $allowEditVideo, '
      'editAfterSelectThumbnailImage: $editAfterSelectThumbnailImage, '
      'cropVideoAfterSelectThumbnail: $cropVideoAfterSelectThumbnail, '
      '${directory == null ? '' : 'directory: "$directory", '}'
      'imageName: "$imageName", saveNewImageAfterEdit: $saveNewImageAfterEdit, '
      'allowSlideSelect: $allowSlideSelect, '
      'autoScrollWhenSlideSelectIsActive: $autoScrollWhenSlideSelectIsActive, '
      'autoScrollMaxSpeed: $autoScrollMaxSpeed, '
      'allowDragSelect: $allowDragSelect, '
      'allowSelectOriginal: $allowSelectOriginal, '
      'alwaysRequestOriginal: $alwaysRequestOriginal, '
      'showOriginalSizeWhenSelectOriginal: $showOriginalSizeWhenSelectOriginal,'
      ' allowPreviewPhotos: $allowPreviewPhotos, '
      'showPreviewButtonInAlbum: $showPreviewButtonInAlbum, '
      'showSelectCountOnDoneButton: $showSelectCountOnDoneButton, '
      'showSelectButtonWhenSingleSelect: $showSelectButtonWhenSingleSelect, '
      'showSelectedIndex: $showSelectedIndex, '
      'maxEditVideoDuration: $maxEditVideoDuration, '
      'maxSelectVideoDuration: $maxSelectVideoDuration, '
      'minSelectVideoDuration: $minSelectVideoDuration, '
      'maxSelectVideoDataSizeKB: $maxSelectVideoDataSizeKB, '
      'minSelectVideoDataSizeKB: $minSelectVideoDataSizeKB, '
      'thumbnailPrefix: "$thumbnailPrefix", thumbnailWidth: $thumbnailWidth, '
      'useCustomCamera: $useCustomCamera)';

  @override
  // ignore: avoid-high-cyclomatic-complexity, a lot of parameters.
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickerConfiguration &&
        other.maxSelectCount == maxSelectCount &&
        other.maxVideoSelectCount == maxVideoSelectCount &&
        other.minVideoSelectCount == minVideoSelectCount &&
        other.allowMixSelect == allowMixSelect &&
        other.maxPreviewCount == maxPreviewCount &&
        other.initialIndex == initialIndex &&
        other.allowSelectImage == allowSelectImage &&
        other.allowSelectVideo == allowSelectVideo &&
        other.downloadVideoBeforeSelecting == downloadVideoBeforeSelecting &&
        // TODO other.allowSelectGif == allowSelectGif &&.
        other.allowSelectLivePhoto == allowSelectLivePhoto &&
        other.allowTakePhotoInLibrary == allowTakePhotoInLibrary &&
        other.callbackDirectlyAfterTakingPhoto ==
            callbackDirectlyAfterTakingPhoto &&
        other.allowEditImage == allowEditImage &&
        other.allowEditVideo == allowEditVideo &&
        other.editAfterSelectThumbnailImage == editAfterSelectThumbnailImage &&
        other.cropVideoAfterSelectThumbnail == cropVideoAfterSelectThumbnail &&
        other.directory == directory &&
        other.imageName == imageName &&
        other.saveNewImageAfterEdit == saveNewImageAfterEdit &&
        other.allowSlideSelect == allowSlideSelect &&
        other.autoScrollWhenSlideSelectIsActive ==
            autoScrollWhenSlideSelectIsActive &&
        other.autoScrollMaxSpeed == autoScrollMaxSpeed &&
        other.allowDragSelect == allowDragSelect &&
        other.allowSelectOriginal == allowSelectOriginal &&
        other.alwaysRequestOriginal == alwaysRequestOriginal &&
        other.showOriginalSizeWhenSelectOriginal ==
            showOriginalSizeWhenSelectOriginal &&
        other.allowPreviewPhotos == allowPreviewPhotos &&
        other.showPreviewButtonInAlbum == showPreviewButtonInAlbum &&
        other.showSelectCountOnDoneButton == showSelectCountOnDoneButton &&
        other.showSelectButtonWhenSingleSelect ==
            showSelectButtonWhenSingleSelect &&
        other.showSelectedIndex == showSelectedIndex &&
        other.maxEditVideoDuration == maxEditVideoDuration &&
        other.maxSelectVideoDuration == maxSelectVideoDuration &&
        other.minSelectVideoDuration == minSelectVideoDuration &&
        other.maxSelectVideoDataSizeKB == maxSelectVideoDataSizeKB &&
        other.minSelectVideoDataSizeKB == minSelectVideoDataSizeKB &&
        other.thumbnailPrefix == thumbnailPrefix &&
        other.thumbnailWidth == thumbnailWidth &&
        other.useCustomCamera == useCustomCamera;
  }

  @override
  int get hashCode =>
      maxSelectCount.hashCode ^
      maxVideoSelectCount.hashCode ^
      minVideoSelectCount.hashCode ^
      allowMixSelect.hashCode ^
      maxPreviewCount.hashCode ^
      initialIndex.hashCode ^
      allowSelectImage.hashCode ^
      allowSelectVideo.hashCode ^
      downloadVideoBeforeSelecting.hashCode ^
      // TODO allowSelectGif.hashCode ^ // Implement this in the future.
      allowSelectLivePhoto.hashCode ^
      allowTakePhotoInLibrary.hashCode ^
      callbackDirectlyAfterTakingPhoto.hashCode ^
      allowEditImage.hashCode ^
      allowEditVideo.hashCode ^
      editAfterSelectThumbnailImage.hashCode ^
      cropVideoAfterSelectThumbnail.hashCode ^
      directory.hashCode ^
      imageName.hashCode ^
      saveNewImageAfterEdit.hashCode ^
      allowSlideSelect.hashCode ^
      autoScrollWhenSlideSelectIsActive.hashCode ^
      autoScrollMaxSpeed.hashCode ^
      allowDragSelect.hashCode ^
      allowSelectOriginal.hashCode ^
      alwaysRequestOriginal.hashCode ^
      showOriginalSizeWhenSelectOriginal.hashCode ^
      allowPreviewPhotos.hashCode ^
      showPreviewButtonInAlbum.hashCode ^
      showSelectCountOnDoneButton.hashCode ^
      showSelectButtonWhenSingleSelect.hashCode ^
      showSelectedIndex.hashCode ^
      maxEditVideoDuration.hashCode ^
      maxSelectVideoDuration.hashCode ^
      minSelectVideoDuration.hashCode ^
      maxSelectVideoDataSizeKB.hashCode ^
      minSelectVideoDataSizeKB.hashCode ^
      thumbnailPrefix.hashCode ^
      thumbnailWidth.hashCode ^
      useCustomCamera.hashCode;
}
