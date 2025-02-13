import 'dart:io';

import 'package:flutter/rendering.dart';

// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';
import '../../../../model/media_data.dart';
import '../../../../model/typedefs.dart';

extension RawMediaDataExtension on RawMediaData {
  MediaData toMediaData({DateTimeProvider? dateTimeProvider}) {
    final mediaFile = File(path);
    assert(mediaFile.existsSync(), 'Media file $path does not exist!');
    final thumbnail = thumbPath?.trim() ?? '';

    return MediaData(
      mediaFile,
      duration: Duration(seconds: duration ?? 0),
      fileSize: mediaFile.lengthSync(),
      thumbnail: thumbnail.isEmpty ? null : File(thumbnail),
      timestamp: dateTimeProvider?.call() ?? DateTime.now().toUtc(),
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
