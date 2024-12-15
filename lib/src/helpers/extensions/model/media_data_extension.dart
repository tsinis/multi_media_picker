import 'dart:math';

import '../../../model/enum/file_size_unit.dart';
import '../../../model/media_data.dart';

extension MediaDataExtension on MediaData {
  String formattedSize({
    int baseUnit = 1024,
    int fractionDigits = 2,
    List<Enum>? suffixes,
  }) {
    if (fileSize <= 0) return '0 ${FileSizeUnit.B.name}';
    final list = suffixes ?? FileSizeUnit.values;
    final i = (log(fileSize) / log(baseUnit)).floor();

    return '${(fileSize / pow(baseUnit, i)).toStringAsFixed(fractionDigits)} '
        '${list.elementAtOrNull(min(i, list.length - 1))?.name ?? ''}';
  }

  // ignore: prefer-boolean-prefixes, more convenient in Dart.
  String filename({bool withExtension = true}) {
    final name = file.path.split('/').lastOrNull ?? '';
    if (withExtension) return name;
    final dotIndex = name.lastIndexOf('.');

    // ignore: avoid-substring, filename has not emojis.
    return dotIndex.isNegative ? name : name.substring(0, dotIndex);
  }
}
