// swiftlint:disable file_length

import AVFoundation
import Flutter
import Photos
import UIKit
import ZLPhotoBrowser

// swiftlint:disable:next type_body_length
public final class MultiMediaPickerPlugin: NSObject, FlutterPlugin, MultiMediaApi {
  private var registrar: FlutterPluginRegistrar?

  public init(registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
    super.init()
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let plugin = MultiMediaPickerPlugin(registrar: registrar)
    MultiMediaApiSetup.setUp(binaryMessenger: registrar.messenger(), api: plugin)
    registrar.publish(plugin)
  }

  private var nearestViewController: UIViewController? {
    UIApplication.shared.keyWindow?.rootViewController?.nearestViewController
  }

  func openCamera(
    cameraConfig: RawCameraConfiguration,
    editConfig: RawEditConfiguration,
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    getNearestViewController { result in
      switch result {
      case .failure(let viewControllerError): completion(.failure(viewControllerError))

      case .success(let viewController):
        let camera = ZLCustomCamera()
        self.applyConfigs(
          pickerConfig: pickerConfig,
          uiConfig: uiConfig,
          cameraConfig: cameraConfig,
          editConfig: editConfig
        )

        if let registrar = self.registrar {
          self.showOverlayImage(cameraConfig.overlayImage, registrar: registrar)
        }

        camera.cancelBlock = { completion(.success(nil)) }  // On cancel button tap.

        camera.takeDoneBlock = { image, video in  // On done button tap.
          var mediaData: RawMediaData?

          if let image {
            mediaData = self.resolveImage(image: image, picker: pickerConfig)
          } else if let video {
            mediaData = self.resolveVideo(url: video, picker: pickerConfig)
          }

          completion(.success(mediaData))
        }

        viewController.showDetailViewController(camera, sender: nil)
      }
    }
  }

  func editMedia(
    data: RawMediaData,
    editConfig: RawEditConfiguration,
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    getNearestViewController { result in
      switch result {
      case .failure(let viewControllerError): completion(.failure(viewControllerError))

      case .success(let viewController):
        self.applyConfigs(pickerConfig: pickerConfig, uiConfig: uiConfig, editConfig: editConfig)
        switch data.type {
        case .video:
          self.editVideo(data, viewController, pickerConfig: pickerConfig, completion: completion)

        case .image:
          self.editImage(data, viewController, pickerConfig: pickerConfig, completion: completion)
        }
      }
    }
  }
  // swiftlint:disable function_body_length
  // swiftlint:disable:next cyclomatic_complexity
  func openGallery(
    editConfig: RawEditConfiguration,
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
    // swiftlint:disable:next discouraged_optional_collection
    completion: @escaping (Result<[RawMediaData]?, Error>) -> Void
  ) {
    // swiftlint:disable:next closure_body_length
    getNearestViewController { result in
      switch result {
      case .failure(let viewControllerError): completion(.failure(viewControllerError))

      case .success(let viewController):
        let photoSheet = ZLPhotoPreviewSheet()
        self.applyConfigs(pickerConfig: pickerConfig, uiConfig: uiConfig, editConfig: editConfig)

        // swiftlint:disable:next closure_body_length
        photoSheet.selectImageBlock = { [weak self] results, _ in
          guard let self else { return completion(.success(nil)) }

          let group = DispatchGroup()
          let manager = PHImageManager.default()
          let videoOptions = PHVideoRequestOptions()
          videoOptions.isNetworkAccessAllowed = true
          videoOptions.deliveryMode = .automatic
          videoOptions.version = .original

          var mediaResults: [RawMediaData] = []

          for (index, result) in results.enumerated() {
            group.enter()

            var customPickerConfig = pickerConfig
            if let oldName = customPickerConfig.imageName, results.count > 1 {
              customPickerConfig.imageName = "\(oldName)-\(index)"
            }

            switch result.asset.mediaType {
            case .image:
              if let data = resolveImage(image: result.image, picker: customPickerConfig) {
                mediaResults.append(data)
              }
              group.leave()

            case .video:
              manager.requestAVAsset(
                forVideo: result.asset,
                options: videoOptions
              ) { asset, _, info in
                if let info, let error = info[PHImageErrorKey] as? NSError {
                  completion(
                    .failure(
                      PigeonError(
                        code: "video_asset_error",
                        message: "Failed to load video asset",
                        details: error.localizedDescription
                      )
                    )
                  )
                  group.leave()
                  return
                }

                guard let videoAsset = asset as? AVURLAsset else {
                  completion(
                    .failure(
                      PigeonError(
                        code: "video_conversion_error",
                        message: "Failed to convert video asset to URL asset",
                        details: nil
                      )
                    )
                  )
                  group.leave()
                  return
                }

                let data = self.resolveVideo(url: videoAsset.url, picker: customPickerConfig)
                mediaResults.append(data)
                group.leave()
              }

            default:
              group.leave()
            }
          }

          group.notify(queue: .main) { completion(.success(mediaResults)) }
        }

        photoSheet.cancelBlock = { completion(.success(nil)) }
        photoSheet.showPhotoLibrary(sender: viewController)
      }
    }
  }
  // swiftlint:enable function_body_length

