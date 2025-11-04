import 'package:flutter/foundation.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_all_characters.dart';
import '../../core/exceptions/failure.dart';

class CharacterProvider extends ChangeNotifier {
  final GetAllCharacters getAllCharacters;

  CharacterProvider(this.getAllCharacters);

  bool _isLoading = false;
  List<Character> _characters = [];
  Failure? _error;

  bool get isLoading => _isLoading;
  List<Character> get characters => _characters;
  Failure? get error => _error;

  Future<void> loadCharacters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getAllCharacters();

    result.fold(
      (failure) {
        _error = failure;
        _isLoading = false;
        notifyListeners();
      },
      (characters) {
        _characters = characters;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
    );
  }
}

