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
    UIApplication.shared.keyWindow?.rootViewController?.nearestViewController
  }

  func openCamera(
    cameraConfig: RawCameraConfiguration,
    pickerConfig: RawPickerConfiguration,
    editConfig: RawEditConfiguration,
    completion: @escaping (Result<RawMediaData?, Error>) -> Void
  ) {
    /// First check if plugin can access top view controller to show camera view screen.
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

    let camera = ZLCustomCamera()
    let config = ZLPhotoConfiguration.default()  // Providing default configuration.
    config.updateEditConfiguration(from: editConfig)
    config.updateCameraConfiguration(from: cameraConfig)
    config.updatePickerConfiguration(from: pickerConfig)

    camera.cancelBlock = { completion(.success(nil)) }  // On cancel button tap.
    camera.takeDoneBlock = { (image, video) in  // On done button tap.
      var mediaData: RawMediaData?

      if let image = image {
        mediaData = self.resolveImage(image: image, cameraConfig: cameraConfig)
      } else if let video = video {
        mediaData = self.resolveVideo(url: video, cameraConfig: cameraConfig)
      }

      completion(.success(mediaData))
    }

    viewController.showDetailViewController(camera, sender: nil)
  }

  private func resolveImage(image: UIImage, cameraConfig: RawCameraConfiguration) -> RawMediaData {
    let path = saveImage(image: image, cameraConfig: cameraConfig)
    let fileSize = getFileSize(atPath: path)

    return RawMediaData(path: path, type: .image, thumbPath: path, size: fileSize)
  }

  private func resolveVideo(url: URL, cameraConfig: RawCameraConfiguration) -> RawMediaData {
    let path = url.path
    let fileSize = getFileSize(atPath: path)
    let thumbPath = saveVideoThumbnail(url: path, cameraConfig: cameraConfig)

    return RawMediaData(path: path, type: .video, thumbPath: thumbPath, size: fileSize)
  }

  private func saveImage(image: UIImage, cameraConfig: RawCameraConfiguration) -> String {
    return createImageFile(data: image.jpegData(compressionQuality: 1), cameraConfig: cameraConfig)
  }

  private func saveVideoThumbnail(url: String, cameraConfig: RawCameraConfiguration) -> String? {
    if let thumb = getVideoThumbPath(url: url) {
      let thumbData = thumb.jpegData(compressionQuality: 1)

      return createImageFile(data: thumbData, cameraConfig: cameraConfig)
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

  private func getVideoThumbPath(url: String) -> UIImage? {
    do {
      let asset = AVAsset(url: NSURL.fileURL(withPath: url))
      let gen = AVAssetImageGenerator(asset: asset)
      gen.appliesPreferredTrackTransform = true
      let time = CMTime(seconds: 0.0, preferredTimescale: 600)
      let image = try gen.copyCGImage(at: time, actualTime: nil)

      return UIImage(cgImage: image)
    } catch {
      return nil
    }
  }

  private func createImageFile(data: Data?, cameraConfig: RawCameraConfiguration) -> String {
    let directoryPath = cameraConfig.directoryPath ?? NSTemporaryDirectory()
    var fileName = cameraConfig.imageName ?? "multi_media_\(UUID().uuidString)"
    /// Ensure the file name includes the ".jpg" extension
    if !fileName.lowercased().hasSuffix(".jpg") { fileName += ".jpg" }

    let filePath = URL(fileURLWithPath: directoryPath).appendingPathComponent(fileName).path
    FileManager.default.createFile(atPath: filePath, contents: data)

    return filePath
  }
}
