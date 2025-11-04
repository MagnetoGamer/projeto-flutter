import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/exceptions/failure.dart';
import '../../../domain/entities/film.dart';

class FilmApi {
  final String baseUrl = 'https://api.example.com/films'; // URL fictícia

  Future<List<Film>> getAllFilms() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Dados mock para desenvolvimento
      return [
        Film(
          id: '1',
          title: 'Filme 1',
          description: 'Descrição do filme 1',
          posterUrl: 'https://via.placeholder.com/400',
          releaseYear: 2023,
          director: 'Diretor 1',
          characterIds: ['1', '2'],
        ),
      ];
    } catch (e) {
      throw ServerFailure('Erro ao buscar filmes: ${e.toString()}');
    }
  }

  Future<Film> getFilmById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      return Film(
        id: id,
        title: 'Filme $id',
        description: 'Descrição do filme $id',
        posterUrl: 'https://via.placeholder.com/400',
        releaseYear: 2023,
        director: 'Diretor $id',
        characterIds: ['1'],
      );
    } catch (e) {
      throw ServerFailure('Erro ao buscar filme: ${e.toString()}');
    }
  }
}

