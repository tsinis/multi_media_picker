import 'dart:io';

import 'package:flutter/material.dart';

import 'package:multi_media_picker/multi_media_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _multiMediaPicker = MultiMediaPicker();
  String? path;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Multi Media Picker')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: Text('Open Camera'),
                onPressed: () async {
                  final media = await _multiMediaPicker.openCamera();
                  if (media != null) setState(() => path = media.thumbPath);
                },
              ),
              if (path != null)
                Image.file(File(path!), fit: BoxFit.contain, height: 300),
            ],
          ),
        ),
      );
}
