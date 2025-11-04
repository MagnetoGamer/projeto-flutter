import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/exceptions/failure.dart';
import '../../../domain/entities/character.dart';

class CharacterApi {
  final String baseUrl = 'https://api.example.com/characters'; // URL fictícia

  Future<List<Character>> getAllCharacters() async {
    try {
      // Simulação de API - em produção, fazer requisição real
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Dados mock para desenvolvimento
      return [
        Character(
          id: '1',
          name: 'Personagem 1',
          description: 'Descrição do personagem 1',
          imageUrl: 'https://via.placeholder.com/300',
          filmIds: ['1', '2'],
        ),
      ];
    } catch (e) {
      throw ServerFailure('Erro ao buscar personagens: ${e.toString()}');
    }
  }

  Future<Character> getCharacterById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      return Character(
        id: id,
        name: 'Personagem $id',
        description: 'Descrição do personagem $id',
        imageUrl: 'https://via.placeholder.com/300',
        filmIds: ['1'],
      );
    } catch (e) {
      throw ServerFailure('Erro ao buscar personagem: ${e.toString()}');
    }
  }
}

