import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

enum AppPlatform {
  android,
  ios,
  linux,
  macos,
  windows,
  web,
  unknown,
}

class PlatformDetector {
  static AppPlatform get currentPlatform {
    if (kIsWeb) {
      return AppPlatform.web;
    } else if (Platform.isAndroid) {
      return AppPlatform.android;
    } else if (Platform.isIOS) {
      return AppPlatform.ios;
    } else if (Platform.isLinux) {
      return AppPlatform.linux;
    } else if (Platform.isMacOS) {
      return AppPlatform.macos;
    } else if (Platform.isWindows) {
      return AppPlatform.windows;
    } else {
      return AppPlatform.unknown;
    }
  }

  static bool get isWeb => kIsWeb;
  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  static bool get isDesktop =>
      !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
}

