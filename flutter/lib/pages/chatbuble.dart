import 'package:flutter/material.dart';
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/pages/signin_page.dart';
import 'package:ryan_app/services/time_ago.dart';

Widget chatBubble(Message message) {
  // To check If I'm the one who sent the message
  bool _mine = userName == message.owner;

  return Container(
    margin: EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      // mainAxisAlignment:
      textDirection: _mine ? TextDirection.rtl : TextDirection.ltr,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.lightGreen,
          // child: Image.network(
          //   message.user.profilePictureUrl,
          //   errorBuilder: (context, error, stackTrace) => Icon(
          //     Icons.person,
          //     color: Colors.black,
          //     size: 28,
          //   ),
          // ),
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 28,
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
                message.owner,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(message.msg),
              SizedBox(height: 2),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    '${TimeAgo.timeAgoSinceDate(message.posted)}',
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
