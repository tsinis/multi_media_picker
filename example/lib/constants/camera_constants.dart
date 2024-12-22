import 'package:flutter/material.dart' show Colors;
import 'package:multi_media_picker/multi_media_picker.dart';

sealed class CameraConstants {
  static const overlay = OverlayImage(
    'assets/grid.gif',
    isAsset: true,
    opacity: 1 / 2,
    tintColor: Colors.white,
  );
}
