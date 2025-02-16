# multimedia_picker_platform_interface

A common platform interface for the `multimedia_picker` plugin.

This interface allows platform-specific implementations of the `multimedia_picker` plugin, as well as the plugin itself, to ensure they are supporting the same interface.

## Usage

To implement a new platform-specific implementation of `multimedia_picker`, extend `MultimediaPickerPlatform` with an implementation that performs the platform-specific behavior.
