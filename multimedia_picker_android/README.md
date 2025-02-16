# multimedia_picker_android

The Android implementation of [`multimedia_picker`](../../multimedia_picker/).

## Usage

This package is [endorsed](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#endorsed-federated-plugin), which means you can simply use `multimedia_picker` normally. This package will be automatically included in your app when you do.

## Notes for Contributors

### Android

This package is implemented in Kotlin and uses Gradle for dependency management. The main implementation is in the `android/src/main/kotlin` directory.

### Requirements

- Minimum SDK version: 21 (Android 5.0)
- Target SDK version: 34 (Android 14)
- Kotlin version: 1.9.22 or higher
- AGP version: 8.2.0 or higher

### Permission Requirements

Add these permissions to your Android Manifest (`android/app/src/main/AndroidManifest.xml`):

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="32" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="32" />
```

Note: For Android 13 and above, the plugin handles permission requests automatically using the new photo picker API.
