import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/models/user.dart';

class TalkMeService {
  var url = Uri.parse('https://');

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
    var response = await http.get(url);
    print('response status: ${response.statusCode}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> responseJson = jsonDecode(response.body);
      List<Message> messageList = [];
      responseJson.map((user) => Message.fromJson(user));
      return messageList;
    }
  }
}
