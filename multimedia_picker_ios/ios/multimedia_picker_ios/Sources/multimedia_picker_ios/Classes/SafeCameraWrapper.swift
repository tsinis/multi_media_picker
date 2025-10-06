import UIKit
import ZLPhotoBrowser

/// A wrapper around ZLCustomCamera that safely handles the camera setup timing
/// to prevent main thread deadlocks during view controller presentation.
class SafeCameraWrapper: UIViewController {
  private var _camera: ZLCustomCamera?
  private var isSetupComplete = false

  // Expose camera for cleanup purposes.
  var camera: ZLCustomCamera? { return _camera }
  var takeDoneBlock: ((UIImage?, URL?) -> Void)?
  var cancelBlock: (() -> Void)?
  var willCaptureBlock: ((@escaping () -> Void, _ isCapturing: Bool) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black

    // Show loading indicator while camera initializes.
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.color = .white
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)

    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])

    activityIndicator.startAnimating()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    // Now that the view controller presentation is complete,
    // safely initialize the camera. Use async to defer to next run loop cycle.
    guard !isSetupComplete else { return }
    isSetupComplete = true

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
      self?.setupCamera()
    }
  }

  private func setupCamera() {
    let camera = ZLCustomCamera()
    self._camera = camera

    // Configure camera blocks
    camera.takeDoneBlock = { [weak self] image, url in
      self?.takeDoneBlock?(image, url)
    }

    camera.cancelBlock = { [weak self] in
      self?.cancelBlock?()
    }

    camera.willCaptureBlock = { [weak self] completion, isCapturing in
      self?.willCaptureBlock?(completion, isCapturing)
    }

    // Add camera as child view controller.
    addChild(camera)
    view.addSubview(camera.view)
    camera.view.frame = view.bounds
    camera.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    camera.didMove(toParent: self)

    // Remove the loading indicator.
    view.subviews.forEach { subview in
      if subview is UIActivityIndicatorView {
        subview.removeFromSuperview()
      }
    }
  }

  // Clean up notifications when the wrapper is deallocated.
  deinit {
    guard let camera = _camera else { return }
    NotificationCenter.default.removeObserver(camera)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    ZLPhotoConfiguration.default().resetCameraOrientation()
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }

  override var prefersStatusBarHidden: Bool { return true }
}
