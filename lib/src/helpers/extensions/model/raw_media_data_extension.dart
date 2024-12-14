import '../../../messages.g.dart';
import '../../../model/media_data.dart';

extension RawMediaDataExtension on MediaData {
  RawMediaData? get raw {
    final hasFile = file.existsSync();
    assert(hasFile, 'Media file $file does not exist!');
    if (!hasFile) return null;

    return RawMediaData(
      path: file.path,
      thumbPath: thumbnail?.path,
      type: type,
    );
  }
}
