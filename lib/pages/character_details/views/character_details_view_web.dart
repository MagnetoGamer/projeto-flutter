import 'package:flutter/material.dart';
import 'character_details_view_android.dart';

class CharacterDetailsViewWeb extends StatelessWidget {
  final String characterId;

  const CharacterDetailsViewWeb({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return CharacterDetailsViewAndroid(characterId: characterId);
  }
}

