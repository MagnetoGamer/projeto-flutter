import 'package:flutter/material.dart';
import '../../core/platform/platform_detector.dart';
import 'views/login_view_android.dart';
import 'views/login_view_ios.dart';
import 'views/login_view_linux.dart';
import 'views/login_view_mac.dart';
import 'views/login_view_windows.dart';
import 'views/login_view_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.currentPlatform) {
      case AppPlatform.android:
        return const LoginViewAndroid();
      case AppPlatform.ios:
        return const LoginViewIOS();
      case AppPlatform.linux:
        return const LoginViewLinux();
      case AppPlatform.macos:
        return const LoginViewMacOS();
      case AppPlatform.windows:
        return const LoginViewWindows();
      case AppPlatform.web:
        return const LoginViewWeb();
      default:
        return const LoginViewAndroid();
    }
  }
}

