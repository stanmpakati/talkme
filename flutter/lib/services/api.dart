import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';

class TalkMeService {
  var url = Uri.parse('https://');
  User user = User(userId: '9909', username: 'Stan');

  Future login(Map<String, dynamic> details) async {
    var response = await http.post(url, body: details);
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {}
  }

  Future<User> getUser(String userId) async {
    var response = await http.post(url, body: userId);
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    return User(userId: '9', username: 'error');
  }

  Future<List<Message>> getMessages() async {
    // var response = await http.get(url);
    // print('response status: ${response.statusCode}');
    // print('response body: ${response.body}');

    // if (response.statusCode == 200) {
    var responseJson = [
      {
        'userId': '98s9',
        'message': 'Hey',
        'timeSent': DateTime.now(),
      },
      {
        'userId': '9909',
        'message': 'Wassup',
        'timeSent': DateTime.now(),
      },
      {
        'userId': '98s9',
        'message': "I'm good",
        'timeSent': DateTime.now(),
      },
    ];
    // List<Map<String, dynamic>> responseJson = jsonDecode(response.body);
    List<Message> messageList = [];
    responseJson.map((user) => messageList.add(Message.fromJson(user)));
    // return messageList;
    // }
  }

  void sendText(String text) async {
    Map<String, dynamic> message = {
      'userId': user.userId,
      'message': text,
      'timeSent': DateTime.now(),
    };

    var response = await http.post(url, body: message);
  }
}
