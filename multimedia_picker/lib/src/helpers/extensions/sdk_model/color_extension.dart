import 'dart:ui';

extension ColorExtension on Color {
  int get rawValue =>
      _floatToInt8(a) << 24 |
      _floatToInt8(r) << 16 |
      _floatToInt8(g) << 8 |
      _floatToInt8(b);

  // ignore: no-magic-number, used in old value calculation.
  int _floatToInt8(double x) => (x * 255).round() & 0xff;
}
