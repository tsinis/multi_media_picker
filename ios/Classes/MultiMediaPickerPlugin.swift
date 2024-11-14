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
        mediaData = self.resolveImage(image: image, maxSize: cameraConfig.maxSizeKB.map { Int($0) })
      } else if let video = video {
        mediaData = self.resolveVideo(url: video)
      }

      completion(.success(mediaData))
    }

    viewController.showDetailViewController(camera, sender: nil)
  }

  private func resolveImage(image: UIImage, maxSize: Int?) -> RawMediaData {
    let path = saveImage(image: image, maxSize: maxSize)
    let fileSize = getFileSize(atPath: path)

    return RawMediaData(path: path, type: .image, thumbPath: path, size: fileSize)
  }

  private func resolveVideo(url: URL) -> RawMediaData {
    let path = url.path
    let fileSize = getFileSize(atPath: path)
    let thumbPath = saveVideoThumbnail(url: path)

    return RawMediaData(path: path, type: .video, thumbPath: thumbPath, size: fileSize)
  }

  private func saveImage(image: UIImage, maxSize: Int?) -> String {
    if let maxSize = maxSize {
      return compressImage(image: image, maxSize: maxSize)
    } else {
      let data = image.jpegData(compressionQuality: 1)

      return createImageFile(data: data)
    }
  }

  private func saveVideoThumbnail(url: String) -> String? {
    if let thumb = getVideoThumbPath(url: url) {
      let thumbData = thumb.jpegData(compressionQuality: 1)

      return createImageFile(data: thumbData)
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

  private func createImageFile(data: Data?) -> String {  // TODO!
    let uuid = UUID().uuidString
    let tempDir = NSTemporaryDirectory()
    let filename = "\(tempDir)multi_media_\(uuid).jpg"
    FileManager.default.createFile(atPath: filename, contents: data)

    return filename
  }

  private func compressImage(image: UIImage, maxSize: Int) -> String {
    let maxSize = maxSize * 1000
    let image = resizeImage(originalImage: image)

    var compression: CGFloat = 1
    var data = image.jpegData(compressionQuality: compression)!

    if data.count < maxSize {
      return createImageFile(data: data)
    }
    var max: CGFloat = 1
    var min: CGFloat = 0
    for _ in 0...5 {
      compression = (max + min) / 2
      data = image.jpegData(compressionQuality: compression)!
      if data.count < maxSize * Int(0.9) {
        min = compression
      } else if data.count > maxSize {
        max = compression
      } else {
        break
      }
    }

    return createImageFile(data: data)
  }

  private func resizeImage(originalImage: UIImage) -> UIImage {
    let height = originalImage.size.height
    let width = originalImage.size.width
    let scale = width / height
    var size = CGSize()

    if width <= 1280 && height <= 1280 {

      return originalImage
    } else if width > 1280 || height > 1280 {
      if scale <= 2 && scale >= 1 {
        size = CGSize(width: 1280, height: 1280 / scale)
      } else if scale >= 0.5 && scale <= 1 {
        size = CGSize(width: 1280 * scale, height: 1280)
      } else if width > 1280 && height > 1280 {
        if scale > 2 {
          size = CGSize(width: 1280 * scale, height: 1280)
        } else if scale < 0.5 {
          size = CGSize(width: 1280, height: 1280 / scale)
        }
      } else {
        return originalImage
      }
    }

    UIGraphicsBeginImageContext(size)
    originalImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return resizedImage ?? originalImage
  }
}
