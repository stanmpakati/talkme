import 'package:flutter/material.dart';
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';
import 'package:ryan_app/services/api.dart';
import 'package:ryan_app/services/time_ago.dart';

Widget chatBubble(Message message) {
  // User _user = await TalkMeService().getUser(message.userId);

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.person),
        ),
        Container(
          color: Colors.lightGreen[200],
          padding: EdgeInsets.all(8),
          width: 250,
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
