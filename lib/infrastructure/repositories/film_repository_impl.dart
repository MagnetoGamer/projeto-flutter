import 'package:dartz/dartz.dart';
import '../../domain/repositories/film_repository.dart';
import '../../domain/entities/film.dart';
import '../../core/exceptions/failure.dart';
import '../datasources/remote/film_api.dart';
import '../datasources/local/film_cache.dart';

class FilmRepositoryImpl implements FilmRepository {
  final FilmApi api;
  final FilmCache cache;

  FilmRepositoryImpl(this.api, this.cache);

  @override
  Future<Either<Failure, List<Film>>> getAllFilms() async {
    try {
      // Tenta buscar do cache primeiro
      final cachedFilms = await cache.getCachedFilms();
      if (cachedFilms.isNotEmpty) {
        return Right(cachedFilms);
      }

      // Se não tiver cache, busca da API
      final films = await api.getAllFilms();
      await cache.cacheFilms(films);
      return Right(films);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Film>> getFilmById(String id) async {
    try {
      final films = await getAllFilms();
      return films.fold(
        (failure) => Left(failure),
        (films) {
          final film = films.firstWhere(
            (f) => f.id == id,
            orElse: () => throw Exception('Filme não encontrado'),
          );
          return Right(film);
        },
      );
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }
}

