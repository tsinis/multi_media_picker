import 'overlay_image.dart';

class NamedImage<T extends Object> {
  const NamedImage({this.directoryPath, T? imageNameToSave, this.overlay})
      : _imageNameToSave = imageNameToSave;

  final String? directoryPath;
  final OverlayImage? overlay;
  final T? _imageNameToSave;

  String? get name => _imageNameToSave?.toString().trim();
}
