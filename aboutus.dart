import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('ABOUT US'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding:EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
        children:<Widget> [
          SizedBox(height: 40.0,
          ),
          Text(
            'If you have any'
            '  inquiries you may'
            '  call or email us',
            style:TextStyle(color: Colors.pink[900],
            letterSpacing: 1.0, fontSize: 18.0, fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height:50.0),
            Row(
              children:<Widget> [
                Icon(
                 Icons.call,
                 color: Colors.pink[900], 
                ),
                SizedBox(width:10.0
                ),
                Text('+60199556024',
                style:TextStyle(color: Colors.pink[900],
                fontSize: 16.0,
                letterSpacing: 1.0,),
                ),
                Divider(height:55.0,
                ),
              ],
            ),
            Row(
              children:<Widget> [
                Icon(
                 Icons.email,
                 color: Colors.pink[900], 
                ),
                SizedBox(width:10.0
                ),
                Text('uumlofoss20@gmail.com',
                style:TextStyle(color: Colors.pink[900],
                fontSize: 16.0,
                letterSpacing: 1.0,),
                ),
                Divider(height:55.0,
                ),
              ],
            ),
            Row(
              children:<Widget> [
                Icon(
                 Icons.web,
                 color: Colors.pink[900], 
                ),
                SizedBox(width:10.0
                ),
                Text('www.uumlofoss.com',
                style:TextStyle(color: Colors.pink[900],
                fontSize: 16.0,
                letterSpacing: 1.0,),
                ),
                Divider(height:55.0,
                ),
              ],
            )
        ],  
        ),
         ),
    );
  }
}
