import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../../../model/configs/picker_configuration.dart';

extension PickerConfigurationExtensionInternal on PickerConfiguration {
  RawPickerConfiguration get raw {
    final canUseDirectory = directory?.existsSync() ?? false;

    assert(
      directory == null || canUseDirectory,
      'Provided directory path does not exist: ${directory?.path}',
    );

    return RawPickerConfiguration(
      allowDragSelect: allowDragSelect,
      allowEditImage: allowEditImage,
      allowEditVideo: allowEditVideo,
      allowMixSelect: allowMixSelect,
      allowPreviewPhotos: allowPreviewPhotos,
      allowSelectGif: false, // TODO allowSelectGif, Implement in the future.
      allowSelectImage: allowSelectImage,
      allowSelectLivePhoto: allowSelectLivePhoto,
      allowSelectOriginal: allowSelectOriginal,
      allowSelectVideo: allowSelectVideo,
      allowSlideSelect: allowSlideSelect,
      allowTakePhotoInLibrary: allowTakePhotoInLibrary,
      alwaysRequestOriginal: alwaysRequestOriginal,
      autoScrollMaxSpeed: autoScrollMaxSpeed,
      autoScrollWhenSlideSelectIsActive: autoScrollWhenSlideSelectIsActive,
      callbackDirectlyAfterTakingPhoto: callbackDirectlyAfterTakingPhoto,
      cropVideoAfterSelectThumbnail: cropVideoAfterSelectThumbnail,
      directoryPath: canUseDirectory ? directory?.path : null,
      downloadVideoBeforeSelecting: downloadVideoBeforeSelecting,
      editAfterSelectThumbnailImage: editAfterSelectThumbnailImage,
      filename: filename.isEmpty ? null : filename,
      initialIndex: initialIndex,
      maxEditVideoDurationSeconds: maxEditVideoDuration.inSeconds,
      maxPreviewCount: maxPreviewCount,
      maxSelectCount: maxSelectCount,
      maxSelectVideoDataSizeKB:
          maxSelectVideoDataSizeKB.isNegative ? null : maxSelectVideoDataSizeKB,
      maxSelectVideoDurationSeconds: maxSelectVideoDuration.inSeconds,
      maxVideoSelectCount: maxVideoSelectCount,
      minSelectVideoDataSizeKB: minSelectVideoDataSizeKB,
      minSelectVideoDurationSeconds: minSelectVideoDuration.inSeconds,
      minVideoSelectCount: minVideoSelectCount,
      saveNewImageAfterEdit: saveNewImageAfterEdit,
      showOriginalSizeWhenSelectOriginal: showOriginalSizeWhenSelectOriginal,
      showPreviewButtonInAlbum: showPreviewButtonInAlbum,
      showSelectButtonWhenSingleSelect: showSelectButtonWhenSingleSelect,
      showSelectCountOnDoneButton: showSelectCountOnDoneButton,
      showSelectedIndex: showSelectedIndex,
      thumbnailPrefix: thumbnailPrefix,
      thumbnailWidth: thumbnailWidth,
      useCustomCamera: useCustomCamera,
    );
  }
}
