import '../../domain/entities/character.dart';

class CharacterMapper {
  static Character fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      filmIds: List<String>.from(json['filmIds'] as List),
    );
  }

  static Map<String, dynamic> toJson(Character character) {
    return {
      'id': character.id,
      'name': character.name,
      'description': character.description,
      'imageUrl': character.imageUrl,
      'filmIds': character.filmIds,
    };
  }
}

