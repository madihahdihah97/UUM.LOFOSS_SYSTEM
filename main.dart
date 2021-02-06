import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uumlofoss_project/uumlofoss_screens/home1.dart';



void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'stiw2044 project',
      theme: ThemeData(
       primaryColor: Colors.blue[900],
       accentColor: Colors.blue[100], 
      ),
     home: SplashScreen(),
     routes: {
       'home':(context)=>Home1()
     },
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer(){
    Timer(Duration(seconds: 4),(){
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
      backgroundColor:Colors.blue[100],
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/bg.jpg'),
          fit:BoxFit.cover
          ), 
        ),
         child:Center(
        child:Image.asset('assets/logo.jpg',width:MediaQuery.of(context).size.width*.5,),
      ),
     
      ),
    );
  }
}
