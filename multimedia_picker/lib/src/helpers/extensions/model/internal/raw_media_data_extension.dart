import 'dart:io';

import 'package:flutter/rendering.dart' show FileImage, imageCache;
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

import '../../../../model/media_data.dart';
import '../../../../model/typedefs.dart';

extension RawMediaDataExtension on RawMediaData {
  MediaData toMediaData({DateTimeProvider? dateTimeProvider}) {
    final mediaFile = File(path);
    if (!mediaFile.existsSync()) {
      throw FileSystemException('Media file does not exist!', path);
    }
    final thumbnail = thumbPath?.trim() ?? '';

    return MediaData.fromFile(
      mediaFile,
      duration: Duration(seconds: durationSec ?? 0),
      thumbnail: thumbnail.isEmpty ? null : File(thumbnail),
      timestamp: dateTimeProvider?.call(),
      type: type,
    );
  }

  bool willEvictImageCache(MediaData? oldData) {
    if (oldData == null) return false;
    final thumbnail = thumbPath ?? '';
    if (thumbnail.isEmpty || thumbnail != oldData.thumbnail?.path) return false;

    return imageCache.evict(FileImage(File(thumbnail)));
  }
}
