import 'dart:io';

import 'package:flutter/rendering.dart';

import '../../../messages.g.dart';
import '../../../model/media_data.dart';

extension RawMediaDataExtension on RawMediaData {
  MediaData toMediaData() {
    final mediaFile = File(path);
    assert(mediaFile.existsSync(), 'Media file $path does not exist!');
    final thumbnail = thumbPath?.trim() ?? '';

    return MediaData(
      mediaFile,
      duration: Duration(seconds: duration ?? 0),
      fileSize: mediaFile.lengthSync(),
      thumbnail: thumbnail.isEmpty ? null : File(thumbnail),
      timestamp: DateTime.now().toUtc(),
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
