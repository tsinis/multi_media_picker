// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';
import '../../../../model/media_data.dart';

extension MaybeMediaDataExtension on MediaData? {
  bool get isVideo => this?.type == MediaType.video;
}
