import 'package:flutter/foundation.dart';
import '../../domain/entities/film.dart';
import '../../domain/usecases/get_film_details.dart';
import '../../core/exceptions/failure.dart';

class FilmProvider extends ChangeNotifier {
  final GetFilmDetails getFilmDetails;

  FilmProvider(this.getFilmDetails);

  bool _isLoading = false;
  Film? _film;
  Failure? _error;

  bool get isLoading => _isLoading;
  Film? get film => _film;
  Failure? get error => _error;

  Future<void> loadFilm(String filmId) async {
    _isLoading = true;
    _error = null;
    _film = null;
    notifyListeners();

    final result = await getFilmDetails(filmId);

    result.fold(
      (failure) {
        _error = failure;
        _isLoading = false;
        notifyListeners();
      },
      (film) {
        _film = film;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
    );
  }
}

