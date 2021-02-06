import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:uumlofoss_project/uumlofoss_screens/home1.dart';


class Register1 extends StatefulWidget {
  @override
  _Register1State createState() => _Register1State();
}
class _Register1State extends State<Register1> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

Future register1() async {
 var url ="http://192.168.8.106/lofoss/register.php";
 var response = await http.post(url,body:{
  "username": user.text,
  "password": pass.text,
 });
 var data = json.decode(response.body);
 if (data == "Error"){
   Fluttertoast.showToast(
        msg: "This user Already Exit!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
 }else{
    Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
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
              color: Colors.blue[100],
              elevation: 5,
              child:Column(
                verticalDirection: VerticalDirection.down,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[400],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((8)),
                        )
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: 'Pasword',
                        prefixIcon: Icon(Icons.keyboard),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((8)),
                        ),
      
                        ),
                      ),
                    ),
                  
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children:<Widget> [
                      Expanded(
                       child: MaterialButton(
                         color: Colors.pink[400],
                         child: Text(
                           'Register',
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.white
                           ),
                           ),
                           onPressed: (){
                             register1();
                           },
                       ), 
                      ),
                      SizedBox(
                        width: 20.0,
                        
                      ),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login1()),);
                             
                           },
                       ), 
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
