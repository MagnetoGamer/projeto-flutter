import 'package:flutter/material.dart';
import 'character_details_view_android.dart';

class CharacterDetailsViewLinux extends StatelessWidget {
  final String characterId;

  const CharacterDetailsViewLinux({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return CharacterDetailsViewAndroid(characterId: characterId);
  }
}

