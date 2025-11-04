import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> filmIds;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.filmIds,
  });

  @override
  List<Object> get props => [id, name, description, imageUrl, filmIds];
}

