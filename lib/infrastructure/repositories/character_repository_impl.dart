import 'package:dartz/dartz.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/entities/character.dart';
import '../../core/exceptions/failure.dart';
import '../datasources/remote/character_api.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApi api;

  CharacterRepositoryImpl(this.api);

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    try {
      final characters = await api.getAllCharacters();
      return Right(characters);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Character>> getCharacterById(String id) async {
    try {
      final character = await api.getCharacterById(id);
      return Right(character);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }
}

