import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_portal/screens/seekers/homepage.dart';
import 'package:job_portal/screens/seekers/registration.dart';

class LoginSeeker extends StatefulWidget {
  @override
  LoginSeekerFormState createState() {
    return LoginSeekerFormState();
  }
}

class LoginSeekerFormState extends State<LoginSeeker> {

  final _formKey = GlobalKey<FormState>();


  void clickNavigation(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Registration()));
  }void loginclick(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
  }
  void submit(){
    if(_formKey.currentState.validate()){
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Submit')));
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Please Enter full data')));

    }
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold
        (body: new
        SingleChildScrollView(
          child:

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/1.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child:new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:80 ,),
                    child: Image.asset('login_logo1.png' ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70,left: 20,bottom: 10,right: 20),
                    child: Card(
                      //margin: EdgeInsets.all(20.0),
                      //borderOnForeground: false,
                      elevation: 20,
                      child: new Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.all(10.0),

                              child:TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: 'john@gmail.com',
                                  labelText: 'Email',
                                ),

                                minLines: 1,
                                validator: validateEmail,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.all(10.0),

                              child:TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: 'Enter Password',
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                                minLines: 1,
                                validator: (value) {
                                  if (value.length <6) {
                                  return 'minimum 6 letter';
                                  }
                                  return null;
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*decoration: new BoxDecoration(
                  border: Border.all(),
                  *//*borderRadius: ,*//*
                   *//* boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                      ),
                    ]*//*),*/
                  RaisedButton( elevation: 20,
                    focusElevation: 100.0,
                    hoverElevation: 100.0,
                    color: Colors. cyan,
                    onPressed: loginclick,
                    child: Text('Submit',style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,

                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:60, bottom:35,),

                    child: Column(verticalDirection: VerticalDirection.down,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User? ",
                          style: TextStyle(fontFamily: "Poppins-Medium",
                            fontSize: 15.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            clickNavigation();
                            },
                          child: Text("SignUp",
                              style: TextStyle(
                                  color: Color(0xFF5d74e3),
                                  fontSize: 15.0,
                                  fontFamily: "Poppins-Bold")),
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
    ),
    );
  }
}