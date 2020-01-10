import 'package:flutter/material.dart';
bool _isEnabled = false;

// Create a Form widget.

class MyProfile extends StatefulWidget {
  @override
  MyProfileState createState() {
    return MyProfileState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyProfileState extends State<MyProfile> {

  void tapping(){
    setState(() {
      _isEnabled = ! _isEnabled;

    });}


  @override
  Widget build(BuildContext context) {


    // Build a Form widget using the _formKey created above.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.cyan[600],
            title: Text("Profile"),
            centerTitle: true,
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.mode_edit),
                onPressed: () {
                  tapping();
                },
              ),
            ]
        ),
        body:
      /*),
    );*/Material(
      child: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.all(25.0),
          margin: EdgeInsets.only(bottom: 15.0),
          child:Column(
              children:<Widget>[
                     Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/rose.jpg"),
                        )
                    )),
                   Padding(
                     padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                   ),
                   Padding(
                  padding: const EdgeInsets.only(
                    top:10.0,
                    bottom: 10.0,
                  ),
                       child: ListTile(
                         title:new TextField(
                             enabled: _isEnabled,
                      decoration:InputDecoration(
                        hintText: "Company name",
                      ),
                      onChanged:(String string){
                          setState((){});}
                  ),
                       ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top:10.0,
                    bottom: 10.0,
                    left:14.0,
                    right: 14.0,
                  ),
                  child: TextField(
                      enabled: _isEnabled,
                      decoration:InputDecoration(
                        hintText: "Email id",
                      ),
                      onChanged:(String string){
                        setState((){});}),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top:10.0,
                    bottom:10.0,
                    left:14.0,
                    right: 14.0,
                  ),
                  child: TextField(
                      enabled: _isEnabled,
                      decoration:InputDecoration(
                        hintText: "Mobile no",
                      ),
                      onChanged:(String string){
                        setState((){});}),
                ),
              ]
          ),
        ),
      ),
        )
      )
    );
  }
}
