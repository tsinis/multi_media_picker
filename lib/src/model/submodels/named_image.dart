import 'overlay_image.dart';

class NamedImage<T extends Object> {
  const NamedImage({T? image, this.overlay}) : _image = image;

  final OverlayImage? overlay;
  final T? _image;

  String? get fileName => _image?.toString();
}
