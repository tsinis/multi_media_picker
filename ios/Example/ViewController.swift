import Photos
import UIKit
import ZLPhotoBrowser

class ViewController: UIViewController {
  var selectedImages: [UIImage] = []
  var selectedAssets: [PHAsset] = []
  var selectedResults: [ZLResultModel] = []
  var isOriginal = false

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  func setupUI() {
    title = "Main"
    view.backgroundColor = .white

    func createButton(_ title: String, _ action: Selector) -> UIButton {
      let button = UIButton(type: .custom)
      button.setTitle(title, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
      button.addTarget(self, action: action, for: .touchUpInside)
      button.backgroundColor = .black
      button.layer.cornerRadius = 5
      button.layer.masksToBounds = true
      return button
    }

    let cameraButton = createButton("Camera", #selector(showCamera))
    view.addSubview(cameraButton)
    cameraButton.translatesAutoresizingMaskIntoConstraints = false
    if #available(iOS 11.0, *) {
      NSLayoutConstraint.activate([
        cameraButton.topAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        cameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      ])
    } else {
      NSLayoutConstraint.activate([
        cameraButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 20),
        cameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      ])
    }
  }

  @objc func showCamera() {
    // To enable tap-to-record you can also use tapToRecordVideo flag in camera config, for example:
//    ZLPhotoConfiguration.default().cameraConfiguration = ZLPhotoConfiguration.default()
//      .cameraConfiguration
//      .tapToRecordVideo(true)

    let camera = ZLCustomCamera()
    camera.takeDoneBlock = { [weak self] image, videoUrl in
      self?.save(image: image, videoUrl: videoUrl)
    }
    showDetailViewController(camera, sender: nil)
  }

  func save(image: UIImage?, videoUrl: URL?) {
    if let image = image {
      let hud = ZLProgressHUD.show(toast: .processing)
      ZLPhotoManager.saveImageToAlbum(image: image) { [weak self] error, asset in
        if error == nil, let asset {
          let resultModel = ZLResultModel(asset: asset, image: image, isEdited: false, index: 0)
          self?.selectedResults = [resultModel]
          self?.selectedImages = [image]
          self?.selectedAssets = [asset]
        } else {
          debugPrint("Failed to save image to album")
        }
        hud.hide()
      }
    } else if let videoUrl = videoUrl {
      let hud = ZLProgressHUD.show(toast: .processing)
      ZLPhotoManager.saveVideoToAlbum(url: videoUrl) { [weak self] error, asset in
        if error == nil, let asset {
          self?.fetchImage(for: asset)
        } else {
          debugPrint("Failed to save video to album")
        }
        hud.hide()
      }
    }
  }

  func fetchImage(for asset: PHAsset) {
    let option = PHImageRequestOptions()
    option.resizeMode = .fast
    option.isNetworkAccessAllowed = true

    PHImageManager.default().requestImage(
      for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill,
      options: option
    ) { image, info in
      var downloadFinished = false
      if let info = info {
        downloadFinished =
          !(info[PHImageCancelledKey] as? Bool ?? false) && (info[PHImageErrorKey] == nil)
      }
      let isDegraded = (info?[PHImageResultIsDegradedKey] as? Bool ?? false)
      if downloadFinished, !isDegraded, let image = image {
        let resultModel = ZLResultModel(asset: asset, image: image, isEdited: false, index: 0)
        self.selectedResults = [resultModel]
        self.selectedImages = [image]
        self.selectedAssets = [asset]
      }
    }
  }
}
