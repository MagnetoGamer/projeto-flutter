import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/chat_message.dart';

class ChatLocalStorage {
  static const String _key = 'chat_messages';

  Future<void> saveMessages(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = messages.map((m) => {
      'id': m.id,
      'content': m.content,
      'userId': m.userId,
      'userName': m.userName,
      'timestamp': m.timestamp.toIso8601String(),
    }).toList();
    await prefs.setString(_key, jsonEncode(messagesJson));
  }

  Future<List<ChatMessage>> getMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = prefs.getString(_key);
    
    if (messagesJson == null) {
      return [];
    }
    
    final List<dynamic> decoded = jsonDecode(messagesJson);
    return decoded.map((json) => ChatMessage(
      id: json['id'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    )).toList();
  }

  Future<void> addMessage(ChatMessage message) async {
    final messages = await getMessages();
    messages.add(message);
    await saveMessages(messages);
  }
}

