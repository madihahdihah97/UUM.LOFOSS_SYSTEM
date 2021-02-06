import 'package:flutter/material.dart';
import 'package:uumlofoss_project/models/user.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/aboutapp.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/aboutus.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/found_image.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/found_list.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/googlemap.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/help.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/lost_image.dart';
import 'package:provider/provider.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/profilelist.dart';

class Homemenus extends StatefulWidget {
  @override
  _HomemenusState createState() => _HomemenusState();
}
class _HomemenusState extends State<Homemenus> {
 // final AuthService _auth = AuthService(); 
    
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text('MAIN MENU'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          actions:<Widget> [
            FlatButton.icon(icon:Icon(Icons.person,color:Colors.pink[300],
            ),
            label: Text('logout', style:TextStyle(color: Colors.pink[300],
            ),
            ),
            onPressed: () async {
             // await _auth.signOut();
            },
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start, 
             children:<Widget> [
             Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.jpg'),
                radius: 50.0,
              ),
              
             ),
             
             Divider(height:30.0,
             ),
             
               Container(
                 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Container(
                     child:RaisedButton( 
                       
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutApp()),
                         );
                       },
                       child: Image.asset('assets/app2.jpg',
                       width:100,
                       height:100,),
                     ), 
                    ),
                    SizedBox(width:20.0),
                     Container(
                     child:RaisedButton( 
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutus()),
                         );
                       },
                       child: Image.asset('assets/about us.jpg',
                       width:100,
                       height:100,),
                     ), 
                    ),
                  ],
                ), 
               ),
               SizedBox(height:5.0),
               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children:<Widget> [
                   Container(
                    child: Column(
                      children:<Widget> [
                        Text('UUMLOFOSS',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        
                        Text('Information about App',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                   ),
                SizedBox(height:5.0),
                SizedBox(width:25.0),
                   Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('ABOUT US',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        Text('Information contact us',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                   ),
                 ], 
                ), 
               ),
              SizedBox(height:20.0),

               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Container(
                     child:RaisedButton( 
                       
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>LostImage()),
                         );
                       },
                       child: Image.asset('assets/key1.jpg',
                       width:100,
                       height:100,),
                     ), 
                    ),
                    SizedBox(width:20.0),
                     Container(
                     child:RaisedButton( 
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Foundimage()),
                         );
                       },
                       child: Image.asset('assets/brg.jpg',
                       width:100,
                       height:100,),
                     ), 
                    ),
                  ],
                ), 
               ),
               SizedBox(height:5.0),
               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children:<Widget> [
                   Container(
                    child: Column(
                      children:<Widget> [
                        Text('REPORT LOST',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        
                        Text('Form and picture Report',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                   ),
                SizedBox(height:5.0),
                SizedBox(width:25.0),
                   Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('REPORT FOUND',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        Text('Form and Picture Found',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                   ),
                 ], 
                ), 
               ),

               SizedBox(height:20.0),

               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Container(
                     child:RaisedButton( 
                       
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Goomap()),
                         );
                       },
                       child: Image.asset('assets/gm.png',
                       width:100,
                       height:100,),
                     ), 
                    ),
                    SizedBox(width:20.0),
                     Container(
                     child:RaisedButton( 
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()),
                         );
                       },
                       child: Image.asset('assets/hp.jpg',
                       width:100,
                       height:100,),
                     ), 
                    ),
                  ],
                ), 
               ),
               SizedBox(height:5.0),
               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children:<Widget> [
                   Container(
                    child: Column(
                      children:<Widget> [
                        Text('LOCATION',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        
                        Text('Show location',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                   ),
                SizedBox(height:5.0),
                SizedBox(width:25.0),
                   Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('HISTORY FOUND',style:TextStyle(color: Colors.pink[900],fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        Text('List all report found',style:TextStyle(color: Colors.pink[100],fontSize: 12.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                   ),
                 ], 
                ), 
               ),
             ],
            ),
          ),
        ),
      );
    
  }
}
