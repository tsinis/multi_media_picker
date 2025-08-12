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
    static let minDurationLabelFontSize: CGFloat = 32
    static let minDurationLabelMargin: CGFloat = 20
  }

  // MARK: - Private Properties

  private let countdownSeconds: Int
  private let minVideoDurationSeconds: Int?
  private weak var viewController: UIViewController?
  private var countdownLabel: UILabel?
  private var minDurationLabel: UILabel?
  private var isCountdownInProgress = false
  private var isMinDurationTrackingActive = false
  private var minDurationTimer: Timer?
  private var recordingStartTime: Date?

  // MARK: - Initialization

  /// Initializes a new countdown manager
  /// - Parameters:
  ///   - `seconds`: The number of seconds to count down
  ///   - `viewController`: The view controller to display the countdown on
  ///   - `minVideoDurationSeconds`: Minimum video duration in seconds (optional)
  init(seconds: Int, viewController: UIViewController, minVideoDurationSeconds: Int?) {
    self.countdownSeconds = seconds
    self.viewController = viewController
    self.minVideoDurationSeconds = minVideoDurationSeconds
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
    // Always reset min duration tracking when starting countdown
    stopMinDurationTracking()

    let mediaType = determineMediaType(allowPhoto: allowPhoto, allowVideo: allowVideo)

    if shouldSkipCountdown(isCapturing: isCapturing) {
      handleImmediateCapture(
        isCapturing: isCapturing, mediaType: mediaType, playSound: playSound, completion: completion
      )
      return
    }

    setupCountdown(mediaType: mediaType, playSound: playSound, completion: completion)
  }

  // Start minimum duration countdown for video recording
  func startMinDurationTracking() {
    guard let viewController = viewController,
      let minDuration = minVideoDurationSeconds,
      !isMinDurationTrackingActive
    else { return }

    isMinDurationTrackingActive = true
    recordingStartTime = Date()
    setupMinDurationLabel(in: viewController, minDuration: minDuration)
    startMinDurationTimer()
  }

  // Stop minimum duration tracking
  func stopMinDurationTracking() {
    isMinDurationTrackingActive = false
    recordingStartTime = nil
    minDurationTimer?.invalidate()
    minDurationTimer = nil
    removeMinDurationLabel()
  }

  /// Reset the countdown state
  func resetCountdownState() {
    isCountdownInProgress = false
    removeCountdownLabel()
    stopMinDurationTracking()
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

  // Setup minimum duration countdown label
  private func setupMinDurationLabel(in viewController: UIViewController, minDuration: Int) {
    let label = createMinDurationLabel(in: viewController, minDuration: minDuration)
    animateMinDurationLabelAppearance(label)
  }

  // Create minimum duration countdown label
  private func createMinDurationLabel(in viewController: UIViewController, minDuration: Int)
    -> UILabel
  {
    let label = UILabel()
    label.text = formatTime(minDuration)
    label.textColor = .red
    label.font = UIFont.systemFont(ofSize: Constants.minDurationLabelFontSize, weight: .bold)
    label.textAlignment = .center

    // Position in top-right corner
    let labelWidth: CGFloat = 60
    let labelHeight: CGFloat = 30
    label.frame = CGRect(
      x: viewController.view.bounds.width - labelWidth - Constants.minDurationLabelMargin,
      y: Constants.minDurationLabelMargin
        + (viewController.view.safeAreaInsets.top > 0 ? viewController.view.safeAreaInsets.top : 0),
      width: labelWidth,
      height: labelHeight
    )

    label.alpha = 0
    viewController.view.addSubview(label)
    self.minDurationLabel = label
    return label
  }

  // Animate minimum duration label appearance
  private func animateMinDurationLabelAppearance(_ label: UILabel) {
    UIView.animate(withDuration: Constants.labelFadeDuration) {
      label.alpha = 1
    }
  }

  // Start the minimum duration countdown timer
  private func startMinDurationTimer() {
    minDurationTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
      self?.updateMinDurationLabel()
    }
  }

  // Update minimum duration countdown label
  private func updateMinDurationLabel() {
    guard let startTime = recordingStartTime,
      let label = minDurationLabel,
      let minDuration = minVideoDurationSeconds
    else { return }

    let elapsed = Int(Date().timeIntervalSince(startTime))
    let remaining = max(0, minDuration - elapsed)

    if remaining <= 0 {
      // Minimum duration reached, hide the label
      stopMinDurationTracking()
    } else {
      label.text = formatTime(remaining)
    }
  }

  private func formatTime(_ totalSeconds: Int) -> String {
    return "\(totalSeconds)"
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

  // Remove minimum duration label
  private func removeMinDurationLabel() {
    UIView.animate(
      withDuration: Constants.labelFadeDuration,
      animations: { [weak self] in
        self?.minDurationLabel?.alpha = 0
      },
      completion: { [weak self] _ in
        self?.minDurationLabel?.removeFromSuperview()
        self?.minDurationLabel = nil
      }
    )
  }
}
