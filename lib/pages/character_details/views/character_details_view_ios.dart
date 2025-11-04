import 'package:flutter/material.dart';
import 'character_details_view_android.dart';

class CharacterDetailsViewIOS extends StatelessWidget {
  final String characterId;

  const CharacterDetailsViewIOS({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return CharacterDetailsViewAndroid(characterId: characterId);
  }
}

