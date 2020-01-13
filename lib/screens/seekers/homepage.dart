/*import 'package:drawer_demo/fragments/first_fragment.dart';
import 'package:drawer_demo/fragments/second_fragment.dart';*/
import 'package:job_portal/screens/seekers/jobs.dart';
import 'package:job_portal/screens/seekers/more.dart';
import 'package:job_portal/screens/seekers/myapplication.dart';
import 'package:job_portal/screens/seekers/preferences.dart';
import 'package:job_portal/screens/seekers/resume.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Jobs", Icons.home),
    new DrawerItem("My Preferences", Icons.playlist_add_check),
    new DrawerItem("My Application", Icons.check_circle),
    new DrawerItem("Resume", Icons.insert_drive_file),
    new DrawerItem("More", Icons.more)

  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MyApp();
      case 1:
        return new Preferences();
      case 2:
        return new MyApplications();
      case 3:
        return new Resume();
      case 4:
        return new More();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.cyan[600],
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.cyan[800],
                    Colors.cyan[400],
                    Colors.cyan,
                    Colors.cyanAccent,
                  ],
                ),
              ),
                accountName: new Text("Vani Swarnkar"),
                accountEmail: new Text('swarnvani306@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/vani.jfif'),

                ),
              ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}