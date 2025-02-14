import 'dart:async' show unawaited;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextStyledListTile extends ListTile {
  TextStyledListTile({
    required AsyncCallback onTap,
    super.key,
    super.leading,
    super.subtitle,
    super.title,
    super.trailing,
  }) : super(
         onTap: () => unawaited(onTap()),
         leadingAndTrailingTextStyle: const TextStyle(),
       );
}
