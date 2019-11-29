import 'package:flutter/material.dart';
import 'package:lession001_simple_login_app/screens/login_screen.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginApp",
      home: LoginScreen(),
    );
  }
}
