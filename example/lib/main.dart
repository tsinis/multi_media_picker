import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

import 'ui/tabs/camera_tab.dart';
import 'ui/tabs/preview_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final _cameraConfig = ValueNotifier(const CameraConfiguration());
  final _media = ValueNotifier<RawMediaData?>(null);
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _cameraConfig.dispose();
    _media.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _openCamera() async {
    final picker = MultiMediaPicker(cameraConfiguration: _cameraConfig.value);
    final media = await picker.openCamera();
    if (media == null) return;
    _media.value = media;
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Multi Media Picker'),
            bottom: TabBar(
              controller: _tabController,
              tabs: [Tab(text: 'Camera'), Tab(text: 'Preview')],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              CameraTab(_cameraConfig),
              PreviewTab(_media),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: _openCamera,
            child: Icon(Icons.camera_alt_outlined),
          ),
        ),
      );
}
