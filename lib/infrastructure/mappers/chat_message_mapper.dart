import '../../domain/entities/chat_message.dart';

class ChatMessageMapper {
  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  static Map<String, dynamic> toJson(ChatMessage message) {
    return {
      'id': message.id,
      'content': message.content,
      'userId': message.userId,
      'userName': message.userName,
      'timestamp': message.timestamp.toIso8601String(),
    };
  }
}

