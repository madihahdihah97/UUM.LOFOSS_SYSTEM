import 'package:flutter/material.dart';


class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('HELP : BUTTON LIST'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
     body: Padding(
       padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
       child: SingleChildScrollView(
         padding: EdgeInsets.all(5),
         child:  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:<Widget> [
           Center(
             child: CircleAvatar(
               backgroundImage: AssetImage('assets/logo.jpg'),
               radius: 45.0,
             ),
           ),
           Divider(height:10.0,
           ),
          Row(
          children:<Widget> [
            Container(
              child: Image(
               image: AssetImage('assets/about us.jpg'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Image(
               image: AssetImage('assets/app2.jpg'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
         ],
          ),
          SizedBox(height: 10.0),
           Row(
          children:<Widget> [
            Container(
              child: Text('About Us'),
              alignment: Alignment.center,  
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            SizedBox(
              height: 10.0
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Text('About App'),
              alignment: Alignment.center,
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            
          ],
          ),
         SizedBox(
          height: 20 
         ),
Row(
          children:<Widget> [
            Container(
              child: Image(
               image: AssetImage('assets/hp.jpg'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Image(
               image: AssetImage('assets/key1.jpg'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
         ],
          ),
          SizedBox(
            height: 10.0
          ),
          Row(
          children:<Widget> [
            Container(
              child: Text('Help Desk'),
              alignment: Alignment.center,  
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            SizedBox(
              height: 10.0
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Text('Report Lost'),
              alignment: Alignment.center,
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            
          ],
          ),
          SizedBox(
            height: 20.0
          ),
          Row(
          children:<Widget> [
            Container(
              child: Image(
               image: AssetImage('assets/brg.jpg'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Image(
               image: AssetImage('assets/gm.png'),
               fit: BoxFit.cover,
               alignment: Alignment.center,
               width: 100.0,
               height: 100.0,
              ),
            ),
         ],
          ),
          SizedBox(
            height: 10.0
          ),
          Row(
          children:<Widget> [
            Container(
              child: Text('Report Found'),
              alignment: Alignment.center,  
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            SizedBox(
              height: 10.0
            ),
            SizedBox(
            width: 45.0,  
            ),
            Container(
              child: Text('Google Map'),
              alignment: Alignment.center,
               width: 100.0,
               height: 20.0,
               color: Colors.pink[400],
              ),
            
          ],
          ),

          ],
         
       ),
       ),
       
       
      
     ), 
    );
  }
}
