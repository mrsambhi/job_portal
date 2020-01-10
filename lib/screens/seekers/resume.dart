import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  @override
  ResumeState createState() {
    return ResumeState();
  }
}

class ResumeState extends State<Resume> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner:false,
      home: Scaffold(

        

        body: SingleChildScrollView(),
      ),
    );
  }
}
