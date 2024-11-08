import 'package:flutter_test/flutter_test.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import 'package:multi_media_picker/multi_media_picker_platform_interface.dart';
import 'package:multi_media_picker/multi_media_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMultiMediaPickerPlatform
    with MockPlatformInterfaceMixin
    implements MultiMediaPickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MultiMediaPickerPlatform initialPlatform = MultiMediaPickerPlatform.instance;

  test('$MethodChannelMultiMediaPicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMultiMediaPicker>());
  });

  test('getPlatformVersion', () async {
    MultiMediaPicker multiMediaPickerPlugin = MultiMediaPicker();
    MockMultiMediaPickerPlatform fakePlatform = MockMultiMediaPickerPlatform();
    MultiMediaPickerPlatform.instance = fakePlatform;

    expect(await multiMediaPickerPlugin.getPlatformVersion(), '42');
  });
}
