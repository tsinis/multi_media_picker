// Copyright 2025 Roman Cinis. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v24.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Sendable?

  init(code: String, message: String?, details: Sendable?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum CaptureSessionPreset: Int {
  case cif352x288 = 0
  case vga640x480 = 1
  case hd1280x720 = 2
  case hd1920x1080 = 3
  case hd4K3840x2160 = 4
  case photo = 5
}

enum EditTool: Int {
  case draw = 0
  case clip = 1
  case imageSticker = 2
  case textSticker = 3
  case mosaic = 4
  case filter = 5
  case adjust = 6
}

enum UiLocale: Int {
  case system = 0
  case chineseSimplified = 1
  case chineseTraditional = 2
  case english = 3
  case japanese = 4
  case french = 5
  case german = 6
  case russian = 7
  case vietnamese = 8
  case korean = 9
  case malay = 10
  case italian = 11
  case indonesian = 12
  case portuguese = 13
  case spanish = 14
  case turkish = 15
  case arabic = 16
  case dutch = 17
}

enum AdjustSliderType: Int {
  case vertical = 0
  case horizontal = 1
}

enum AdjustTool: Int {
  case brightness = 0
  case contrast = 1
  case saturation = 2
}

enum CancelButtonStyle: Int {
  case text = 0
  case image = 1
}

enum DevicePosition: Int {
  case back = 0
  case front = 1
}

enum ExposureMode: Int {
  case autoExpose = 0
  case continuousAutoExposure = 1
}

enum FocusMode: Int {
  case autoFocus = 0
  case continuousAutoFocus = 1
}

enum HudStyle: Int {
  case light = 0
  case lightBlur = 1
  case dark = 2
  case darkBlur = 3
}

enum ImpactFeedbackStyle: Int {
  case light = 0
  case medium = 1
  case heavy = 2
}

enum MediaType: Int {
  case image = 0
  case video = 1
}

enum PhotoBrowserStyle: Int {
  case embedAlbumList = 0
  case externalAlbumList = 1
}

enum VideoExportType: Int {
  case mov = 0
  case mp4 = 1
}

enum VideoStabilization: Int {
  case off = 0
  case standard = 1
  case cinematic = 2
  case cinematicExtended = 3
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawOverlayImage {
  var path: String
  var isAsset: Bool
  var opacity: Double
  var rotationAngle: Double
  var tintColor: Int64


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawOverlayImage? {
    let path = pigeonVar_list[0] as! String
    let isAsset = pigeonVar_list[1] as! Bool
    let opacity = pigeonVar_list[2] as! Double
    let rotationAngle = pigeonVar_list[3] as! Double
    let tintColor = pigeonVar_list[4] as! Int64

    return RawOverlayImage(
      path: path,
      isAsset: isAsset,
      opacity: opacity,
      rotationAngle: rotationAngle,
      tintColor: tintColor
    )
  }
  func toList() -> [Any?] {
    return [
      path,
      isAsset,
      opacity,
      rotationAngle,
      tintColor,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawUiConfiguration {
  var sortAscending: Bool
  var style: PhotoBrowserStyle
  var isDarkStatusBarStyle: Bool? = nil
  var navCancelButtonStyle: CancelButtonStyle
  var showStatusBarInPreviewInterface: Bool
  var hudStyle: HudStyle
  var adjustSliderType: AdjustSliderType
  var cellCornerRadio: Double
  var columnCount: Int64
  var minimumItemSpacing: Double
  var minimumLineSpacing: Double
  var animateSelectButtonWhenSelectInThumbnail: Bool
  var animateSelectButtonWhenSelectInPreview: Bool
  var selectButtonAnimationDuration: Double
  var showIndexOnSelectButton: Bool
  var showScrollToBottomButton: Bool
  var showCaptureImageOnTakePhotoButton: Bool
  var showSelectedMask: Bool
  var showSelectedBorder: Bool
  var showInvalidMask: Bool
  var showSelectedPhotoPreview: Bool
  var showAddPhotoButton: Bool
  var showEnterSettingTips: Bool
  var shouldCenterTools: Bool
  var timeout: Double
  var languageType: UiLocale
  var themeFontName: String? = nil
  var themeColor: Int64


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawUiConfiguration? {
    let sortAscending = pigeonVar_list[0] as! Bool
    let style = pigeonVar_list[1] as! PhotoBrowserStyle
    let isDarkStatusBarStyle: Bool? = nilOrValue(pigeonVar_list[2])
    let navCancelButtonStyle = pigeonVar_list[3] as! CancelButtonStyle
    let showStatusBarInPreviewInterface = pigeonVar_list[4] as! Bool
    let hudStyle = pigeonVar_list[5] as! HudStyle
    let adjustSliderType = pigeonVar_list[6] as! AdjustSliderType
    let cellCornerRadio = pigeonVar_list[7] as! Double
    let columnCount = pigeonVar_list[8] as! Int64
    let minimumItemSpacing = pigeonVar_list[9] as! Double
    let minimumLineSpacing = pigeonVar_list[10] as! Double
    let animateSelectButtonWhenSelectInThumbnail = pigeonVar_list[11] as! Bool
    let animateSelectButtonWhenSelectInPreview = pigeonVar_list[12] as! Bool
    let selectButtonAnimationDuration = pigeonVar_list[13] as! Double
    let showIndexOnSelectButton = pigeonVar_list[14] as! Bool
    let showScrollToBottomButton = pigeonVar_list[15] as! Bool
    let showCaptureImageOnTakePhotoButton = pigeonVar_list[16] as! Bool
    let showSelectedMask = pigeonVar_list[17] as! Bool
    let showSelectedBorder = pigeonVar_list[18] as! Bool
    let showInvalidMask = pigeonVar_list[19] as! Bool
    let showSelectedPhotoPreview = pigeonVar_list[20] as! Bool
    let showAddPhotoButton = pigeonVar_list[21] as! Bool
    let showEnterSettingTips = pigeonVar_list[22] as! Bool
    let shouldCenterTools = pigeonVar_list[23] as! Bool
    let timeout = pigeonVar_list[24] as! Double
    let languageType = pigeonVar_list[25] as! UiLocale
    let themeFontName: String? = nilOrValue(pigeonVar_list[26])
    let themeColor = pigeonVar_list[27] as! Int64

    return RawUiConfiguration(
      sortAscending: sortAscending,
      style: style,
      isDarkStatusBarStyle: isDarkStatusBarStyle,
      navCancelButtonStyle: navCancelButtonStyle,
      showStatusBarInPreviewInterface: showStatusBarInPreviewInterface,
      hudStyle: hudStyle,
      adjustSliderType: adjustSliderType,
      cellCornerRadio: cellCornerRadio,
      columnCount: columnCount,
      minimumItemSpacing: minimumItemSpacing,
      minimumLineSpacing: minimumLineSpacing,
      animateSelectButtonWhenSelectInThumbnail: animateSelectButtonWhenSelectInThumbnail,
      animateSelectButtonWhenSelectInPreview: animateSelectButtonWhenSelectInPreview,
      selectButtonAnimationDuration: selectButtonAnimationDuration,
      showIndexOnSelectButton: showIndexOnSelectButton,
      showScrollToBottomButton: showScrollToBottomButton,
      showCaptureImageOnTakePhotoButton: showCaptureImageOnTakePhotoButton,
      showSelectedMask: showSelectedMask,
      showSelectedBorder: showSelectedBorder,
      showInvalidMask: showInvalidMask,
      showSelectedPhotoPreview: showSelectedPhotoPreview,
      showAddPhotoButton: showAddPhotoButton,
      showEnterSettingTips: showEnterSettingTips,
      shouldCenterTools: shouldCenterTools,
      timeout: timeout,
      languageType: languageType,
      themeFontName: themeFontName,
      themeColor: themeColor
    )
  }
  func toList() -> [Any?] {
    return [
      sortAscending,
      style,
      isDarkStatusBarStyle,
      navCancelButtonStyle,
      showStatusBarInPreviewInterface,
      hudStyle,
      adjustSliderType,
      cellCornerRadio,
      columnCount,
      minimumItemSpacing,
      minimumLineSpacing,
      animateSelectButtonWhenSelectInThumbnail,
      animateSelectButtonWhenSelectInPreview,
      selectButtonAnimationDuration,
      showIndexOnSelectButton,
      showScrollToBottomButton,
      showCaptureImageOnTakePhotoButton,
      showSelectedMask,
      showSelectedBorder,
      showInvalidMask,
      showSelectedPhotoPreview,
      showAddPhotoButton,
      showEnterSettingTips,
      shouldCenterTools,
      timeout,
      languageType,
      themeFontName,
      themeColor,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct ClipAspectRatio {
  var aspectRatioX: Int64
  var aspectRatioY: Int64


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> ClipAspectRatio? {
    let aspectRatioX = pigeonVar_list[0] as! Int64
    let aspectRatioY = pigeonVar_list[1] as! Int64

    return ClipAspectRatio(
      aspectRatioX: aspectRatioX,
      aspectRatioY: aspectRatioY
    )
  }
  func toList() -> [Any?] {
    return [
      aspectRatioX,
      aspectRatioY,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct ClipOptions {
  var isCircle: Bool
  var aspectRatio: ClipAspectRatio? = nil


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> ClipOptions? {
    let isCircle = pigeonVar_list[0] as! Bool
    let aspectRatio: ClipAspectRatio? = nilOrValue(pigeonVar_list[1])

    return ClipOptions(
      isCircle: isCircle,
      aspectRatio: aspectRatio
    )
  }
  func toList() -> [Any?] {
    return [
      isCircle,
      aspectRatio,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawMediaData {
  var path: String
  var thumbPath: String? = nil
  var type: MediaType
  var duration: Int64? = nil


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawMediaData? {
    let path = pigeonVar_list[0] as! String
    let thumbPath: String? = nilOrValue(pigeonVar_list[1])
    let type = pigeonVar_list[2] as! MediaType
    let duration: Int64? = nilOrValue(pigeonVar_list[3])

    return RawMediaData(
      path: path,
      thumbPath: thumbPath,
      type: type,
      duration: duration
    )
  }
  func toList() -> [Any?] {
    return [
      path,
      thumbPath,
      type,
      duration,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawPickerConfiguration {
  var maxSelectCount: Int64
  var maxVideoSelectCount: Int64
  var minVideoSelectCount: Int64
  var allowMixSelect: Bool
  var maxPreviewCount: Int64
  var initialIndex: Int64
  var allowSelectImage: Bool
  var allowSelectVideo: Bool
  var downloadVideoBeforeSelecting: Bool
  var allowSelectGif: Bool
  var allowSelectLivePhoto: Bool
  var allowTakePhotoInLibrary: Bool
  var callbackDirectlyAfterTakingPhoto: Bool
  var allowEditImage: Bool
  var allowEditVideo: Bool
  var editAfterSelectThumbnailImage: Bool
  var cropVideoAfterSelectThumbnail: Bool
  var saveNewImageAfterEdit: Bool
  var allowSlideSelect: Bool
  var autoScrollWhenSlideSelectIsActive: Bool
  var autoScrollMaxSpeed: Double
  var allowDragSelect: Bool
  var allowSelectOriginal: Bool
  var alwaysRequestOriginal: Bool
  var showOriginalSizeWhenSelectOriginal: Bool
  var allowPreviewPhotos: Bool
  var showPreviewButtonInAlbum: Bool
  var showSelectCountOnDoneButton: Bool
  var showSelectButtonWhenSingleSelect: Bool
  var showSelectedIndex: Bool
  var thumbnailPrefix: String
  var thumbnailWidth: Int64
  var maxEditVideoDurationSeconds: Int64
  var maxSelectVideoDurationSeconds: Int64
  var minSelectVideoDurationSeconds: Int64
  var maxSelectVideoDataSizeKB: Double? = nil
  var minSelectVideoDataSizeKB: Double
  var useCustomCamera: Bool
  var directoryPath: String? = nil
  var filename: String? = nil


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawPickerConfiguration? {
    let maxSelectCount = pigeonVar_list[0] as! Int64
    let maxVideoSelectCount = pigeonVar_list[1] as! Int64
    let minVideoSelectCount = pigeonVar_list[2] as! Int64
    let allowMixSelect = pigeonVar_list[3] as! Bool
    let maxPreviewCount = pigeonVar_list[4] as! Int64
    let initialIndex = pigeonVar_list[5] as! Int64
    let allowSelectImage = pigeonVar_list[6] as! Bool
    let allowSelectVideo = pigeonVar_list[7] as! Bool
    let downloadVideoBeforeSelecting = pigeonVar_list[8] as! Bool
    let allowSelectGif = pigeonVar_list[9] as! Bool
    let allowSelectLivePhoto = pigeonVar_list[10] as! Bool
    let allowTakePhotoInLibrary = pigeonVar_list[11] as! Bool
    let callbackDirectlyAfterTakingPhoto = pigeonVar_list[12] as! Bool
    let allowEditImage = pigeonVar_list[13] as! Bool
    let allowEditVideo = pigeonVar_list[14] as! Bool
    let editAfterSelectThumbnailImage = pigeonVar_list[15] as! Bool
    let cropVideoAfterSelectThumbnail = pigeonVar_list[16] as! Bool
    let saveNewImageAfterEdit = pigeonVar_list[17] as! Bool
    let allowSlideSelect = pigeonVar_list[18] as! Bool
    let autoScrollWhenSlideSelectIsActive = pigeonVar_list[19] as! Bool
    let autoScrollMaxSpeed = pigeonVar_list[20] as! Double
    let allowDragSelect = pigeonVar_list[21] as! Bool
    let allowSelectOriginal = pigeonVar_list[22] as! Bool
    let alwaysRequestOriginal = pigeonVar_list[23] as! Bool
    let showOriginalSizeWhenSelectOriginal = pigeonVar_list[24] as! Bool
    let allowPreviewPhotos = pigeonVar_list[25] as! Bool
    let showPreviewButtonInAlbum = pigeonVar_list[26] as! Bool
    let showSelectCountOnDoneButton = pigeonVar_list[27] as! Bool
    let showSelectButtonWhenSingleSelect = pigeonVar_list[28] as! Bool
    let showSelectedIndex = pigeonVar_list[29] as! Bool
    let thumbnailPrefix = pigeonVar_list[30] as! String
    let thumbnailWidth = pigeonVar_list[31] as! Int64
    let maxEditVideoDurationSeconds = pigeonVar_list[32] as! Int64
    let maxSelectVideoDurationSeconds = pigeonVar_list[33] as! Int64
    let minSelectVideoDurationSeconds = pigeonVar_list[34] as! Int64
    let maxSelectVideoDataSizeKB: Double? = nilOrValue(pigeonVar_list[35])
    let minSelectVideoDataSizeKB = pigeonVar_list[36] as! Double
    let useCustomCamera = pigeonVar_list[37] as! Bool
    let directoryPath: String? = nilOrValue(pigeonVar_list[38])
    let filename: String? = nilOrValue(pigeonVar_list[39])

    return RawPickerConfiguration(
      maxSelectCount: maxSelectCount,
      maxVideoSelectCount: maxVideoSelectCount,
      minVideoSelectCount: minVideoSelectCount,
      allowMixSelect: allowMixSelect,
      maxPreviewCount: maxPreviewCount,
      initialIndex: initialIndex,
      allowSelectImage: allowSelectImage,
      allowSelectVideo: allowSelectVideo,
      downloadVideoBeforeSelecting: downloadVideoBeforeSelecting,
      allowSelectGif: allowSelectGif,
      allowSelectLivePhoto: allowSelectLivePhoto,
      allowTakePhotoInLibrary: allowTakePhotoInLibrary,
      callbackDirectlyAfterTakingPhoto: callbackDirectlyAfterTakingPhoto,
      allowEditImage: allowEditImage,
      allowEditVideo: allowEditVideo,
      editAfterSelectThumbnailImage: editAfterSelectThumbnailImage,
      cropVideoAfterSelectThumbnail: cropVideoAfterSelectThumbnail,
      saveNewImageAfterEdit: saveNewImageAfterEdit,
      allowSlideSelect: allowSlideSelect,
      autoScrollWhenSlideSelectIsActive: autoScrollWhenSlideSelectIsActive,
      autoScrollMaxSpeed: autoScrollMaxSpeed,
      allowDragSelect: allowDragSelect,
      allowSelectOriginal: allowSelectOriginal,
      alwaysRequestOriginal: alwaysRequestOriginal,
      showOriginalSizeWhenSelectOriginal: showOriginalSizeWhenSelectOriginal,
      allowPreviewPhotos: allowPreviewPhotos,
      showPreviewButtonInAlbum: showPreviewButtonInAlbum,
      showSelectCountOnDoneButton: showSelectCountOnDoneButton,
      showSelectButtonWhenSingleSelect: showSelectButtonWhenSingleSelect,
      showSelectedIndex: showSelectedIndex,
      thumbnailPrefix: thumbnailPrefix,
      thumbnailWidth: thumbnailWidth,
      maxEditVideoDurationSeconds: maxEditVideoDurationSeconds,
      maxSelectVideoDurationSeconds: maxSelectVideoDurationSeconds,
      minSelectVideoDurationSeconds: minSelectVideoDurationSeconds,
      maxSelectVideoDataSizeKB: maxSelectVideoDataSizeKB,
      minSelectVideoDataSizeKB: minSelectVideoDataSizeKB,
      useCustomCamera: useCustomCamera,
      directoryPath: directoryPath,
      filename: filename
    )
  }
  func toList() -> [Any?] {
    return [
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
      thumbnailPrefix,
      thumbnailWidth,
      maxEditVideoDurationSeconds,
      maxSelectVideoDurationSeconds,
      minSelectVideoDurationSeconds,
      maxSelectVideoDataSizeKB,
      minSelectVideoDataSizeKB,
      useCustomCamera,
      directoryPath,
      filename,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawEditConfiguration {
  var tools: [EditTool]
  var clipOptions: ClipOptions? = nil
  var adjustTools: [AdjustTool]
  var showClipDirectlyIfOnlyHasClipTool: Bool
  var impactFeedbackWhenAdjustSliderValueIsZero: Bool
  var impactFeedbackStyle: ImpactFeedbackStyle
  var dimClippedAreaDuringAdjustments: Bool
  var minimumZoomScale: Double


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawEditConfiguration? {
    let tools = pigeonVar_list[0] as! [EditTool]
    let clipOptions: ClipOptions? = nilOrValue(pigeonVar_list[1])
    let adjustTools = pigeonVar_list[2] as! [AdjustTool]
    let showClipDirectlyIfOnlyHasClipTool = pigeonVar_list[3] as! Bool
    let impactFeedbackWhenAdjustSliderValueIsZero = pigeonVar_list[4] as! Bool
    let impactFeedbackStyle = pigeonVar_list[5] as! ImpactFeedbackStyle
    let dimClippedAreaDuringAdjustments = pigeonVar_list[6] as! Bool
    let minimumZoomScale = pigeonVar_list[7] as! Double

    return RawEditConfiguration(
      tools: tools,
      clipOptions: clipOptions,
      adjustTools: adjustTools,
      showClipDirectlyIfOnlyHasClipTool: showClipDirectlyIfOnlyHasClipTool,
      impactFeedbackWhenAdjustSliderValueIsZero: impactFeedbackWhenAdjustSliderValueIsZero,
      impactFeedbackStyle: impactFeedbackStyle,
      dimClippedAreaDuringAdjustments: dimClippedAreaDuringAdjustments,
      minimumZoomScale: minimumZoomScale
    )
  }
  func toList() -> [Any?] {
    return [
      tools,
      clipOptions,
      adjustTools,
      showClipDirectlyIfOnlyHasClipTool,
      impactFeedbackWhenAdjustSliderValueIsZero,
      impactFeedbackStyle,
      dimClippedAreaDuringAdjustments,
      minimumZoomScale,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct RawCameraConfiguration {
  var allowTakePhoto: Bool
  var allowRecordVideo: Bool
  var minDurationSeconds: Int64
  var maxDurationSeconds: Int64
  var isFrontVideoMirrored: Bool
  var sessionPreset: CaptureSessionPreset
  var focusMode: FocusMode
  var exposureMode: ExposureMode
  var showFlashSwitch: Bool
  var allowSwitchCamera: Bool
  var tapToRecordVideo: Bool
  var enableWideCameras: Bool
  var videoExportType: VideoExportType
  var devicePosition: DevicePosition
  var overlayImage: RawOverlayImage? = nil
  var videoStabilization: VideoStabilization? = nil


  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> RawCameraConfiguration? {
    let allowTakePhoto = pigeonVar_list[0] as! Bool
    let allowRecordVideo = pigeonVar_list[1] as! Bool
    let minDurationSeconds = pigeonVar_list[2] as! Int64
    let maxDurationSeconds = pigeonVar_list[3] as! Int64
    let isFrontVideoMirrored = pigeonVar_list[4] as! Bool
    let sessionPreset = pigeonVar_list[5] as! CaptureSessionPreset
    let focusMode = pigeonVar_list[6] as! FocusMode
    let exposureMode = pigeonVar_list[7] as! ExposureMode
    let showFlashSwitch = pigeonVar_list[8] as! Bool
    let allowSwitchCamera = pigeonVar_list[9] as! Bool
    let tapToRecordVideo = pigeonVar_list[10] as! Bool
    let enableWideCameras = pigeonVar_list[11] as! Bool
    let videoExportType = pigeonVar_list[12] as! VideoExportType
    let devicePosition = pigeonVar_list[13] as! DevicePosition
    let overlayImage: RawOverlayImage? = nilOrValue(pigeonVar_list[14])
    let videoStabilization: VideoStabilization? = nilOrValue(pigeonVar_list[15])

    return RawCameraConfiguration(
      allowTakePhoto: allowTakePhoto,
      allowRecordVideo: allowRecordVideo,
      minDurationSeconds: minDurationSeconds,
      maxDurationSeconds: maxDurationSeconds,
      isFrontVideoMirrored: isFrontVideoMirrored,
      sessionPreset: sessionPreset,
      focusMode: focusMode,
      exposureMode: exposureMode,
      showFlashSwitch: showFlashSwitch,
      allowSwitchCamera: allowSwitchCamera,
      tapToRecordVideo: tapToRecordVideo,
      enableWideCameras: enableWideCameras,
      videoExportType: videoExportType,
      devicePosition: devicePosition,
      overlayImage: overlayImage,
      videoStabilization: videoStabilization
    )
  }
  func toList() -> [Any?] {
    return [
      allowTakePhoto,
      allowRecordVideo,
      minDurationSeconds,
      maxDurationSeconds,
      isFrontVideoMirrored,
      sessionPreset,
      focusMode,
      exposureMode,
      showFlashSwitch,
      allowSwitchCamera,
      tapToRecordVideo,
      enableWideCameras,
      videoExportType,
      devicePosition,
      overlayImage,
      videoStabilization,
    ]
  }
}

private class MessagesPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return CaptureSessionPreset(rawValue: enumResultAsInt)
      }
      return nil
    case 130:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return EditTool(rawValue: enumResultAsInt)
      }
      return nil
    case 131:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return UiLocale(rawValue: enumResultAsInt)
      }
      return nil
    case 132:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return AdjustSliderType(rawValue: enumResultAsInt)
      }
      return nil
    case 133:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return AdjustTool(rawValue: enumResultAsInt)
      }
      return nil
    case 134:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return CancelButtonStyle(rawValue: enumResultAsInt)
      }
      return nil
    case 135:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return DevicePosition(rawValue: enumResultAsInt)
      }
      return nil
    case 136:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return ExposureMode(rawValue: enumResultAsInt)
      }
      return nil
    case 137:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return FocusMode(rawValue: enumResultAsInt)
      }
      return nil
    case 138:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return HudStyle(rawValue: enumResultAsInt)
      }
      return nil
    case 139:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return ImpactFeedbackStyle(rawValue: enumResultAsInt)
      }
      return nil
    case 140:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return MediaType(rawValue: enumResultAsInt)
      }
      return nil
    case 141:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return PhotoBrowserStyle(rawValue: enumResultAsInt)
      }
      return nil
    case 142:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return VideoExportType(rawValue: enumResultAsInt)
      }
      return nil
    case 143:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return VideoStabilization(rawValue: enumResultAsInt)
      }
      return nil
    case 144:
      return RawOverlayImage.fromList(self.readValue() as! [Any?])
    case 145:
      return RawUiConfiguration.fromList(self.readValue() as! [Any?])
    case 146:
      return ClipAspectRatio.fromList(self.readValue() as! [Any?])
    case 147:
      return ClipOptions.fromList(self.readValue() as! [Any?])
    case 148:
      return RawMediaData.fromList(self.readValue() as! [Any?])
    case 149:
      return RawPickerConfiguration.fromList(self.readValue() as! [Any?])
    case 150:
      return RawEditConfiguration.fromList(self.readValue() as! [Any?])
    case 151:
      return RawCameraConfiguration.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class MessagesPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? CaptureSessionPreset {
      super.writeByte(129)
      super.writeValue(value.rawValue)
    } else if let value = value as? EditTool {
      super.writeByte(130)
      super.writeValue(value.rawValue)
    } else if let value = value as? UiLocale {
      super.writeByte(131)
      super.writeValue(value.rawValue)
    } else if let value = value as? AdjustSliderType {
      super.writeByte(132)
      super.writeValue(value.rawValue)
    } else if let value = value as? AdjustTool {
      super.writeByte(133)
      super.writeValue(value.rawValue)
    } else if let value = value as? CancelButtonStyle {
      super.writeByte(134)
      super.writeValue(value.rawValue)
    } else if let value = value as? DevicePosition {
      super.writeByte(135)
      super.writeValue(value.rawValue)
    } else if let value = value as? ExposureMode {
      super.writeByte(136)
      super.writeValue(value.rawValue)
    } else if let value = value as? FocusMode {
      super.writeByte(137)
      super.writeValue(value.rawValue)
    } else if let value = value as? HudStyle {
      super.writeByte(138)
      super.writeValue(value.rawValue)
    } else if let value = value as? ImpactFeedbackStyle {
      super.writeByte(139)
      super.writeValue(value.rawValue)
    } else if let value = value as? MediaType {
      super.writeByte(140)
      super.writeValue(value.rawValue)
    } else if let value = value as? PhotoBrowserStyle {
      super.writeByte(141)
      super.writeValue(value.rawValue)
    } else if let value = value as? VideoExportType {
      super.writeByte(142)
      super.writeValue(value.rawValue)
    } else if let value = value as? VideoStabilization {
      super.writeByte(143)
      super.writeValue(value.rawValue)
    } else if let value = value as? RawOverlayImage {
      super.writeByte(144)
      super.writeValue(value.toList())
    } else if let value = value as? RawUiConfiguration {
      super.writeByte(145)
      super.writeValue(value.toList())
    } else if let value = value as? ClipAspectRatio {
      super.writeByte(146)
      super.writeValue(value.toList())
    } else if let value = value as? ClipOptions {
      super.writeByte(147)
      super.writeValue(value.toList())
    } else if let value = value as? RawMediaData {
      super.writeByte(148)
      super.writeValue(value.toList())
    } else if let value = value as? RawPickerConfiguration {
      super.writeByte(149)
      super.writeValue(value.toList())
    } else if let value = value as? RawEditConfiguration {
      super.writeByte(150)
      super.writeValue(value.toList())
    } else if let value = value as? RawCameraConfiguration {
      super.writeByte(151)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class MessagesPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return MessagesPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return MessagesPigeonCodecWriter(data: data)
  }
}

class MessagesPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = MessagesPigeonCodec(readerWriter: MessagesPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol MultiMediaApi {
  func openCamera(cameraConfig: RawCameraConfiguration, editConfig: RawEditConfiguration, pickerConfig: RawPickerConfiguration, uiConfig: RawUiConfiguration, completion: @escaping (Result<RawMediaData?, Error>) -> Void)
  func editMedia(data: RawMediaData, editConfig: RawEditConfiguration, pickerConfig: RawPickerConfiguration, uiConfig: RawUiConfiguration, completion: @escaping (Result<RawMediaData?, Error>) -> Void)
  func openGallery(editConfig: RawEditConfiguration, pickerConfig: RawPickerConfiguration, uiConfig: RawUiConfiguration, completion: @escaping (Result<[RawMediaData]?, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class MultiMediaApiSetup {
  static var codec: FlutterStandardMessageCodec { MessagesPigeonCodec.shared }
  /// Sets up an instance of `MultiMediaApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: MultiMediaApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let openCameraChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.multi_media_picker.MultiMediaApi.openCamera\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      openCameraChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let cameraConfigArg = args[0] as! RawCameraConfiguration
        let editConfigArg = args[1] as! RawEditConfiguration
        let pickerConfigArg = args[2] as! RawPickerConfiguration
        let uiConfigArg = args[3] as! RawUiConfiguration
        api.openCamera(cameraConfig: cameraConfigArg, editConfig: editConfigArg, pickerConfig: pickerConfigArg, uiConfig: uiConfigArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      openCameraChannel.setMessageHandler(nil)
    }
    let editMediaChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.multi_media_picker.MultiMediaApi.editMedia\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      editMediaChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let dataArg = args[0] as! RawMediaData
        let editConfigArg = args[1] as! RawEditConfiguration
        let pickerConfigArg = args[2] as! RawPickerConfiguration
        let uiConfigArg = args[3] as! RawUiConfiguration
        api.editMedia(data: dataArg, editConfig: editConfigArg, pickerConfig: pickerConfigArg, uiConfig: uiConfigArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      editMediaChannel.setMessageHandler(nil)
    }
    let openGalleryChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.multi_media_picker.MultiMediaApi.openGallery\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      openGalleryChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let editConfigArg = args[0] as! RawEditConfiguration
        let pickerConfigArg = args[1] as! RawPickerConfiguration
        let uiConfigArg = args[2] as! RawUiConfiguration
        api.openGallery(editConfig: editConfigArg, pickerConfig: pickerConfigArg, uiConfig: uiConfigArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      openGalleryChannel.setMessageHandler(nil)
    }
  }
}
