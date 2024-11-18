import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

import 'ui/tabs/camera_tab.dart';
import 'ui/tabs/preview_tab.dart';

void main() => runApp(const Main());

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  final _cameraConfig = ValueNotifier(const CameraConfiguration());
  final _media = ValueNotifier<RawMediaData?>(null);
  late final _tabController = TabController(length: 2, vsync: this);

  Future<void> _handleCamera() async {
    final picker = MultiMediaPicker(cameraConfiguration: _cameraConfig.value);
    final media = await picker.openCamera();
    if (media == null) return;
    _media.value = media;
    _tabController.animateTo(1);
  }

  @override
  void dispose() {
    _cameraConfig.dispose();
    _media.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: const [Tab(text: 'Camera'), Tab(text: 'Preview')],
            ),
            title: const Text('Multi Media Picker'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [CameraTab(_cameraConfig), PreviewTab(_media)],
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'camera',
            // ignore: avoid-passing-async-when-sync-expected, not necessary.
            onPressed: _handleCamera,
            tooltip: 'Open Camera',
            child: const Icon(Icons.camera_alt_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
        theme: ThemeData.dark(),
      );
}
