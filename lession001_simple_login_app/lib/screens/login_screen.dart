import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lession001_simple_login_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final _usernameTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Mozilla App"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameTEController,
              decoration: InputDecoration(
                labelText: "Username",
                icon: Icon(FontAwesomeIcons.solidUserCircle),
              ),
            ),
            TextField(
              controller: _passwordTEController,
              decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(FontAwesomeIcons.solidEyeSlash),
              ),
            ),
            RaisedButton.icon(
              color: Colors.lightBlue,
              label: Text("Sign in"),
              icon: Icon(FontAwesomeIcons.signInAlt),
              onPressed: () {
                onSignIn(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void onSignIn(BuildContext context) {
    String username = _usernameTEController.text;
    String password = _passwordTEController.text;

    if (username.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Username is Empty!"),
          duration: Duration(milliseconds: 800),
        ),
      );
      return;
    }

    if (password.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password is Empty!"),
          duration: Duration(milliseconds: 800),
        ),
      );
      return;
    }

    if (username.toLowerCase() == "admin" && password == "password") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Username or Password incorrect!"),
          duration: Duration(milliseconds: 800),
        ),
      );
    }
  }
}
