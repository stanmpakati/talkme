import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';

class TalkMeService {
  var url = Uri.parse('https://');
  User user = User(userId: '9909', username: 'Stan');

  Future login(Map<String, dynamic> details) async {
    // TODO: implement sign in
    var response = await http.post(url, body: details);
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {}
  }

  Future<User> getUser(String userId) async {
    // TODO: implement get user
    var response = await http.post(url, body: userId);
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    return User(userId: '9', username: 'error');
  }

  Future<List<Message>> getMessages() async {
    // TODO: get the messages in the chat
    // var response = await http.get(url);
    // print('response status: ${response.statusCode}');
    // print('response body: ${response.body}');

    // if (response.statusCode == 200) {
    var responseJson = [
      {
        'userId': '98s9',
        'message': 'Hey',
        'timeSent': DateTime.now().toString(),
      },
      {
        'userId': '9909',
        'message': 'Wassup',
        'timeSent': DateTime.now().toString(),
      },
      {
        'userId': '98s9',
        'message': "I'm good",
        'timeSent': DateTime.now().toString(),
      },
    ];
    // List<Map<String, dynamic>> responseJson = jsonDecode(response.body);
    List<Message> messageList = [];
    responseJson
        .forEach((message) => messageList.add(Message.fromJson(message)));
    return messageList;
    // }
  }

  void sendText(String text) async {
    // TODO: send add your message to the chat
    Map<String, dynamic> message = {
      'userId': user.userId,
      'message': text,
      'timeSent': DateTime.now(),
    };

    var response = await http.post(url, body: message);
  }
}
