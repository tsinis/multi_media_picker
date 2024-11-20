import ZLPhotoBrowser

extension ZLPhotoUIConfiguration {
  func updateUiConfiguration(from config: RawUiConfiguration) {
    self.sortAscending = config.sortAscending
    self.adjustSliderType =
      ZLAdjustSliderType(rawValue: config.adjustSliderType.rawValue) ?? .vertical
    self.animateSelectBtnWhenSelectInPreviewVC = config.animateSelectBtnWhenSelectInPreviewVC
    self.animateSelectBtnWhenSelectInThumbVC = config.animateSelectBtnWhenSelectInThumbVC
    self.cellCornerRadio = CGFloat(config.cellCornerRadio)
    self.columnCount = Int(config.columnCount)
    self.hudStyle = ZLProgressHUD.Style(rawValue: config.hudStyle.rawValue) ?? .dark
    self.languageType = ZLLanguageType(rawValue: config.languageType.rawValue) ?? .system
    self.minimumInteritemSpacing = CGFloat(config.minimumItemSpacing)
    self.minimumLineSpacing = CGFloat(config.minimumLineSpacing)
    self.navCancelButtonStyle =
      ZLPhotoUIConfiguration.CancelButtonStyle(rawValue: config.navCancelButtonStyle.rawValue)
      ?? .image
    self.selectBtnAnimationDuration = CFTimeInterval(config.selectBtnAnimationDuration)
    self.shouldCenterTools = config.shouldCenterTools
    self.showAddPhotoButton = config.showAddPhotoButton
    self.showCaptureImageOnTakePhotoBtn = config.showCaptureImageOnTakePhotoBtn
    self.showEnterSettingTips = config.showEnterSettingTips
    self.showIndexOnSelectBtn = config.showIndexOnSelectBtn
    self.showInvalidMask = config.showInvalidMask
    self.showScrollToBottomBtn = config.showScrollToBottomBtn
    self.showSelectedBorder = config.showSelectedBorder
    self.showSelectedMask = config.showSelectedMask
    self.showSelectedPhotoPreview = config.showSelectedPhotoPreview
    self.showStatusBarInPreviewInterface = config.showStatusBarInPreviewInterface
    self.style = ZLPhotoBrowserStyle(rawValue: config.style.rawValue) ?? .embedAlbumList
    self.themeColor = UIColor(rgbValue: config.themeColor)
    self.themeFontName = config.themeFontName
    self.timeout = TimeInterval(config.timeout)
    self.statusBarStyle = {
      if let isDark = config.isDarkStatusBarStyle {
        if #available(iOS 13.0, *) {
          return isDark ? .darkContent : .lightContent
        } else {
          return isDark ? .default : .lightContent
        }
      } else {
        return .default
      }
    }()
  }
}
