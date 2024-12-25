import 'dart:io' show File;

import 'package:flutter/foundation.dart' show immutable;

import '../messages.g.dart';

@immutable
class MediaData {
  const MediaData(
    this.file, {
    required this.timestamp,
    this.duration = Duration.zero,
    this.fileSize = 0,
    this.thumbnail,
    this.type = MediaType.image,
  });

  MediaData.fromFile(
    this.file, {
    this.duration = Duration.zero,
    int? fileSize,
    this.thumbnail,
    DateTime? timestamp,
    this.type = MediaType.image,
  })  : timestamp = timestamp ?? file.lastModifiedSync(),
        fileSize = fileSize ?? file.lengthSync();

  final File file;
  final Duration duration;
  final int fileSize;
  final File? thumbnail;
  final DateTime timestamp;
  final MediaType type;

  MediaData copyWith({
    Duration? duration,
    File? file,
    int? fileSize,
    File? thumbnail,
    DateTime? timestamp,
    MediaType? type,
  }) =>
      MediaData(
        file ?? this.file,
        duration: duration ?? this.duration,
        fileSize: fileSize ?? this.fileSize,
        thumbnail: thumbnail ?? this.thumbnail,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
      );

  @override
  String toString() => 'MediaData(media: File("${file.path}"), '
      'duration: $duration, fileSize: $fileSize, timestamp: $timestamp, '
      '''${thumbnail?.path == null ? '' : 'thumbnail: File("${thumbnail?.path}"), '}'''
      'type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MediaData &&
        other.file == file &&
        other.timestamp == timestamp &&
        other.duration == duration &&
        other.type == type &&
        other.thumbnail == thumbnail &&
        other.fileSize == fileSize;
  }

  @override
  int get hashCode =>
      file.hashCode ^
      timestamp.hashCode ^
      duration.hashCode ^
      type.hashCode ^
      thumbnail.hashCode ^
      fileSize.hashCode;
}
