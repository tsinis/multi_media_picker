// ignore_for_file: avoid-barrel-files, those are package exports.

export 'package:multimedia_picker_platform_interface/multimedia_picker_platform_interface.dart'
    hide // TODO: Keep reducing the scope of it.
        RawCameraConfiguration,
        RawEditConfiguration,
        RawLocalizations,
        RawMediaData,
        RawOverlayImage,
        RawPickerConfiguration,
        RawUiConfiguration;

export 'src/api/multimedia_picker.dart';
export 'src/helpers/extensions/model/public/camera_configuration_extension.dart';
export 'src/helpers/extensions/model/public/device_position_extension.dart';
export 'src/helpers/extensions/model/public/maybe_media_data_extension.dart';
export 'src/helpers/extensions/model/public/media_data_extension.dart';
export 'src/helpers/extensions/model/public/overlay_image_extension.dart';
export 'src/helpers/extensions/multimedia_picker_extension.dart';
export 'src/helpers/multimedia_picker_defaults.dart';
export 'src/model/configs/camera_configuration.dart';
export 'src/model/configs/edit_configuration.dart';
export 'src/model/configs/picker_configuration.dart';
export 'src/model/configs/ui_configuration.dart';
export 'src/model/media_data.dart';
export 'src/model/submodels/overlay_image.dart';
export 'src/model/submodels/picker_localizations.dart';
export 'src/ui/widgets/common/animated_child_switcher.dart';
export 'src/ui/widgets/configs/camera_configuration_list_view.dart';
export 'src/ui/widgets/configs/ui_configuration_list_view.dart';
