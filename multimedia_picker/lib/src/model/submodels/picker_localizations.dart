import 'package:flutter/foundation.dart' show immutable;

@immutable
class PickerLocalizations {
  const PickerLocalizations({String? iOsCameraTapToRecordVideoTip})
    : _iOsCameraTapToRecordVideoTip = iOsCameraTapToRecordVideoTip;

  final String? _iOsCameraTapToRecordVideoTip;

  static String _trimOrEmpty(String? text) => text?.trim() ?? '';

  String get iOsCameraTapToRecordVideoTip =>
      _trimOrEmpty(_iOsCameraTapToRecordVideoTip);

  @override
  String toString() =>
      'PickerLocalizations('
      '''${iOsCameraTapToRecordVideoTip.isEmpty ? '' : 'iOsCameraTapToRecordVideoTip: $iOsCameraTapToRecordVideoTip, '}'''
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickerLocalizations &&
        other.iOsCameraTapToRecordVideoTip == iOsCameraTapToRecordVideoTip;
  }

  @override
  int get hashCode => iOsCameraTapToRecordVideoTip.hashCode;
}
