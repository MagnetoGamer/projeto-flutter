import 'package:dartz/dartz.dart';
import '../entities/film.dart';
import '../repositories/film_repository.dart';
import '../../core/exceptions/failure.dart';

class GetFilmDetails {
  final FilmRepository repository;

  GetFilmDetails(this.repository);

  Future<Either<Failure, Film>> call(String filmId) {
    return repository.getFilmById(filmId);
  }
}

