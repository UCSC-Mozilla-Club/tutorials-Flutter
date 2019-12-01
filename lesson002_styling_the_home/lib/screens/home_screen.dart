import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lesson002_styling_the_home/screens/chatroom_screen.dart';
import 'package:lesson002_styling_the_home/screens/events_screen.dart';
import 'package:lesson002_styling_the_home/screens/repositories_screen.dart';
import 'package:lesson002_styling_the_home/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  // in first lession HomeScreen was a stateless widget.But now we have to convert
  // it in to state full widget.Because we have a Bottom navigation bar.when user clicks
  // a button, we need to show another screen.which means,needs to change state.
  // so to do that, we needs statefull widget
  // shortcut -> right click on the StatelessWidget, select refactor, select
  // convert to StateFullWidget
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // newly created Screens for bottomNavigation
  final _screens = <Widget>[
    RepositoriesScreen(),
    EventsScreen(),
    ChatroomScreen(),
    SettingsScreen(),
  ];

  // this integer variable responsible for handling the bottomNavigationBar's
  // selected item
  int _selectedScreen = 0;

  // this method handle the user clicks on bottom navigation items.
  // function gives us tapped index
  void onTap(int index) {
    // we need to set a new state.so we change the index inside set state
    // method.delete setState((){ }) fuction and observe what happens :D nothing breaks
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.firefox),
        title: Text("Mozilla UCSC"),
      ),
      // select the screen according to the index
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        // set the tapped item as selected.delete below line and observe
        currentIndex: _selectedScreen,
        // we pass above method to opTap
        onTap: onTap,
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
