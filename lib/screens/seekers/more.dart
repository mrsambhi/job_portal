import 'package:job_portal/screens/Comman/contactus.dart';
import 'package:job_portal/screens/Comman/t&c.dart';
import 'package:job_portal/screens/seekers/help.dart';
import 'package:job_portal/screens/seekers/reset.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class More extends StatefulWidget {
  @override
  MoreState createState() {
    return MoreState();
  }
}

// ignore: camel_case_types
class MoreState extends State<More> {



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'More',
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children:<Widget>
                    [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 270.0, 0.0),
                        child: Container(

                          child: Text("Help"),
                        ),
                      ),
                    IconButton(
                        icon:Icon(Icons.help),
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => JSHelp()));

                        }
                    ),

                  ],

                ),
                  Row(
                    children: <Widget>[
                     Expanded(
                       child: Padding(
                   padding: const EdgeInsets.fromLTRB(10.0, 10.0, 185.0, 0.0),
                        child: Container(

                          child: Text("Terms & Condition"),


                   ),
                 ),
                     ),
                     IconButton(
                     icon:Icon(Icons.info),
                     padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                     onPressed:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));

                     }
                 ),
  ],
),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 230.0, 0.0),
                        child: Container(

                          child: Text("Contact Us"),


                        ),
                      ),
                    ),
                    IconButton(
                        icon:Icon(Icons.supervised_user_circle),
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));

                        }
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 255.0, 0.0),
                        child: Container(

                          child: Text("Reset Password"),


                        ),
                      ),
                    ),
                    IconButton(
                        icon:Icon(Icons.lock),
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Reset()));
                        }
                    ),
                  ],
                ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 255.0, 0.0),
                          child: Container(

                            child: Text("Cancel"),


                          ),
                        ),
                      ),
                      IconButton(
                          icon:Icon(Icons.cancel),
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                          onPressed:(){
                            Navigator.pop(context,false);
                          }
                      ),//IconButton
                    ],
                  ),

              ],
            )
        )));



  }
}
