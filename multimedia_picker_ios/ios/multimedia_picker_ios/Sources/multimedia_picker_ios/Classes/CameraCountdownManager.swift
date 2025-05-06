import AVFoundation
import UIKit

/// Manages countdown timer and sound effects for camera capture.
public final class CameraCountdownManager {
  // MARK: - Private Constants

  private enum Constants {
    static let labelFadeDuration: TimeInterval = 0.3
    static let soundDelay: TimeInterval = 0.1
    static let videoSoundDelay: TimeInterval = 0.4
    static let countdownTickSound: SystemSoundID = 1_113
    static let countdownFinishSound: SystemSoundID = 1_114
    static let videoRecordingSound: SystemSoundID = 1_117
    static let labelFontSize: CGFloat = 72
  }

  // MARK: - Private Properties

  private let countdownSeconds: Int
  private weak var viewController: UIViewController?
  private var countdownLabel: UILabel?
  private var isCountdownInProgress = false

  // MARK: - Initialization

  /// Initializes a new countdown manager
  /// - Parameters:
  ///   - `seconds`: The number of seconds to count down
  ///   - `viewController`: The view controller to display the countdown on
  init(seconds: Int, viewController: UIViewController) {
    self.countdownSeconds = seconds
    self.viewController = viewController
  }

  // MARK: - Public Methods

  /// Starts the countdown with appropriate sound effects
  /// - Parameters:
  ///   - `allowPhoto`: Flag indicating if photo capture is allowed.
  ///   - `allowVideo`: Flag indicating if video recording is allowed.
  ///   - `playSound`: Whether to play sounds during capture.
  ///   - `isCapturing`: Flag indicating if the camera is already capturing.
  ///   - `completion`: Called when countdown finishes.
  func startCountdown(
    allowPhoto: Bool,
    allowVideo: Bool,
    isCapturing: Bool = false,
    playSound: Bool = true,
    completion: @escaping () -> Void
  ) {
    let mediaType = determineMediaType(allowPhoto: allowPhoto, allowVideo: allowVideo)

    if shouldSkipCountdown(isCapturing: isCapturing) {
      handleImmediateCapture(
        isCapturing: isCapturing, mediaType: mediaType, playSound: playSound, completion: completion
      )
      return
    }

    setupCountdown(mediaType: mediaType, playSound: playSound, completion: completion)
  }

  /// Reset the countdown state
  func resetCountdownState() {
    isCountdownInProgress = false
    removeCountdownLabel()
  }

  // MARK: - Private Methods

  private func determineMediaType(allowPhoto: Bool, allowVideo: Bool) -> MediaType? {
    switch (allowPhoto, allowVideo) {
    case (true, false):
      return .image

    case (true, true):
      return .image

    case (false, true):
      return .video

    default:
      return nil
    }
  }

  private func shouldSkipCountdown(isCapturing: Bool) -> Bool {
    countdownSeconds <= 0 || isCountdownInProgress || isCapturing
  }

  private func handleImmediateCapture(
    isCapturing: Bool,
    mediaType: MediaType?,
    playSound: Bool,
    completion: @escaping () -> Void
  ) {
    // Handle video-only mode with sound.
    if !isCapturing && playSound && mediaType == .video {
      playVideoStartSound(completion: completion)
      return
    }

    completion()
  }

  private func playVideoStartSound(completion: @escaping () -> Void) {
    AudioServicesPlaySystemSound(Constants.videoRecordingSound)

    // Enhanced delay to ensure the sound is not captured in the video
    DispatchQueue.main.asyncAfter(
      deadline: .now() + Constants.videoSoundDelay + Constants.soundDelay
    ) {
      completion()
    }
  }

  private func setupCountdown(
    mediaType: MediaType?, playSound: Bool, completion: @escaping () -> Void
  ) {
    isCountdownInProgress = true

    guard let viewController else {
      isCountdownInProgress = false
      completion()
      return
    }

    setupCountdownLabel(in: viewController)
    playCountdownStep(
      countdownSeconds, mediaType: mediaType, playSound: playSound, completion: completion
    )
  }

  private func setupCountdownLabel(in viewController: UIViewController) {
    let label = createCountdownLabel(in: viewController)
    animateCountdownLabelAppearance(label)
  }

  private func createCountdownLabel(in viewController: UIViewController) -> UILabel {
    let label = UILabel()
    label.text = "\(countdownSeconds)"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .bold)
    label.textAlignment = .center
    label.frame = viewController.view.bounds
    label.alpha = 0
    viewController.view.addSubview(label)
    self.countdownLabel = label
    return label
  }

  private func animateCountdownLabelAppearance(_ label: UILabel) {
    UIView.animate(withDuration: Constants.labelFadeDuration) {
      label.alpha = 1
    }
  }

  private func playCountdownStep(
    _ count: Int,
    mediaType: MediaType?,
    playSound: Bool,
    completion: @escaping () -> Void
  ) {
    guard let viewController, viewController.view.window != nil else {
      handleDismissedCamera()
      return
    }

    if playSound { AudioServicesPlaySystemSound(Constants.countdownTickSound) }
    countdownLabel?.text = "\(count)"

    if count > 1 {
      scheduleNextCountdownStep(
        count, mediaType: mediaType, playSound: playSound, completion: completion
      )
    } else {
      handleFinalCountdownStep(mediaType: mediaType, playSound: playSound, completion: completion)
    }
  }

  private func handleDismissedCamera() {
    removeCountdownLabel()
    isCountdownInProgress = false
  }

  private func scheduleNextCountdownStep(
    _ count: Int,
    mediaType: MediaType?,
    playSound: Bool,
    completion: @escaping () -> Void
  ) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.playCountdownStep(
        count - 1, mediaType: mediaType, playSound: playSound, completion: completion
      )
    }
  }

  private func handleFinalCountdownStep(
    mediaType: MediaType?,
    playSound: Bool,
    completion: @escaping () -> Void
  ) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      guard let viewController = self.viewController, viewController.view.window != nil else {
        self.handleDismissedCamera()
        return
      }

      self.playFinalSounds(mediaType: mediaType, playSound: playSound)
      self.animateCountdownLabelDisappearance(
        mediaType: mediaType, playSound: playSound, completion: completion
        )
    }
  }

  private func playFinalSounds(mediaType: MediaType?, playSound: Bool) {
    guard playSound else { return }

    AudioServicesPlaySystemSound(Constants.countdownFinishSound)

    if mediaType == .video {
      DispatchQueue.main.asyncAfter(deadline: .now() + Constants.soundDelay) {
        AudioServicesPlaySystemSound(Constants.videoRecordingSound)
      }
    }
  }

  private func animateCountdownLabelDisappearance(
    mediaType: MediaType?,
    playSound: Bool,
    completion: @escaping () -> Void
  ) {
    UIView.animate(
      withDuration: Constants.labelFadeDuration,
      animations: { [weak self] in
        self?.countdownLabel?.alpha = 0
      },
      completion: { [weak self] _ in
        self?.removeCountdownLabel()
        self?.isCountdownInProgress = false

        guard let viewController = self?.viewController, viewController.view.window != nil else {
          return
        }

        let delay: TimeInterval = (mediaType == .video && playSound) ? Constants.videoSoundDelay : 0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
          completion()
        }
      }
    )
  }

  private func removeCountdownLabel() {
    countdownLabel?.removeFromSuperview()
    countdownLabel = nil
  }
}
