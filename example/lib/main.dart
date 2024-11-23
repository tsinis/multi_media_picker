import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

import 'ui/tabs/camera_tab.dart';
import 'ui/tabs/preview_tab.dart';
import 'ui/tabs/ui_tab.dart';

void main() => runApp(const Main());

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  static const _tabs = [
    Tab(text: 'Camera'),
    Tab(text: 'UI'),
    Tab(text: 'Preview'),
  ];

  final _cameraConfig = ValueNotifier(const CameraConfiguration());
  final _uiConfig = ValueNotifier(const UiConfiguration());
  final _media = ValueNotifier<MediaData?>(null);

  late final _tabController = TabController(length: _tabs.length, vsync: this);

  Future<void> _handlePicker() async {
    final picker = MultiMediaPicker(
      cameraConfiguration: _cameraConfig.value,
      uiConfiguration: _uiConfig.value,
    );

    final media = await picker.multipleFromCameraCount(1);
    if (media.isEmpty) return;
    _media.value = media.firstOrNull;
    _tabController.animateTo(_tabs.length - 1);
  }

  @override
  void dispose() {
    _cameraConfig.dispose();
    _media.dispose();
    _tabController.dispose();
    _uiConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(controller: _tabController, tabs: _tabs),
            title: const Text('Multi Media Picker'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              CameraTab(_cameraConfig),
              UiTab(_uiConfig),
              PreviewTab(_media),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'picker',
            // ignore: avoid-passing-async-when-sync-expected, not necessary.
            onPressed: _handlePicker,
            tooltip: 'Open Picker',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
        theme: ThemeData.dark(),
      );
}
