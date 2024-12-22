import '../../../../messages.g.dart';

extension DevicePositionExtension on DevicePosition? {
  bool get isFront => this == DevicePosition.front;
}
