import 'dart:io' show File;

import 'package:flutter/foundation.dart' show immutable;
// ignore: depend_on_referenced_packages, it has vertical dependency structure.
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart';

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

  factory MediaData.fromFile(
    File file, {
    Duration duration = Duration.zero,
    int? fileSize,
    File? thumbnail,
    DateTime? timestamp,
    MediaType type = MediaType.image,
    // ignore: avoid-non-empty-constructor-bodies, it's a factory constructor.
  }) {
    DateTime? maybeTimestamp = timestamp;
    if (maybeTimestamp == null) {
      try {
        maybeTimestamp = file.lastModifiedSync();
        // ignore: avoid_catches_without_on_clauses, it's a generic catch.
      } catch (_) {
        maybeTimestamp = DateTime.now().toUtc();
      }
    }

    int? maybeFileSize = fileSize;
    if (maybeFileSize == null) {
      try {
        maybeFileSize = file.lengthSync();
        // ignore: avoid_catches_without_on_clauses, it's a generic catch.
      } catch (_) {
        maybeFileSize = -1;
      }
    }

    return MediaData(
      file,
      duration: duration,
      fileSize: maybeFileSize,
      thumbnail: thumbnail,
      timestamp: maybeTimestamp,
      type: type,
    );
  }
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
  }) => MediaData(
    file ?? this.file,
    duration: duration ?? this.duration,
    fileSize: fileSize ?? this.fileSize,
    thumbnail: thumbnail ?? this.thumbnail,
    timestamp: timestamp ?? this.timestamp,
    type: type ?? this.type,
  );

  @override
  String toString() =>
      'MediaData(media: File("${file.path}"), '
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
