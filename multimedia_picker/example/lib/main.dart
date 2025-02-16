// ignore_for_file: avoid-passing-async-when-sync-expected, just an example app.

import 'dart:io' show Directory;

import 'package:flutter/material.dart';
import 'package:multimedia_picker/multimedia_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/tabs/camera_tab.dart';
import 'ui/tabs/preview_tab.dart';
import 'ui/tabs/ui_tab.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docsDir = await getApplicationDocumentsDirectory();
  runApp(Main(docsDir));
}

class Main extends StatefulWidget {
  const Main(this.outputDir, {super.key});

  final Directory outputDir;

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

  Future<void> _handleCameraPicker() =>
      _pickMedia((picker) => picker.multipleFromCameraCount(1));

  Future<void> _handleGalleryPicker() =>
      _pickMedia((picker) => picker.openGallery());

  Future<void> _pickMedia(
    // ignore: prefer-typedefs-for-callbacks, just an example app.
    Future<List<MediaData>> Function(MultimediaPicker picker) action,
  ) async {
    final picker = MultimediaPicker(
      cameraConfiguration: _cameraConfig.value,
      pickerConfiguration: PickerConfiguration(
        directory: widget.outputDir,
        filename: 'file',
      ),
      uiConfiguration: _uiConfig.value,
    );

    final media = await action(picker);
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
    darkTheme: ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: _tabs),
        title: const Text('Multi-Media Picker'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraTab(_cameraConfig),
          UiTab(_uiConfig),
          PreviewTab(_media),
        ],
      ),
      floatingActionButton: InkWell(
        onLongPress: _handleGalleryPicker,
        // ignore: prefer-action-button-tooltip, we have long press too.
        child: FloatingActionButton(
          heroTag: '$FloatingActionButton',
          onPressed: _handleCameraPicker,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
    theme: ThemeData.light(),
  );
}
