import 'package:flutter/material.dart';
import '../../core/platform/platform_detector.dart';
import 'views/chat_view_android.dart';
import 'views/chat_view_ios.dart';
import 'views/chat_view_linux.dart';
import 'views/chat_view_mac.dart';
import 'views/chat_view_windows.dart';
import 'views/chat_view_web.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.currentPlatform) {
      case AppPlatform.android:
        return const ChatViewAndroid();
      case AppPlatform.ios:
        return const ChatViewIOS();
      case AppPlatform.linux:
        return const ChatViewLinux();
      case AppPlatform.macos:
        return const ChatViewMacOS();
      case AppPlatform.windows:
        return const ChatViewWindows();
      case AppPlatform.web:
        return const ChatViewWeb();
      default:
        return const ChatViewAndroid();
    }
  }
}

