import 'package:equatable/equatable.dart';

class Film extends Equatable {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final int releaseYear;
  final String director;
  final List<String> characterIds;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.releaseYear,
    required this.director,
    required this.characterIds,
  });

  @override
  List<Object> get props =>
      [id, title, description, posterUrl, releaseYear, director, characterIds];
}

