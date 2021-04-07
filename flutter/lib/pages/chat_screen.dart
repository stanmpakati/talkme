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

  void _sendText(String text) {
    TalkMeService().sendText(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    chatBubble(
                      Message(
                        message:
                            'Hey, Idiot, wassup. let me increase the message and see what will become of my wigdet\nYey it expanded!',
                        timeSent: DateTime.now(),
                        userId: '892',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Text editing box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onChanged: (String messageText) {
                      setState(() {
                        _isWritting = true;
                      });
                    },
                    onSubmitted: _sendText,
                    decoration:
                        InputDecoration.collapsed(hintText: "Send a message"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _isWritting
                        ? () => _sendText(_textController.text)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