  private func editVideo(
    _ data: RawMediaData,
    _ viewController: UIViewController,
    pickerConfig: RawPickerConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    let videoURL = URL(fileURLWithPath: data.path)
    let videoEditor = ZLEditVideoViewController(avAsset: AVAsset(url: videoURL))

    videoEditor.modalPresentationStyle = .fullScreen
    videoEditor.cancelEditBlock = { completion(.success(nil)) }
    videoEditor.editFinishBlock = { url in
      guard let editedURL = url else { return completion(.success(nil)) }

      if let videoReplaceError = self.replaceFile(at: videoURL, with: editedURL) {
        completion(.failure(videoReplaceError))
      } else {
        let videoPath = videoURL.path
        var updatedThumbPath = data.thumbPath

        if let thumbPath = updatedThumbPath {
          if let thumbImage = self.getVideoThumbImage(
            url: videoPath, width: pickerConfig.thumbnailWidth
          ) {
            updatedThumbPath = self.createImageFile(
              image: thumbImage,
              picker: pickerConfig,
              existingPath: thumbPath,
              isThumbnail: true
            )
          }
        } else {
          updatedThumbPath = self.saveVideoThumbnail(url: videoPath, picker: pickerConfig)
        }

        let updatedDuration = self.getVideoDurationInSeconds(url: videoURL)
        let updatedMediaData = RawMediaData(
          path: videoPath,
          thumbPath: updatedThumbPath,
          type: data.type,
          duration: updatedDuration
        )

        completion(.success(updatedMediaData))
      }
    }

    viewController.present(videoEditor, animated: true, completion: nil)
  }

  // swiftlint:disable:next function_body_length
  private func editImage(
    _ data: RawMediaData,
    _ viewController: UIViewController,
    pickerConfig: RawPickerConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    guard let image = UIImage(contentsOfFile: data.path) else {
      completion(
        .failure(
          PigeonError(
            code: "image_load_error",
            message: "Failed to load image from path: \(data.path)",
            details: nil
          )
        )
      )

      return
    }

    let imageEditor = ZLEditImageViewController(image: image)

    imageEditor.modalPresentationStyle = .fullScreen
    imageEditor.cancelEditBlock = { completion(.success(nil)) }
    imageEditor.editFinishBlock = { [weak self] (editedImage: UIImage, _: ZLEditImageModel?) in
      guard let self else { return completion(.success(nil)) }

      if let imageData = editedImage.jpegData(compressionQuality: 1) {
        let imagePath = data.path

        if self.createFile(atPath: imagePath, data: imageData) {
          let thumbPath = self.createImageFile(
            image: editedImage,
            picker: pickerConfig,
            existingPath: data.thumbPath,
            isThumbnail: true
          )
          let updatedMediaData = RawMediaData(
            path: imagePath, thumbPath: thumbPath, type: data.type
          )

          completion(.success(updatedMediaData))
        } else {
          completion(
            .failure(
              PigeonError(
                code: "image_save_error",
                message: "Failed to save edited image to path: \(imagePath)",
                details: nil
              )
            )
          )
        }
      } else {
        completion(
          .failure(
            PigeonError(
              code: "image_conversion_error",
              message: "Failed to convert edited image to JPEG data",
              details: nil
            )
          )
        )
      }
    }

    viewController.present(imageEditor, animated: true, completion: nil)
  }

  private func getNearestViewController(
    completion: @escaping (Result<UIViewController, PigeonError>) -> Void
  ) {
    guard let viewController = nearestViewController else {
      completion(
        .failure(
          PigeonError(
            code: "no_native_view_controller",
            message: "Unable to find top view controller on iOS native side",
            details: String(describing: UIApplication.shared.keyWindow)
          )
        )
      )

      return
    }

    completion(.success(viewController))
  }

  private func applyConfigs(
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
    cameraConfig: RawCameraConfiguration? = nil,
    editConfig: RawEditConfiguration? = nil
  ) {
    let config = ZLPhotoConfiguration.default()  // Providing default configuration.

    if let editConfig { config.updateEditConfiguration(from: editConfig) }
    if let cameraConfig { config.updateCameraConfiguration(from: cameraConfig) }

    config.updatePickerConfiguration(from: pickerConfig)
    ZLPhotoUIConfiguration.default().updateUiConfiguration(from: uiConfig)  // Apply the UI config.
  }

  private func showOverlayImage(_ overlay: RawOverlayImage?, registrar: FlutterPluginRegistrar) {
    guard let overlay else {
      setCameraOverlay(nil)
      return
    }

    var image: UIImage?

    if overlay.isAsset {
      let key = registrar.lookupKey(forAsset: overlay.path)
      if let path = Bundle.main.path(forResource: key, ofType: nil) {
        image = UIImage(contentsOfFile: path)
      }
    } else {
      image = UIImage(contentsOfFile: overlay.path)
    }

    if let image {
      let overlayView = UIImageView(image: image)

      overlayView.transform = CGAffineTransform(rotationAngle: CGFloat(overlay.rotationAngle))
      overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      overlayView.alpha = CGFloat(overlay.opacity)
      if overlay.tintColor != 0 {
        overlayView.tintColor = UIColor(rgbValue: overlay.tintColor)
        overlayView.image = overlayView.image?.withRenderingMode(.alwaysTemplate)
      }

      setCameraOverlay(overlayView)
    }
  }

