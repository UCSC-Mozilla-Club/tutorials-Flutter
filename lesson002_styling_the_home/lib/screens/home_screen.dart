import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome To Mozilla UCSC!",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.githubAlt),
            title: Text("Repositories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            title: Text("Events"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidComments),
            title: Text("Chatroom"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cog),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
