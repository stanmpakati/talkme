import 'package:flutter/foundation.dart';
import 'package:ryan_app/models/user.dart';

class Message {
  final int id;
  final String owner;
  final String msg;
  final DateTime posted;
  final User user;

  Message({
    @required this.id,
    @required this.owner,
    @required this.msg,
    @required this.posted,
    this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['id'],
        owner: json['owner'],
        msg: json['msg'],
        posted: DateTime.parse(json['posted']),
        user: User(username: json['owner']));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner': owner,
      'msg': msg,
      'posted': posted,
    };
  }
}
