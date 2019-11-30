import 'package:flutter/material.dart';
import 'package:lession001_simple_login_app/screens/login_screen.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // app should return a material app
    return MaterialApp(
      title: "LoginApp",
      // initial page is login page
      // go to screens/login_screen.dart file
      home: LoginScreen(),
    );
  }
}
