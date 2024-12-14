import 'dart:io';

import 'package:flutter/rendering.dart';

import '../../../messages.g.dart';
import '../../../model/media_data.dart';

extension MediaDataExtension on RawMediaData {
  MediaData toMediaData() {
    final mediaFile = File(path);
    assert(mediaFile.existsSync(), 'Media file $path does not exist!');
    final thumbnail = thumbPath?.trim() ?? '';
    final thumb = thumbnail.isEmpty ? null : File(thumbnail);
    const size = 1; // TODO! Get the actual size of the file.
    final durationInSec = Duration(seconds: duration ?? 0);

    return MediaData(
      mediaFile,
      duration: durationInSec,
      size: size,
      thumbnail: thumb,
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
