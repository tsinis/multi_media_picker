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
            mediaData = self.resolveImage(image: image, config: pickerConfig)
          } else if let video = video {
            mediaData = self.resolveVideo(url: video, config: pickerConfig)
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
          if let thumbData = self.getVideoThumbPath(url: videoPath) {
            let isSuccess = self.createFile(atPath: thumbPath, data: thumbData)
            if !isSuccess { print("Failed to create thumbnail file at path: \(thumbPath)") }
          }
        } else {
          updatedThumbPath = self.saveVideoThumbnail(url: videoPath, config: pickerConfig)
        }

        let updatedMediaData = RawMediaData(
          path: videoPath,
          type: data.type,
          thumbPath: updatedThumbPath,
          size: self.getFileSize(atPath: videoPath)
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
    // TODO! Implementation for editing images will go here.
    completion(.success(nil))
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

  private func resolveImage(image: UIImage, config: RawPickerConfiguration) -> RawMediaData? {
    let path = saveImage(image: image, config: config)
    guard let path = path else { return nil }

    let fileSize = getFileSize(atPath: path)

    return RawMediaData(path: path, type: .image, thumbPath: path, size: fileSize)
  }

  private func resolveVideo(url: URL, config: RawPickerConfiguration) -> RawMediaData {
    let path = url.path
    let fileSize = getFileSize(atPath: path)
    let thumbPath = saveVideoThumbnail(url: path, config: config)

    return RawMediaData(path: path, type: .video, thumbPath: thumbPath, size: fileSize)
  }

  private func saveImage(image: UIImage, config: RawPickerConfiguration) -> String? {
    return createImageFile(data: image.jpegData(compressionQuality: 1), config: config)
  }

  private func saveVideoThumbnail(url: String, config: RawPickerConfiguration) -> String? {
    if let thumbData = getVideoThumbPath(url: url) {
      return createImageFile(data: thumbData, config: config)
    }

    return nil
  }

  private func getFileSize(atPath path: String) -> Int64? {
    do {
      let attributes = try FileManager.default.attributesOfItem(atPath: path)

      return attributes[FileAttributeKey.size] as? Int64
    } catch {
      return nil
    }
  }

  private func getVideoThumbPath(url: String) -> Data? {
    do {
      let asset = AVAsset(url: NSURL.fileURL(withPath: url))
      let gen = AVAssetImageGenerator(asset: asset)
      gen.appliesPreferredTrackTransform = true
      let time = CMTime(seconds: 0.0, preferredTimescale: 600)
      let image = try gen.copyCGImage(at: time, actualTime: nil)

      return UIImage(cgImage: image).jpegData(compressionQuality: 1)
    } catch {
      return nil
    }
  }

  private func createImageFile(data: Data?, config: RawPickerConfiguration) -> String? {
    let directoryPath = config.directoryPath ?? NSTemporaryDirectory()
    var fileName = config.imageName ?? "multi_media_\(UUID().uuidString)"
    /// Ensure the file name includes the ".jpg" extension
    if !fileName.lowercased().hasSuffix(".jpg") { fileName += ".jpg" }
    let filePath = URL(fileURLWithPath: directoryPath).appendingPathComponent(fileName).path

    return createFile(atPath: filePath, data: data) ? filePath : nil
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
