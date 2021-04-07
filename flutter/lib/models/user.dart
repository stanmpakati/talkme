import 'package:flutter/foundation.dart';

class User {
  final String userId;
  final String username;
  final String profilePictureUrl;

  User({
    @required this.userId,
    @required this.username,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      username: json['username'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
