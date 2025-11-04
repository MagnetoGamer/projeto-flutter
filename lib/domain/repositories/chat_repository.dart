import 'package:dartz/dartz.dart';
import '../entities/chat_message.dart';
import '../../core/exceptions/failure.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatMessage>>> getChatMessages();
  Future<Either<Failure, ChatMessage>> sendChatMessage(String content, String userId, String userName);
}

