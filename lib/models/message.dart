import 'package:flutter/foundation.dart';

class Message {
  final String userId;
  final String message;
  final DateTime timeSent;

  Message({
    @required this.userId,
    @required this.message,
    @required this.timeSent,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      userId: json['userId'],
      message: json['message'],
      timeSent: json['timeSent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'message': message,
      'timeSent': timeSent,
    };
  }
}
