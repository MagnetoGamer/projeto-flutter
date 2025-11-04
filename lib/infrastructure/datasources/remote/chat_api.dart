import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/exceptions/failure.dart';
import '../../../domain/entities/chat_message.dart';

class ChatApi {
  final String baseUrl = 'https://api.example.com/chat'; // URL fictícia

  Future<List<ChatMessage>> getChatMessages() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Dados mock para desenvolvimento
      return [
        ChatMessage(
          id: '1',
          content: 'Mensagem de exemplo',
          userId: 'user1',
          userName: 'Usuário 1',
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        ),
      ];
    } catch (e) {
      throw ServerFailure('Erro ao buscar mensagens: ${e.toString()}');
    }
  }

  Future<ChatMessage> sendMessage(String content, String userId, String userName) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      return ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        userId: userId,
        userName: userName,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw ServerFailure('Erro ao enviar mensagem: ${e.toString()}');
    }
  }
}

