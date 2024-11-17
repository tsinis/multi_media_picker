import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import 'package:world_countries/helpers.dart';

class PreviewTab extends StatelessWidget {
  const PreviewTab(this._media, {super.key});

  final ValueNotifier<RawMediaData?> _media;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<RawMediaData?>(
        valueListenable: _media,
        builder: (_, mediaData, __) => MaybeWidget(
          mediaData?.thumbPath,
          (thumbnail) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('File: ${mediaData?.path}', textAlign: TextAlign.center),
              Text('Size: ${mediaData?.size}', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Expanded(child: Image.file(File(thumbnail), fit: BoxFit.cover)),
            ],
          ),
          orElse: Center(child: const Text('No media to preview.')),
        ),
      );
}
