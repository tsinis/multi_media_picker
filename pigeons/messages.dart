import 'package:pigeon/pigeon.dart';

enum MediaType { image, video }

class MediaData {
  const MediaData(this.path, this.type);

  final String path;
  final MediaType type;
}

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  swiftOut: 'ios/Sources/messages.g.swift',
))
@HostApi()
abstract class MessageApi {
  List<MediaData> getMedia(MediaType type);
}
