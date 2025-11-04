import '../../domain/entities/film.dart';

class FilmMapper {
  static Film fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      posterUrl: json['posterUrl'] as String,
      releaseYear: json['releaseYear'] as int,
      director: json['director'] as String,
      characterIds: List<String>.from(json['characterIds'] as List),
    );
  }

  static Map<String, dynamic> toJson(Film film) {
    return {
      'id': film.id,
      'title': film.title,
      'description': film.description,
      'posterUrl': film.posterUrl,
      'releaseYear': film.releaseYear,
      'director': film.director,
      'characterIds': film.characterIds,
    };
  }
}

