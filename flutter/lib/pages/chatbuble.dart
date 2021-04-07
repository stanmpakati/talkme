import 'package:flutter/material.dart';
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';
import 'package:ryan_app/services/api.dart';

Widget chatBubble(Message message) {
  // User _user = await TalkMeService().getUser(message.userId);

  return Container(
    decoration: BoxDecoration(
      color: Colors.lightGreen[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.person),
        ),
        Column(
          children: [
            Text(
              message.userId,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 2),
            Expanded(
              child: Text(message.message),
            ),
          ],
        ),
      ],
    ),
  );
}
