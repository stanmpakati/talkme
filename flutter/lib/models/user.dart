import 'package:flutter/foundation.dart';

class User {
  final String username;
  String profilePictureUrl;

  User({
    @required this.username,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
