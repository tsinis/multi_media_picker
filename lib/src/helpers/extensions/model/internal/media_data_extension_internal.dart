import '../../../../messages.g.dart';
import '../../../../model/media_data.dart';

extension MediaDataExtensionInternal on MediaData {
  RawMediaData? get raw {
    final hasFile = file.existsSync();
    assert(hasFile, 'Media file $file does not exist!');

    return hasFile
        ? RawMediaData(
            path: file.path,
            thumbPath: thumbnail?.path,
            type: type,
          )
        : null;
  }
}
