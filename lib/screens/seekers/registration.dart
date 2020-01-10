import 'package:flutter/material.dart';
import 'package:job_portal/screens/seekers/login.dart';
/*import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';*/

class Registration extends StatefulWidget {
  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController password = new TextEditingController();


  /*Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }*/


  void submit(){

    if(_formKey.currentState.validate()){
      final snackBar = SnackBar(content: Text('Sucessfully registered'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSeeker()));
    }else{
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
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar( backgroundColor: Colors.cyan[800],
          title: new Text("Registration"),
          centerTitle: true,
        ),
      body:
      SingleChildScrollView(
      child:
        new Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

            /*new Container(
              child:new
              Padding(
                padding:EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.red[200],
                  onPressed: getImage,
                  child: Text('Image Picker',style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),),
                ),
              ),
              alignment: Alignment(0.0, 0.0),

            ),*/
            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'John Cena',
                  labelText: 'Name',
                ),
                minLines: 1,
                validator:(value) {
                if (value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.wc),
                  hintText: 'male',
                  labelText: 'Gender',
                ),
                minLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Mobile number';
                  }
                  return null;
                },
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'john@gmail.com',
                  labelText: 'Email',
                ),
                minLines: 1,
                validator: validateEmail,
              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on),
                  hintText: '19,Vishnupuri',
                  labelText: 'Address',
                ),
                minLines: 1,
                validator: validateEmail,
              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: '9977238308',
                  labelText: 'Mobile No',
                ),
                minLines: 1,
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.business),
                  hintText: 'eg- IT',
                  labelText: 'Current Industry',
                ),

                minLines: 1,

              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.school),
                  hintText: 'eg- B.Tech',
                  labelText: 'Qualification',
                ),

                minLines: 1,

              ),
            ),
              new Container(
                margin: EdgeInsets.all(10.0),

                child:TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    hintText: 'eg- 5 lakh',
                    labelText: 'Annual Salary',
                  ),

                  minLines: 1,

                ),
              ),

              new Container(
                child:new Padding(
                  padding:EdgeInsets.all(5.0),
                  child: RaisedButton(
                    color: Colors.red[300],
                    onPressed: submit,
                    child: Text('Register ',style: new TextStyle(fontSize: 17.0,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
                  alignment: Alignment(0.0, 0.0),

              ),
          ],
        ),
      ),
      ),
    );
  }
}