import 'package:dartz/dartz.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';
import '../../core/exceptions/failure.dart';

class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<Either<Failure, List<Character>>> call() {
    return repository.getAllCharacters();
  }
}

