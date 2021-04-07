import 'package:flutter/material.dart';
import 'package:ryan_app/pages/chat_screen.dart';
import 'package:ryan_app/pages/home_page.dart';
import 'package:ryan_app/pages/signin_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatScreen());
      default:
        return MaterialPageRoute(builder: (_) => SignInPage());
    }
  }
}
