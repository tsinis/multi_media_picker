
import 'multi_media_picker_platform_interface.dart';

class MultiMediaPicker {
  Future<String?> getPlatformVersion() {
    return MultiMediaPickerPlatform.instance.getPlatformVersion();
  }
}
