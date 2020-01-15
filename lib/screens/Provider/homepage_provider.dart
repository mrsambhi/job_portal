import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Comman/privacypolicy.dart';
import 'package:job_portal/screens/Comman/t&c.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/Provider/addjobs.dart';
import 'package:job_portal/screens/Comman/contactus.dart';
import 'package:job_portal/screens/Provider/help.dart';
import 'package:job_portal/screens/Provider/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_portal/screens/choose.dart';
class HomePageProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<HomePageProvider> {
  var result;
  SharedPreferences prefs;
  void showContent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Log out'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Log out'),
              onPressed: _logoutClick,
            ),
          ],
        );
      },
    );
  }
  List data;
  var isLoader =false;
  String reply = "";

  Future<String> getData(String url ) async {
    try {
      setState(() {
        isLoader=true;

      });
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      // CustomProgressLoader.showLoader(context);
      //  var isConnect = await ConnectionDetector.isConnected();
      // if (isConnect) {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('content-type' , 'application/json');
     // request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      //you should check the response.statusCode
      reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      result =  data['result'];
      print('$result');
      //String status = data['status'].toString();
      //for (var d in data['result']) {

    }

    catch (e) {
      setState(() {
        isLoader=false;

      });
      // CustomProgressLoader.cancelLoader(context);
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
    this.getData(Constants.viewJobs);
  }
  void _logoutClick() {
    setState(() {

      prefs.setString(Constants.loginStatus,"FALSE");
    });
    /*Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => Choose()));*/
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Choose()), (Route<dynamic> route) => false);

  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
  }
  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(

            decoration: BoxDecoration(
              /*borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),*/
              color: Colors.black12,
            ),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            //topLeft: Radius.circular(16.0),
                            //topRight: Radius.circular(16.0),
                          ),
                          color: Colors.cyan[700],
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          //overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Color(0xff232f34), width: 10)),

                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[

                                  ListTile(
                                    title: Text(
                                      "Help",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.help_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) =>JPHelp()));

                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Terms And Conditions",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.copyright,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) =>TermsAndConditions ()));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Privacy Policy",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) =>PrivacyPolicy ()));

                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Contact Us",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) =>ContactUs ()));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "LogOut",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.exit_to_app,
                                      color: Colors.white,
                                    ),
                                    onTap: showContent,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                    )
                ),
              ],
            ),
          ),
          );
        }
        );
  }
  List items = getDummyList();
  //int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 20,
        backgroundColor: Colors.cyan[600],
        title: Text("Home"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[600],
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AddJobsForm()));
        },

        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 10.0,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),
              onPressed: () {},),
            IconButton(icon: Icon(Icons.filter_frames),
              onPressed: () {},),
            IconButton(icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyProfile()));
              },),
            IconButton(icon: Icon(Icons.settings),
              onPressed: () {
              showMenu();
              },),
          ],
        ),
      ),

      body: Container(
        child:
        ListView.builder(
          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, int index) {
            return new  Card(
              elevation: 5,
              child: Container(
                height: 150.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                  width: 300,
                                  height:20,
                                  child: Column(
                                      children:<Widget>[
                                        Text("Job Title:   Software Engineer",style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),),
                                        Flexible(
                                          child: Text("Posted On:   12th Decemeber 2019",style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: FlatButton(
                                      color: Colors.cyan,
                                      textColor: Colors.white,
                                      disabledColor: Colors.grey,
                                      disabledTextColor: Colors.black,
                                      padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
                                      splashColor: Colors.cyanAccent,
                                      onPressed: () {

                                      },
                                      child: Text(
                                        "View Applicants",
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ), /*ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return
          },
        ),*/
      ),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Job ${i + 1}";
    });
    return list;
  }

}