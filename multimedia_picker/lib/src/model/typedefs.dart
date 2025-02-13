import 'dart:collection' show UnmodifiableListView;

import 'package:flutter/foundation.dart';

import 'media_data.dart';

typedef MediaDataList = UnmodifiableListView<MediaData>;

typedef DateTimeProvider = ValueGetter<DateTime>;
