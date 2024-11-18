import 'dart:io' show File;

import 'package:flutter/foundation.dart' show immutable;

import '../messages.g.dart';

@immutable
class MediaData {
  const MediaData(
    this.file, {
    this.size,
    this.thumbnail,
    this.type = MediaType.image,
  });

  final File file;
  final int? size;
  final File? thumbnail;
  final MediaType type;

  MediaData copyWith({
    File? file,
    int? size,
    File? thumbnail,
    MediaType? type,
  }) =>
      MediaData(
        file ?? this.file,
        size: size ?? this.size,
        thumbnail: thumbnail ?? this.thumbnail,
        type: type ?? this.type,
      );

  @override
  String toString() => 'MediaData(media: File(${file.path}), '
      '${size == null ? '' : 'size: $size, '}'
      '''${thumbnail?.path == null ? '' : 'thumbnail: File(${thumbnail?.path}), '}'''
      'type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MediaData &&
        other.file == file &&
        other.type == type &&
        other.thumbnail == thumbnail &&
        other.size == size;
  }

  @override
  int get hashCode =>
      file.hashCode ^ type.hashCode ^ thumbnail.hashCode ^ size.hashCode;
}
