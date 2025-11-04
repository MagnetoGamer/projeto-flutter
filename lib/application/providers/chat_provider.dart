import 'package:flutter/foundation.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/get_chat_messages.dart';
import '../../domain/usecases/send_chat_message.dart';
import '../../core/exceptions/failure.dart';

class ChatProvider extends ChangeNotifier {
  final GetChatMessages getChatMessages;
  final SendChatMessage sendChatMessage;

  ChatProvider(this.getChatMessages, this.sendChatMessage);

  bool _isLoading = false;
  List<ChatMessage> _messages = [];
  Failure? _error;

  bool get isLoading => _isLoading;
  List<ChatMessage> get messages => _messages;
  Failure? get error => _error;

  Future<void> loadMessages() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getChatMessages();

    result.fold(
      (failure) {
        _error = failure;
        _isLoading = false;
        notifyListeners();
      },
      (messages) {
        _messages = messages;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
    );
  }

  Future<void> sendMessage(String content, String userId, String userName) async {
    final result = await sendChatMessage(content, userId, userName);

    result.fold(
      (failure) {
        _error = failure;
        notifyListeners();
      },
      (message) {
        _messages.add(message);
        _error = null;
        notifyListeners();
      },
    );
  }
}

