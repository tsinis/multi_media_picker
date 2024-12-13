#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint multi_media_picker.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'multi_media_picker'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin that shows an multimedia picker.'
  s.description      = <<-DESC
A Flutter plugin for picking multimedia from the gallery, and taking new pictures/videos with the camera.
Downloaded by pub (not CocoaPods).
                       DESC
  s.homepage         = 'https://tsin.is'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Roman Cinis' => 'tsinis.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'multi_media_picker/Sources/multi_media_picker/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.resource_bundles = {'multi_media_picker_privacy' => ['multi_media_picker/Sources/multi_media_picker/Resources/PrivacyInfo.xcprivacy']}
end
