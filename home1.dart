import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/register1.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/welcome.dart';


class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'join php',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Login1(),
    );
  }
}

class Login1 extends StatefulWidget {
  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {

TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();

Future login1() async {
  var url ="http://192.168.8.106/lofoss/register.php";
  var response = await http.post(url,body: {
    "username": user.text,
    "password": pass.text,

  });
  var data = json.decode(response.body);
  if(data == "Error"){
     Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()),);
  }else{
     Fluttertoast.showToast(
        msg: "Invalid Username and Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blueAccent,
      body: ListView(
        children:<Widget> [
          SizedBox(height:15.0),
           Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.jpg'),
                radius: 50.0,
              ),
              
             ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color:Colors.blue[100],
              elevation:5,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[400]),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: user,
                        decoration: InputDecoration(
                          labelText: 'username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.keyboard),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ) ,
                    Row(
                      children:<Widget> [
                        Expanded(
                          child: MaterialButton(
                            color: Colors.pink[400],
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            onPressed: (){
                              login1();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: MaterialButton(
                            color: Colors.pink[400],
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register1()),);
                              
                            },
                          ),
                        ), 
                      ],
                    )
                ],
              ),
            ),
            ),
        ],
      ),
    );
  }
}
