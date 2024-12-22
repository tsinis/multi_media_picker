import '../../../../messages.g.dart';
import '../../../../model/media_data.dart';

extension MaybeMediaDataExtension on MediaData? {
  bool get isVideo => this?.type == MediaType.video;
}
