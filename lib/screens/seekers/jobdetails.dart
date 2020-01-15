import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          child:
          Container(
            // margin: new EdgeInsets.only(top: 50.0),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                  children:<Widget>[
                    new Column(
                        children: <Widget>[
                          new Text('Web Developement',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text('Ziasy Consulting',style: TextStyle(color: Colors.blueGrey),
                          ),

                          new Text(''),

                          new Text('Location :',style: TextStyle(color: Colors.grey),),
                          new Text('Salary :',style: TextStyle(color: Colors.grey),),
                          new Text('Apply By :',style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 15.0,
                            width: 300,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          new Text('Job Description :',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(''),
                          new Text('Skill(s) Required :',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(''),
                          new Text('Experience :',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(''),
                          new Text('Working Days :',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(''),
                          new Text('Working Hours :',style: TextStyle(fontWeight: FontWeight.bold)),
                          new Text(''),
                          RaisedButton(
                            child: const Text('Apply',style:TextStyle(color: Colors.black)),
                          )
                        ]
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}


