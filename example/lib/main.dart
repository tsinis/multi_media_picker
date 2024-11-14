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
  final _multiMediaPicker = MultiMediaPicker();
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
                  final result = await _multiMediaPicker.openCamera();
                  if (result == null) return;
                  setState(() => path = result.thumbPath);
                },
              ),
              if (path != null)
                Image.file(File(path!), fit: BoxFit.contain, height: 300),
            ],
          ),
        ),
      );
}
