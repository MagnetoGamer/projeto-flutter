import 'package:dartz/dartz.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';
import '../../core/exceptions/failure.dart';

class GetChatMessages {
  final ChatRepository repository;

  GetChatMessages(this.repository);

  Future<Either<Failure, List<ChatMessage>>> call() {
    return repository.getChatMessages();
  }
}

