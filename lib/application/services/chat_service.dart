import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/get_chat_messages.dart';
import '../../domain/usecases/send_chat_message.dart';

class ChatService {
  final GetChatMessages getChatMessages;
  final SendChatMessage sendChatMessage;

  ChatService(this.getChatMessages, this.sendChatMessage);

  Stream<List<ChatMessage>> getMessagesStream() async* {
    while (true) {
      final result = await getChatMessages();
      yield result.fold(
        (failure) => <ChatMessage>[],
        (messages) => messages,
      );
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Future<bool> sendMessage(String content, String userId, String userName) async {
    final result = await sendChatMessage(content, userId, userName);
    return result.fold(
      (failure) => false,
      (message) => true,
    );
  }
}

