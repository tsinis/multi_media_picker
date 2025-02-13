// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

extension DevicePositionExtension on DevicePosition? {
  bool get isFront => this == DevicePosition.front;
}
