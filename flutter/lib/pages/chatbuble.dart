import 'package:flutter/material.dart';
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';
import 'package:ryan_app/services/api.dart';
import 'package:ryan_app/services/time_ago.dart';

Widget chatBubble(Message message) {
  final _service = TalkMeService();
  User _me = _service.user;

  // To check If I'm the one who sent the message
  bool _mine = _me.userId == message.userId;

  return Container(
    margin: EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      // mainAxisAlignment:
      // _mine ? MainAxisAlignment.end : MainAxisAlignment.start,
      textDirection: _mine ? TextDirection.rtl : TextDirection.ltr,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.lightGreen,
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 36,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: 240,
          decoration: BoxDecoration(
            color: _mine ? Colors.pink[100] : Colors.lightGreen[200],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.userId,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(message.message),
              SizedBox(height: 2),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    '${TimeAgo.timeAgoSinceDate(message.timeSent)}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
