import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/lost.dart';



class Lostform extends StatefulWidget {
  final Lost lost;
  const Lostform ({Key key, this.lost});

  @override
  _LostformState createState() => _LostformState();
}

class _LostformState extends State<Lostform> {
  TextEditingController _naController, _nuController, _itController, _dlostController, _wlostController, _cController;
  String _typeSelected ='';
  DatabaseReference _reference;

  @override
  void initState() {
    super.initState();
    _naController = TextEditingController();
    _nuController = TextEditingController();
    _itController = TextEditingController();
    _dlostController = TextEditingController();
    _wlostController = TextEditingController();
    _cController = TextEditingController();
    _reference = FirebaseDatabase.instance.reference().child('Contacts');
  }
  
  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: _typeSelected == title? Colors.pink[100]:Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child:Center(
          child: Text(title,style:TextStyle(fontSize: 18,color:Colors.pink[600]),
          ),
        ),
      ),
      onTap: (){
       setState((){
         _typeSelected =title;
       });
      },
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('REPORT LOST FORM'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
       margin: EdgeInsets.all(15.0), 
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:<Widget> [

             TextFormField(
             controller: _naController,
             decoration: InputDecoration(
               hintText: 'Enter name',
               prefixIcon: Icon(Icons.account_box,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),


             TextFormField(
             controller: _nuController,
             decoration: InputDecoration(
               hintText: 'Enter IC Number',
               prefixIcon: Icon(Icons.person,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),

             TextFormField(
             controller: _itController,
             decoration: InputDecoration(
               hintText: 'Enter Item Lost',
               prefixIcon: Icon(Icons.wallet_giftcard_rounded,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),

             TextFormField(
             controller: _cController,
             decoration: InputDecoration(
               hintText: 'Enter color or model Item',
               prefixIcon: Icon(Icons.palette,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),

             TextFormField(
             controller: _wlostController,
             decoration: InputDecoration(
               hintText: 'Enter location lost',
               prefixIcon: Icon(Icons.location_pin,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),


             TextFormField(
             controller: _dlostController,
             decoration: InputDecoration(
               hintText: 'Enter date lost',
               prefixIcon: Icon(Icons.date_range_sharp,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),
             Container(
               child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children:<Widget> [
                     _buildContactType('Key'),
                     SizedBox(width:10.0),

                     _buildContactType('Wallet'),
                     SizedBox(width:10.0),

                     _buildContactType('Phone'),
                     SizedBox(width:10.0),

                     _buildContactType('Laptop'),
                     SizedBox(width:10.0),

                     _buildContactType('Others'),
                     SizedBox(width:10.0),

                     
                   ],
                 ),
               ),
             ),

             Container(
               width: double.infinity,
               padding: EdgeInsets.symmetric(horizontal:10.0),
               child: RaisedButton(child: Text('Save Report Lost', style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w600,
               ),
               ),
               onPressed: (){
                 saveContact();
               },
               color: Colors.blue[900],
               ),
             )
           ],
         ),
       ),
      ),
    );
  }
  void saveContact(){
    String name = _naController.text;
    String number = _nuController.text;
    String item = _itController.text;
    String datelost = _dlostController.text;
    String wherelost = _wlostController.text;
    String colorOrmodel = _cController.text;

    Map<String,String> contact = {
      'name': name,
      'number': '+60'+ number,
      'item': item,
      'datelost': datelost,
      'colorOrmodel': colorOrmodel,
      'wherelost':wherelost,
      'type': _typeSelected,
    };
    _reference.push().set(contact);
  }

}
