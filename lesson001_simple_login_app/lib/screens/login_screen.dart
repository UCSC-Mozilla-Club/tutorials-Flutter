import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lesson001_simple_login_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  // TextEditingControllers need to handle events in text fields
  // such as get the text in text field,clear the text in it etc.
  final _usernameTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  // a key needs to get a reference to some widgets
  // this key defined for scaffordState for showing the snackBar
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Scafflod widget gives us a screen structure 
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
                // Font awesome icons are come from external library
                // see the pubspec.yaml, dependency section
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
                // when user click the button this fuction will trigger
                onSignIn(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void onSignIn(BuildContext context) {
    // get the username and password from controllers
    String username = _usernameTEController.text;
    String password = _passwordTEController.text;

    // if username is empty then show a message to user
    if (username.isEmpty) {
      // key use to select the scaffold to show the snackbar
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Username is Empty!"),
          duration: Duration(milliseconds: 800),
        ),
      );
      // return from the fuction, we dont need to execute anymore
      return;
    }

    // if password is empty then show a message to user
    if (password.isEmpty) {
      // key use to select the scaffold to show the snackbar
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password is Empty!"),
          duration: Duration(milliseconds: 800),
        ),
      );
      // return from the fuction, we dont need to execute anymore
      return;
    }

    // if username and password correct,we can navigate to next screen 
    if (username.toLowerCase() == "admin" && password == "password") {
      // navigating the next screen by replacing login screen,so user cannot back to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      // username or password incorrect
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Username or Password incorrect!"),
          duration: Duration(milliseconds: 800),
        ),
      );
      // lets clear the password field for the user
      _passwordTEController.clear();
    }
  }
}
