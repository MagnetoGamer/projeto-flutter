import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/film.dart';

class FilmCache {
  static const String _key = 'cached_films';

  Future<void> cacheFilms(List<Film> films) async {
    final prefs = await SharedPreferences.getInstance();
    final filmsJson = films.map((f) => {
      'id': f.id,
      'title': f.title,
      'description': f.description,
      'posterUrl': f.posterUrl,
      'releaseYear': f.releaseYear,
      'director': f.director,
      'characterIds': f.characterIds,
    }).toList();
    await prefs.setString(_key, jsonEncode(filmsJson));
  }

  Future<List<Film>> getCachedFilms() async {
    final prefs = await SharedPreferences.getInstance();
    final filmsJson = prefs.getString(_key);
    
    if (filmsJson == null) {
      return [];
    }
    
    final List<dynamic> decoded = jsonDecode(filmsJson);
    return decoded.map((json) => Film(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      posterUrl: json['posterUrl'] as String,
      releaseYear: json['releaseYear'] as int,
      director: json['director'] as String,
      characterIds: List<String>.from(json['characterIds'] as List),
    )).toList();
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

