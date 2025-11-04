import 'package:flutter/material.dart';
import 'film_details_view_android.dart';

class FilmDetailsViewWeb extends StatelessWidget {
  final String filmId;

  const FilmDetailsViewWeb({
    super.key,
    required this.filmId,
  });

  @override
  Widget build(BuildContext context) {
    return FilmDetailsViewAndroid(filmId: filmId);
  }
}

