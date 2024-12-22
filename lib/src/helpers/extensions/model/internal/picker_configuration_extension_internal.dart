import '../../../../messages.g.dart';
import '../../../../model/configs/picker_configuration.dart';

extension PickerConfigurationExtensionInternal on PickerConfiguration {
  RawPickerConfiguration get raw => RawPickerConfiguration(
        allowDragSelect: allowDragSelect,
        allowEditImage: allowEditImage,
        allowEditVideo: allowEditVideo,
        allowMixSelect: allowMixSelect,
        allowPreviewPhotos: allowPreviewPhotos,
        allowSelectGif: allowSelectGif,
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
        directoryPath: directoryPath.isEmpty ? null : directoryPath,
        downloadVideoBeforeSelecting: downloadVideoBeforeSelecting,
        editAfterSelectThumbnailImage: editAfterSelectThumbnailImage,
        imageName: imageName.isEmpty ? null : imageName,
        initialIndex: initialIndex,
        maxEditVideoDurationSeconds: maxEditVideoDuration.inSeconds,
        maxPreviewCount: maxPreviewCount,
        maxSelectCount: maxSelectCount,
        maxSelectVideoDataSizeKB: maxSelectVideoDataSizeKB.isNegative
            ? null
            : maxSelectVideoDataSizeKB,
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
