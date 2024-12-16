import AVFoundation
import Flutter
import Photos
import UIKit
import ZLPhotoBrowser

final public class MultiMediaPickerPlugin: NSObject, FlutterPlugin, MultiMediaApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let plugin = MultiMediaPickerPlugin()
    MultiMediaApiSetup.setUp(binaryMessenger: registrar.messenger(), api: plugin)
    registrar.publish(plugin)
  }

  private var nearestViewController: UIViewController? {
    return UIApplication.shared.keyWindow?.rootViewController?.nearestViewController
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

        camera.cancelBlock = { completion(.success(nil)) }  // On cancel button tap.
        camera.takeDoneBlock = { (image, video) in  // On done button tap.
          var mediaData: RawMediaData?

          if let image = image {
            mediaData = self.resolveImage(image: image, picker: pickerConfig)
          } else if let video = video {
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
          self.editVideo(
            data: data,
            viewController: viewController,
            editConfig: editConfig,
            pickerConfig: pickerConfig,
            uiConfig: uiConfig,
            completion: completion
          )
        case .image:
          self.editImage(
            data: data,
            viewController: viewController,
            editConfig: editConfig,
            pickerConfig: pickerConfig,
            uiConfig: uiConfig,
            completion: completion
          )
        }
      }
    }
  }

  private func editVideo(
    data: RawMediaData,
    viewController: UIViewController,
    editConfig: RawEditConfiguration,
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
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
          if let thumbImage = self.getVideoThumbImage(url: videoPath) {
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

  private func editImage(
    data: RawMediaData,
    viewController: UIViewController,
    editConfig: RawEditConfiguration,
    pickerConfig: RawPickerConfiguration,
    uiConfig: RawUiConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    guard let image = UIImage(contentsOfFile: data.path) else {
      return completion(
        .failure(
          PigeonError(
            code: "image_load_error",
            message: "Failed to load image from path: \(data.path)",
            details: nil
          )))
    }

    let imageEditor = ZLEditImageViewController(image: image)

    imageEditor.modalPresentationStyle = .fullScreen
    imageEditor.cancelEditBlock = { completion(.success(nil)) }
    imageEditor.editFinishBlock = {
      [weak self] (editedImage: UIImage, editModel: ZLEditImageModel?) in
      guard let self = self else { return completion(.success(nil)) }

      // TODO? Handle editing without explicitly converting it to JPG data?
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
            path: imagePath,
            thumbPath: thumbPath,
            type: data.type
          )

          completion(.success(updatedMediaData))
        } else {
          completion(
            .failure(
              PigeonError(
                code: "image_save_error",
                message: "Failed to save edited image to path: \(imagePath)",
                details: nil
              )))
        }
      } else {
        completion(
          .failure(
            PigeonError(
              code: "image_conversion_error",
              message: "Failed to convert edited image to JPEG data",
              details: nil
            )))
      }
    }

    viewController.present(imageEditor, animated: true, completion: nil)
  }

  private func getNearestViewController(
    completion: @escaping (Result<UIViewController, PigeonError>) -> Void
  ) {
    guard let viewController = nearestViewController else {
      return completion(
        .failure(
          PigeonError(
            code: "no_native_view_controller",
            message: "Unable to find top view controller on iOS native side",
            details: String(describing: UIApplication.shared.keyWindow)
          )
        )
      )
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

    if let editConfig = editConfig { config.updateEditConfiguration(from: editConfig) }
    if let cameraConfig = cameraConfig { config.updateCameraConfiguration(from: cameraConfig) }

    config.updatePickerConfiguration(from: pickerConfig)
    ZLPhotoUIConfiguration.default().updateUiConfiguration(from: uiConfig)  // Apply the UI config.
  }

  private func resolveImage(image: UIImage, picker: RawPickerConfiguration) -> RawMediaData? {
    let imagePath = createImageFile(image: image, picker: picker)
    guard let imagePath = imagePath else { return nil }
    let thumbPath = createImageFile(image: image, picker: picker, isThumbnail: true)

    return RawMediaData(path: imagePath, thumbPath: thumbPath, type: .image)
  }

  private func resolveVideo(url: URL, picker: RawPickerConfiguration) -> RawMediaData {
    let videoPath = url.path
    let duration = getVideoDurationInSeconds(url: url)
    let thumbPath = saveVideoThumbnail(url: videoPath, picker: picker)

    return RawMediaData(path: videoPath, thumbPath: thumbPath, type: .video, duration: duration)
  }

  private func saveVideoThumbnail(url: String, picker: RawPickerConfiguration) -> String? {
    if let image = getVideoThumbImage(url: url) {
      return createImageFile(image: image, picker: picker, isThumbnail: true)
    }

    return nil
  }

  func getVideoDurationInSeconds(url: URL) -> Int64? {
    let asset = AVAsset(url: url)

    return Int64(CMTimeGetSeconds(asset.duration))
  }

  private func getVideoThumbImage(url: String) -> UIImage? {
    let time = CMTime(seconds: 0.0, preferredTimescale: 600)
    do {
      let asset = AVAsset(url: NSURL.fileURL(withPath: url))
      let gen = AVAssetImageGenerator(asset: asset)
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
      if isThumbnail { fileName = ".thumbnail_\(fileName)" }
      /// Ensure the file name includes the ".jpg" extension
      if !fileName.lowercased().hasSuffix(".jpg") { fileName += ".jpg" }
      filePath = URL(fileURLWithPath: directoryPath).appendingPathComponent(fileName).path
    }

    let width = isThumbnail ? CGFloat(picker.thumbnailWidth) : nil
    guard let imageData = resizeImage(image: image, width: width) else { return nil }

    return createFile(atPath: filePath, data: imageData) ? filePath : nil
  }

  private func resizeImage(image: UIImage, width: CGFloat?) -> Data? {
    guard let width = width, round(image.size.width) > round(width) else {
      return image.jpegData(compressionQuality: 1)
    }

    let widthRatio = width / image.size.width
    let newSize = CGSize(width: width, height: image.size.height * widthRatio)
    let renderer = UIGraphicsImageRenderer(size: newSize)
    let newImage = renderer.image { (context) in
      image.draw(in: CGRect(origin: .zero, size: newSize))
    }

    return newImage.jpegData(compressionQuality: 1)
  }

  private func createFile(atPath path: String?, data: Data?) -> Bool {
    guard let path = path, let data = data else { return false }
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
    guard let originalURL = originalURL else { return nil }

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
