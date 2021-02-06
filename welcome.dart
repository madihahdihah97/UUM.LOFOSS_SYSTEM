import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/homemenus.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'welcome',
      theme: ThemeData(
       primaryColor: Colors.blue[900],
       accentColor: Colors.blue[100], 
      ),
     home: WelcomeSplash(),
     routes: {
       'home':(context)=>Homemenus()
     },
    );
  }
}
    class WelcomeSplash extends StatefulWidget {
      @override
      _WelcomeSplashState createState() => _WelcomeSplashState();
    }
    
    class _WelcomeSplashState extends State<WelcomeSplash> {

    void startTimer(){
      Timer(Duration(seconds: 6),(){
      Navigator.of(context).pushReplacementNamed('home');
    });
    }
   @override
  void initState() {
    
    super.initState();
    startTimer();
  }   




      @override
      Widget build(BuildContext context) {
        return Scaffold(
           appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Welcome Page'),
        actions:<Widget> [

        ],
        
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         SizedBox(height:100.0),
         Center(
           
           child: CircleAvatar(
               backgroundImage: AssetImage('assets/logo.jpg'),
               radius: 60.0,
             ),
             
               
         ),
         SizedBox(height:15.0),
           Text('           Welcome to '
                      ' UUMLOFOSS SYSTEM',style: TextStyle(color:Colors.pink[100],fontSize: 30.0,fontWeight: FontWeight.bold,
                      ),
                      ),
         
       ],
       
      ),
      
        );
      }
    }
          
        
      
     
