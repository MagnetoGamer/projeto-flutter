import 'package:dartz/dartz.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';
import '../../core/exceptions/failure.dart';

class SendChatMessage {
  final ChatRepository repository;

  SendChatMessage(this.repository);

  Future<Either<Failure, ChatMessage>> call(String content, String userId, String userName) {
    return repository.sendChatMessage(content, userId, userName);
  }
}

