import 'package:flutter/material.dart';
import '../../core/platform/platform_detector.dart';
import 'views/film_details_view_android.dart';
import 'views/film_details_view_ios.dart';
import 'views/film_details_view_linux.dart';
import 'views/film_details_view_mac.dart';
import 'views/film_details_view_windows.dart';
import 'views/film_details_view_web.dart';

class FilmDetailsPage extends StatelessWidget {
  final String filmId;

  const FilmDetailsPage({
    super.key,
    required this.filmId,
  });

  @override
  Widget build(BuildContext context) {
    switch (PlatformDetector.currentPlatform) {
      case AppPlatform.android:
        return FilmDetailsViewAndroid(filmId: filmId);
      case AppPlatform.ios:
        return FilmDetailsViewIOS(filmId: filmId);
      case AppPlatform.linux:
        return FilmDetailsViewLinux(filmId: filmId);
      case AppPlatform.macos:
        return FilmDetailsViewMacOS(filmId: filmId);
      case AppPlatform.windows:
        return FilmDetailsViewWindows(filmId: filmId);
      case AppPlatform.web:
        return FilmDetailsViewWeb(filmId: filmId);
      default:
        return FilmDetailsViewAndroid(filmId: filmId);
    }
  }
}

