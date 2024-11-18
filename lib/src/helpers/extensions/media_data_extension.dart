import 'dart:io';

import '../../messages.g.dart';
import '../../model/media_data.dart';

extension MediaDataExtension on RawMediaData {
  MediaData toMediaData() {
    final mediaFile = File(path);
    assert(mediaFile.existsSync(), 'Media file $path does not exist!');
    final thumb = (thumbPath?.isEmpty ?? true) ? null : File(thumbPath ?? '');

    return MediaData(mediaFile, size: size, thumbnail: thumb, type: type);
  }
}
