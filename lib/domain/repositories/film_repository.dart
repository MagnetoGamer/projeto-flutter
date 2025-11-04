import 'package:dartz/dartz.dart';
import '../entities/film.dart';
import '../../core/exceptions/failure.dart';

abstract class FilmRepository {
  Future<Either<Failure, List<Film>>> getAllFilms();
  Future<Either<Failure, Film>> getFilmById(String id);
}