  private func setCameraOverlay(_ overlay: UIImageView?) {
    ZLPhotoConfiguration.default().cameraConfiguration.overlayView = overlay
  }

  private func resolveImage(image: UIImage, picker: RawPickerConfiguration) -> RawMediaData? {
    let imagePath = createImageFile(image: image, picker: picker)
    guard let imagePath else { return nil }
    let thumbPath = createImageFile(image: image, picker: picker, isThumbnail: true)

    return RawMediaData(path: imagePath, thumbPath: thumbPath, type: .image)
  }

  private func resolveVideo(url: URL, picker: RawPickerConfiguration) -> RawMediaData {
    let videoPath = url.path
    // ! Move video to the specified directory.
    let duration = getVideoDurationInSeconds(url: url)
    let thumbPath = saveVideoThumbnail(url: videoPath, picker: picker)

    return RawMediaData(path: videoPath, thumbPath: thumbPath, type: .video, duration: duration)
  }

  private func saveVideoThumbnail(url: String, picker: RawPickerConfiguration) -> String? {
    if let image = getVideoThumbImage(url: url, width: picker.thumbnailWidth) {
      return createImageFile(image: image, picker: picker, isThumbnail: true)
    }

    return nil
  }

  private func getVideoDurationInSeconds(url: URL) -> Int64? {
    let asset = AVAsset(url: url)

    return Int64(CMTimeGetSeconds(asset.duration))
  }

  private func getVideoThumbImage(url: String, width: Int64) -> UIImage? {
    // swiftlint:disable:next no_magic_numbers
    let time = CMTime(seconds: 0, preferredTimescale: 600)
    let asset = AVAsset(url: URL(fileURLWithPath: url))
    let gen = AVAssetImageGenerator(asset: asset)
    do {
      gen.maximumSize = CGSize(width: CGFloat(width), height: CGFloat.greatestFiniteMagnitude)
      gen.appliesPreferredTrackTransform = true
      let image = try gen.copyCGImage(at: time, actualTime: nil)

      return UIImage(cgImage: image)
    } catch {
      return nil
    }
  }

  private func createImageFile(
    image: UIImage,
    picker: RawPickerConfiguration,
    existingPath: String? = nil,
    isThumbnail: Bool = false
  ) -> String? {
    var filePath = existingPath ?? ""
    if filePath.isEmpty {
      let directoryPath = picker.directoryPath ?? NSTemporaryDirectory()
      var fileName = picker.imageName ?? "media_\(UUID().uuidString)"
      if isThumbnail { fileName = picker.thumbnailPrefix + fileName }
      // Ensure the file name includes the ".jpg" extension
      if !fileName.lowercased().hasSuffix(".jpg") { fileName += ".jpg" }
      filePath = URL(fileURLWithPath: directoryPath).appendingPathComponent(fileName).path
    }

    let width = isThumbnail ? CGFloat(picker.thumbnailWidth) : nil
    guard let imageData = resizeImage(image: image, width: width) else { return nil }

    return createFile(atPath: filePath, data: imageData) ? filePath : nil
  }

  private func resizeImage(image: UIImage, width: CGFloat?) -> Data? {
    guard let width, round(image.size.width) > round(width) else {
      return image.jpegData(compressionQuality: 1)
    }

    let widthRatio = width / image.size.width
    let newSize = CGSize(width: width, height: image.size.height * widthRatio)
    let renderer = UIGraphicsImageRenderer(
      size: newSize, format: UIGraphicsImageRendererFormat.default()
    )
    let newImage = renderer.image { _ in
      image.draw(in: CGRect(origin: .zero, size: newSize))
    }

    return newImage.jpegData(compressionQuality: 1)
  }

  private func createFile(atPath path: String?, data: Data?) -> Bool {
    guard let path, let data else { return false }
    let fileManager = FileManager.default

    if fileManager.fileExists(atPath: path) {
      do {
        try fileManager.removeItem(atPath: path)
      } catch {
        print("Failed to remove existing file at: \(path), error: \(error.localizedDescription)")

        return false
      }
    }

    return fileManager.createFile(atPath: path, contents: data)
  }

  private func replaceFile(at originalURL: URL?, with newURL: URL) -> PigeonError? {
    guard let originalURL else { return nil }

    do {
      try FileManager.default.removeItem(at: originalURL)
      try FileManager.default.moveItem(at: newURL, to: originalURL)

      return nil
    } catch {
      return PigeonError(
        code: "file_operation_error",
        message: "Failed to replace the file at: \(originalURL.path) with: \(newURL.path)",
        details: error.localizedDescription
      )
    }
  }
}
// swiftlint:enable file_length
