import 'package:dartz/dartz.dart';
import '../entities/character.dart';
import '../../core/exceptions/failure.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();
  Future<Either<Failure, Character>> getCharacterById(String id);
}

