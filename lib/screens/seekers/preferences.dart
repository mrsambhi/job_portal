import 'dart:ui';

import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  @override
  PreferencesState createState() {
    return PreferencesState();
  }
}

class PreferencesState extends State<Preferences> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner:false,
      home: Scaffold(



        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 50.0,10.0 ,0.0 ),
                      child: Container(child: Text('What type of Internship you are seeking for?',
                          style: TextStyle(fontSize: 18.0,fontStyle: FontStyle.italic))),
                    ),
                  ),

                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
