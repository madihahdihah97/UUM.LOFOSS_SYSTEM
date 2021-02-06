import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('ABOUT APPLICATION'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
     body: Padding(
       padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:<Widget> [
           Center(
             child: CircleAvatar(
               backgroundImage: AssetImage('assets/logo.jpg'),
               radius: 50.0,
             ),
           ),
           Divider(height:30.0,
           ),
          
           Text(
             'The main objective    of'
             ' this project is to develop'
             ' a mobile application that'
             ' can be a medium for    student'
             ' and staff to get best way'
             ' to find the lost items'
             '          around UUM',
             style:TextStyle(
               color: Colors.pink[900],
               letterSpacing: 1.0,
               fontSize: 20.0,
               fontWeight: FontWeight.bold,
             ),
             ),
         ],
       ),
     ), 
    );
  }
}
