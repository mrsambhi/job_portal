import 'dart:async';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/Provider/homepage_provider.dart';
//import 'package:job_portal/screens/login.dart';
import 'package:job_portal/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:splashscreen/splashscreen.dart';
/*
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new OnBoarding(),
        title: new Text('Welcome To Job Portal',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: Image.asset('assets/Splashlog2.jpg'),
        //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.cyan[800],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Next"),
        loaderColor: Colors.red
    );
  }
}
*/



void main() => runApp(new MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.blueGrey),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  String loginStatus="FALSE";

  void initState(){
    super.initState();
    _incrementCounter();

    }
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginStatus = prefs.getString(Constants.LOGIN_STATUS);
    });
    if (loginStatus=="TRUE"){
      Timer(Duration(seconds: 2),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomePageProvider())));
    }else{
      Timer(Duration(seconds: 2),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => OnBoarding())));
    }
  }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.cyan[400]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      child: Icon(
                        Icons.explore,
                        color: Colors.blueGrey,
                        size: 40.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Job Portal",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Happy Job searching",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}