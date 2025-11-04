import 'package:flutter/material.dart';
import '../../core/platform/platform_detector.dart';
import 'views/home_view_android.dart';
import 'views/home_view_ios.dart';
import 'views/home_view_linux.dart';
import 'views/home_view_mac.dart';
import 'views/home_view_windows.dart';
import 'views/home_view_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.currentPlatform) {
      case AppPlatform.android:
        return const HomeViewAndroid();
      case AppPlatform.ios:
        return const HomeViewIOS();
      case AppPlatform.linux:
        return const HomeViewLinux();
      case AppPlatform.macos:
        return const HomeViewMacOS();
      case AppPlatform.windows:
        return const HomeViewWindows();
      case AppPlatform.web:
        return const HomeViewWeb();
      default:
        return const HomeViewAndroid();
    }
  }
}

