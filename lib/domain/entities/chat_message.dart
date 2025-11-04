import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String content;
  final String userId;
  final String userName;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.content,
    required this.userId,
    required this.userName,
    required this.timestamp,
  });

  @override
  List<Object> get props => [id, content, userId, userName, timestamp];
}

