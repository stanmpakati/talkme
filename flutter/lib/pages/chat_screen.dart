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
              future: TalkMeService().getMessages(),
              builder: (context, snapshot) {
                print(snapshot);
                List<Message> messages = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return chatBubble(messages[index]);
                    },
                  );
                }
                return Text('No messages sorry');
              },
            ),
          ),
          // Text editing box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 3,
                  spreadRadius: 2,
                  offset: Offset(0, -2),
                ),
              ],
            ),
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
