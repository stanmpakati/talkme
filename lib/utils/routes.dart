import 'package:flutter/material.dart';
import 'package:ryan_app/pages/signin_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInPage());
      default:
        return MaterialPageRoute(builder: (_) => SignInPage());
    }
  }
}
