import 'package:flutter/material.dart';
import '../../core/platform/platform_detector.dart';
import 'views/character_details_view_android.dart';
import 'views/character_details_view_ios.dart';
import 'views/character_details_view_linux.dart';
import 'views/character_details_view_mac.dart';
import 'views/character_details_view_windows.dart';
import 'views/character_details_view_web.dart';

class CharacterDetailsPage extends StatelessWidget {
  final String characterId;

  const CharacterDetailsPage({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.currentPlatform) {
      case AppPlatform.android:
        return CharacterDetailsViewAndroid(characterId: characterId);
      case AppPlatform.ios:
        return CharacterDetailsViewIOS(characterId: characterId);
      case AppPlatform.linux:
        return CharacterDetailsViewLinux(characterId: characterId);
      case AppPlatform.macos:
        return CharacterDetailsViewMacOS(characterId: characterId);
      case AppPlatform.windows:
        return CharacterDetailsViewWindows(characterId: characterId);
      case AppPlatform.web:
        return CharacterDetailsViewWeb(characterId: characterId);
      default:
        return CharacterDetailsViewAndroid(characterId: characterId);
    }
  }
}

