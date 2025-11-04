import 'package:dartz/dartz.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/entities/chat_message.dart';
import '../../core/exceptions/failure.dart';
import '../datasources/remote/chat_api.dart';
import '../datasources/local/chat_local_storage.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatApi api;
  final ChatLocalStorage localStorage;

  ChatRepositoryImpl(this.api, this.localStorage);

  @override
  Future<Either<Failure, List<ChatMessage>>> getChatMessages() async {
    try {
      // Busca mensagens da API
      final apiMessages = await api.getChatMessages();
      
      // Busca mensagens locais
      final localMessages = await localStorage.getMessages();
      
      // Combina e ordena por timestamp
      final allMessages = [...apiMessages, ...localMessages]
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
      
      return Right(allMessages);
    } on ServerFailure catch (e) {
      // Em caso de erro na API, retorna mensagens locais
      try {
        final localMessages = await localStorage.getMessages();
        return Right(localMessages);
      } catch (localError) {
        return Left(e);
      }
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> sendChatMessage(
    String content,
    String userId,
    String userName,
  ) async {
    try {
      final message = await api.sendMessage(content, userId, userName);
      await localStorage.addMessage(message);
      return Right(message);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }
}

