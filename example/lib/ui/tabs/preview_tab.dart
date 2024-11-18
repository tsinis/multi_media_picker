// ignore_for_file: avoid-nullable-interpolation, TODO: Remove this.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import 'package:world_countries/helpers.dart';

class PreviewTab extends StatelessWidget {
  const PreviewTab(this._media, {super.key});

  final ValueNotifier<MediaData?> _media;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        builder: (_, mediaData, __) => MaybeWidget(
          mediaData?.thumbnail?.path,
          (thumbnail) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('File: ${mediaData?.file.path}'),
              Text('Size: ${mediaData?.size}', textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Expanded(
                child: Image.file(
                  File(thumbnail),
                  fit: BoxFit.cover,
                  semanticLabel: 'Media Preview',
                ),
              ),
            ],
          ),
          orElse: const Center(child: Text('No media to preview.')),
        ),
        valueListenable: _media,
      );
}
