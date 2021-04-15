import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ryan_app/models/message.dart';
import 'package:ryan_app/pages/signin_page.dart';
import 'package:ryan_app/utils/constants.dart';

class TalkMeService {
  Future login(Map<String, dynamic> details) async {
    // implement sign in
    var url = Uri.parse('${API}join/');

    var request = http.MultipartRequest('POST', url);
    request.fields['username'] = details['username'];
    request.files.add(
      http.MultipartFile.fromBytes(
        'profile',
        await File.fromUri(Uri.parse(details['path'])).readAsBytes(),
      ),
    );
    var response = await request.send();

    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.statusCode);
    }
  }

  Future<String> getUser(String owner) async {
    // implement get user
    var url = Uri.parse('${API}get_profile/');

    var response = await http.post(url, body: {'username': owner});
    if (response.statusCode == 200) {
      return response.body;
    }
    print(response.statusCode);
  }

  Future<List<Message>> getMessages() async {
    // get the messages in the chat
    var url = Uri.parse('${API}get_msgs/');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> responseJson = jsonDecode(response.body);
      List<Message> messageList = [];
      responseJson.forEach((message) async {
        // var profileUrl = await getUser(message['owner']);
        var msg = Message.fromJson(message);
        // msg.user.profilePictureUrl = profileUrl;
        messageList.add(msg);
      });

      return messageList;
    }
    // print('response body: ${response.body}');
  }

  void sendText(String text) async {
    // TODO: send add your message to the chat
    var url = Uri.parse('${API}post_msg/');

    Map<String, dynamic> message = {
      'username': userName,
      'msg': text,
    };

    var response = await http.post(url, body: message);
    print('response status: ${response.statusCode}');

    var x = await getMessages();
    print(x[x.length - 1].msg);
    print(x.length);
    if (response.statusCode == 200) {}
  }
}
