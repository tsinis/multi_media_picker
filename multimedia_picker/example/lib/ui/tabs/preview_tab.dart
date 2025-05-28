import 'package:flutter/material.dart';
import 'package:multimedia_picker/multimedia_picker.dart';
import 'package:world_countries/helpers.dart';

class PreviewTab extends StatelessWidget {
  const PreviewTab(this._media, {super.key});

  final ValueNotifier<MediaData?> _media;

  Future<void> _handleEdit() async {
    final media = await const MultimediaPicker().tryEditMedia(_media.value);
    if (media != null) _media.value = media;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    builder: (_, mediaData, _) => MaybeWidget.identifiable(
      mediaData?.thumbnail,
      (thumbnail) => InkWell(
        // ignore: avoid-passing-async-when-sync-expected, just example.
        onTap: _handleEdit,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: Tooltip(
            message: mediaData?.toString(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: FileImage(thumbnail)),
              ),
              key: ValueKey(mediaData?.fileSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaybeWidget(
                    mediaData?.filename(),
                    (filename) => Chip(
                      avatar: Icon(
                        mediaData.isVideo
                            ? Icons.smart_display_rounded
                            : Icons.image_rounded,
                      ),
                      label: Text(filename),
                    ),
                  ),
                  MaybeWidget(
                    mediaData?.formattedSize(),
                    (size) => Chip(
                      avatar: const Icon(Icons.straighten),
                      label: Text(size),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      orElse: const Center(child: Text('No media to preview.')),
    ),
    valueListenable: _media,
  );
}
