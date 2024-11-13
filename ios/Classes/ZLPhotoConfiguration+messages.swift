import ZLPhotoBrowser

extension ZLPhotoConfiguration {
  func updateCameraConfiguration(from config: RawCameraConfiguration) {
    let this = self.cameraConfiguration

    this.allowRecordVideo = config.allowRecordVideo
    this.allowSwitchCamera = config.allowSwitchCamera
    this.allowTakePhoto = config.allowTakePhoto
    this.isVideoMirrored = config.isVideoMirrored
    this.maxRecordDuration = Int(config.maxDurationSeconds)
    this.minRecordDuration = Int(config.minDurationSeconds)
    this.showFlashSwitch = config.showFlashSwitch
    //  this.enableWideCameras = config.enableWideCameras // TODO!
    //  this.tapToRecordVideo = config.tapToRecordVideo // TODO!
    this.videoExportType =
      ZLCameraConfiguration.VideoExportType(rawValue: config.videoExportType.rawValue) ?? .mov
    this.devicePosition =
      ZLCameraConfiguration.DevicePosition(rawValue: config.devicePosition.rawValue) ?? .back
    this.focusMode =
      ZLCameraConfiguration.FocusMode(rawValue: config.focusMode.rawValue) ?? .continuousAutoFocus

    this.exposureMode =
      ZLCameraConfiguration.ExposureMode(rawValue: config.exposureMode.rawValue)
      ?? .continuousAutoExposure

    this.sessionPreset =
      ZLCameraConfiguration.CaptureSessionPreset(rawValue: config.sessionPreset.rawValue)
      ?? .hd1920x1080
  }
}
