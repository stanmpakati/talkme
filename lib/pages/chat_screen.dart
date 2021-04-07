import 'package:flutter/material.dart';
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/pages/chatbuble.dart';
import 'package:ryan_app/services/api.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  bool _isWritting = false;

  void _sendText(String text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: FutureBuilder(
          future: TalkMeService().getMessages(),
          builder: (context, snapshot) {
            return ListView(
              children: [
                chatBubble(
                  Message(
                    message: 'Hey, Idiot, wassup',
                    timeSent: DateTime.now(),
                    userId: '892',
                  ),
                ),
                // Text editing box
                Row(
                  children: [
                    Flexible(
                      child: new TextField(
                        controller: _textController,
                        onChanged: (String messageText) {},
                        onSubmitted: _sendText,
                        decoration: new InputDecoration.collapsed(
                            hintText: "Send a message"),
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isWritting
                            ? () => _sendText(_textController.text)
                            : null,
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
