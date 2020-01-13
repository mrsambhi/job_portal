import 'package:flutter/material.dart';
import 'package:job_portal/screens/seekers/jobdetails.dart';
//import 'package:flappy_search_bar/search_bar_style.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:Container(

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
              Colors.grey[300],
              Colors.grey[400],
              Colors.grey,
              Colors.grey[800],
            ],
          ),
        ),
        child: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: Container(
                height: 150.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                  child: Text("His genius finally recognized by his idol Chester",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),),
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
                                      splashColor: Colors.blueAccent,
                                      onPressed: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => JobDetails()));

                                      },
                                      child: Text(
                                        "View Job Details",
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
        ),
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