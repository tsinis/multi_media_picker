#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'multimedia_picker_ios'
  s.version          = '0.0.1'
  s.swift_version    = '5.0'
  s.platform         = :ios, '13.0'
  s.summary          = 'Flutter plugin that shows an multimedia picker.'
  s.description      = <<-DESC
Flutter plugin for selecting multimedia data from the iOS media library, and taking new media with the camera.
Downloaded by pub (not CocoaPods).
                       DESC
  s.homepage         = 'https://github.com/tsinis/multi_media_picker'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Roman Cinis' => 'tsinis.dev@gmail.com' }
  s.source           = { :http => 'https://github.com/tsinis/multi_media_picker/tree/main/multimedia_picker_ios' }
  s.documentation_url = 'https://pub.dev/packages/multimedia_picker_ios'
  s.source_files = 'multimedia_picker_ios/Sources/**/*.swift'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'ZLPhotoBrowser', '~> 4.7.0.1'
  s.dependency 'Flutter'
  s.xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)/ $(SDKROOT)/usr/lib/swift',
    'LD_RUNPATH_SEARCH_PATHS' => '/usr/lib/swift'
  }
  s.resource_bundles = {
    'multimedia_picker_ios_privacy' => [
      'multimedia_picker_ios/Sources/multimedia_picker_ios/Resources/PrivacyInfo.xcprivacy'
    ]
  }
end