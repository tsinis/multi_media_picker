import 'dart:io' show File;

import 'package:flutter/foundation.dart' show ValueGetter, immutable, protected;
import 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart'
    show MediaType, RawMediaData;

@immutable
// ignore: avoid_implementing_value_types, breaking change.
class MediaData implements RawMediaData {
  const MediaData(
    this.file, {
    required this.timestamp,
    this.duration = Duration.zero,
    this.fileSize = 0,
    this.thumbnail,
    this.type = MediaType.image,
  });

  MediaData.ts(
    this.file, {
    this.duration = Duration.zero,
    this.fileSize = 0,
    this.thumbnail,
    ValueGetter<DateTime> timestamp = DateTime.timestamp,
    this.type = MediaType.image,
  }) : timestamp = timestamp();

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
        maybeTimestamp = DateTime.timestamp();
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

  @override
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

  // [RawMediaData] implementations, since it's Pigeon generated class...

  @override
  int get durationSec => duration.inSeconds;

  @override
  String get path => file.path;

  @override
  String? get thumbPath => thumbnail?.path;

  @override
  List<Object?> encode() => [path, thumbPath, type, durationSec];

  static const _readOnlyError =
      "MediaData is immutable, you can't change its properties.";

  @override
  @protected
  set durationSec(int? value) => throw UnsupportedError(_readOnlyError);

  @override
  @protected
  set path(String value) => throw UnsupportedError(_readOnlyError);

  @override
  @protected
  set thumbPath(String? value) => throw UnsupportedError(_readOnlyError);

  @override
  @protected
  set type(MediaType value) => throw UnsupportedError(_readOnlyError);
}
