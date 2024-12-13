import UIKit
import ZLPhotoBrowser

extension ZLPhotoConfiguration {
  func updateCameraConfiguration(from config: RawCameraConfiguration) {
    let this = self.cameraConfiguration

    this.allowRecordVideo = config.allowRecordVideo
    this.allowSwitchCamera = config.allowSwitchCamera
    this.allowTakePhoto = config.allowTakePhoto
    this.isVideoMirrored = config.isFrontVideoMirrored
    this.maxRecordDuration = Int(config.maxDurationSeconds)
    this.minRecordDuration = Int(config.minDurationSeconds)
    this.showFlashSwitch = config.showFlashSwitch
    //  this.enableWideCameras = config.enableWideCameras // TODO!
    //  this.tapToRecordVideo = config.tapToRecordVideo // TODO!
    this.videoExportType =
      ZLCameraConfiguration.VideoExportType(rawValue: config.videoExportType.rawValue) ?? .mp4
    this.devicePosition =
      ZLCameraConfiguration.DevicePosition(rawValue: config.devicePosition.rawValue) ?? .back
    this.focusMode =
      ZLCameraConfiguration.FocusMode(rawValue: config.focusMode.rawValue) ?? .continuousAutoFocus

    this.exposureMode =
      ZLCameraConfiguration.ExposureMode(rawValue: config.exposureMode.rawValue)
      ?? .continuousAutoExposure

    this.sessionPreset =
      ZLCameraConfiguration.CaptureSessionPreset(rawValue: config.sessionPreset.rawValue)
      ?? .hd1920x1080
  }

  func updatePickerConfiguration(from config: RawPickerConfiguration) {
    self.allowDragSelect = config.allowDragSelect
    self.allowEditImage = config.allowEditImage
    self.allowEditVideo = config.allowEditVideo
    self.allowMixSelect = config.allowMixSelect
    self.allowPreviewPhotos = config.allowPreviewPhotos
    self.allowSelectGif = config.allowSelectGif
    self.allowSelectImage = config.allowSelectImage
    self.allowSelectLivePhoto = config.allowSelectLivePhoto
    self.allowSelectOriginal = config.allowSelectOriginal
    self.allowSelectVideo = config.allowSelectVideo
    self.allowSlideSelect = config.allowSlideSelect
    self.allowTakePhotoInLibrary = config.allowTakePhotoInLibrary
    self.alwaysRequestOriginal = config.alwaysRequestOriginal
    self.autoScrollMaxSpeed = CGFloat(config.autoScrollMaxSpeed)
    self.autoScrollWhenSlideSelectIsActive = config.autoScrollWhenSlideSelectIsActive
    self.callbackDirectlyAfterTakingPhoto = config.callbackDirectlyAfterTakingPhoto
    self.cropVideoAfterSelectThumbnail = config.cropVideoAfterSelectThumbnail
    self.downloadVideoBeforeSelecting = config.downloadVideoBeforeSelecting
    self.editAfterSelectThumbnailImage = config.editAfterSelectThumbnailImage
    self.initialIndex = Int(config.initialIndex)
    self.maxEditVideoTime = Int(config.maxEditVideoDurationSeconds)
    self.maxPreviewCount = Int(config.maxPreviewCount)
    self.maxSelectCount = Int(config.maxSelectCount)
    self.maxSelectVideoDataSize = CGFloat(
      config.maxSelectVideoDataSizeKB ?? .greatestFiniteMagnitude)
    self.maxSelectVideoDuration = Int(config.maxSelectVideoDurationSeconds)
    self.maxVideoSelectCount = Int(config.maxVideoSelectCount)
    self.minSelectVideoDataSize = CGFloat(config.minSelectVideoDataSizeKB)
    self.minSelectVideoDuration = Int(config.minSelectVideoDurationSeconds)
    self.minVideoSelectCount = Int(config.minVideoSelectCount)
    self.saveNewImageAfterEdit = config.saveNewImageAfterEdit
    self.showOriginalSizeWhenSelectOriginal = config.showOriginalSizeWhenSelectOriginal
    self.showPreviewButtonInAlbum = config.showPreviewButtonInAlbum
    self.showSelectBtnWhenSingleSelect = config.showSelectButtonWhenSingleSelect
    self.showSelectCountOnDoneBtn = config.showSelectCountOnDoneButton
    self.showSelectedIndex = config.showSelectedIndex
    self.useCustomCamera = config.useCustomCamera
  }

  func updateEditConfiguration(from config: RawEditConfiguration) {
    let this = self.editImageConfiguration

    this.minimumZoomScale = CGFloat(config.minimumZoomScale)
    this.dimClippedAreaDuringAdjustments = config.dimClippedAreaDuringAdjustments
    this.showClipDirectlyIfOnlyHasClipTool = config.showClipDirectlyIfOnlyHasClipTool
    this.impactFeedbackWhenAdjustSliderValueIsZero =
      config.impactFeedbackWhenAdjustSliderValueIsZero

    this.impactFeedbackStyle =
      UIImpactFeedbackGenerator.FeedbackStyle(rawValue: config.impactFeedbackStyle.rawValue)
      ?? .medium

    if !config.tools.isEmpty {
      this.tools = config.tools.compactMap {
        ZLEditImageConfiguration.EditTool(rawValue: $0.rawValue)
      }
    }

    if !config.adjustTools.isEmpty {
      this.adjustTools = config.adjustTools.compactMap {
        ZLEditImageConfiguration.AdjustTool(rawValue: $0.rawValue)
      }
    }

    if let cropOption = config.clipOptions {
      if cropOption.isCircle {
        this.clipRatios = [ZLImageClipRatio.circle]
      } else if let aspectRatio = cropOption.aspectRatio {
        this.clipRatios = [
          ZLImageClipRatio(
            title: "",
            whRatio: CGFloat(aspectRatio.aspectRatioX) / CGFloat(aspectRatio.aspectRatioY)
          )
        ]
      }
    }

  }
}
