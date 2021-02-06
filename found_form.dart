import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/found.dart';



class Foundform extends StatefulWidget {
  final Found found;
  const Foundform({Key key,this.found}):super(key:key);
  @override
  _FoundformState createState() => _FoundformState();
}

class _FoundformState extends State<Foundform> {
  TextEditingController _typeitemController, _colorOrmodelController, _wherefoundController, _datefoundController, _foundbyController, _deliverymethodController;
  String _typeSelected ='';
  DatabaseReference _ref;
  
  @override
  void initState() { 
    super.initState();
    _typeitemController =TextEditingController();
    _colorOrmodelController =TextEditingController();
    _wherefoundController =TextEditingController();
    _datefoundController =TextEditingController();
    _foundbyController =TextEditingController();
    _deliverymethodController =TextEditingController();

    _ref = FirebaseDatabase.instance.reference().child('ReportFound');
    
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: _typeSelected ==title? Colors.pink[100]:Theme.of(context).accentColor,
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
        title: Text('REPORT FOUND FORM'),
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
             controller: _typeitemController,
             decoration: InputDecoration(
               hintText: 'Enter Item name',
               prefixIcon: Icon(Icons.laptop_windows_rounded,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),


             TextFormField(
             controller: _colorOrmodelController,
             decoration: InputDecoration(
               hintText: 'Enter color and model item',
               prefixIcon: Icon(Icons.palette,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),

             TextFormField(
             controller: _wherefoundController,
             decoration: InputDecoration(
               hintText: 'Enter where found',
               prefixIcon: Icon(Icons.location_history,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),

             TextFormField(
             controller: _foundbyController,
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
             controller: _datefoundController,
             decoration: InputDecoration(
               hintText: 'Enter date found',
               prefixIcon: Icon(Icons.date_range_sharp,size:30,),
               fillColor: Colors.blue[100],
               filled: true,
               contentPadding: EdgeInsets.all(15),
             ),
             ),
             SizedBox(height:15.0),


             TextFormField(
             controller: _deliverymethodController,
             decoration: InputDecoration(
               hintText: 'Enter delivery method',
               prefixIcon: Icon(Icons.emoji_transportation,size:30,),
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
               child: RaisedButton(child: Text('Save Report found', style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w600,
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
    String typeitem = _typeitemController.text;
    String colorOrmodel = _colorOrmodelController.text;
    String datefound = _datefoundController.text;
    String wherefound = _wherefoundController.text;
    String foundby = _foundbyController.text;
    String deliverymethod = _deliverymethodController.text;

    Map<String,String>contact={
      'typeitem': typeitem,
      'deliverymethod': deliverymethod,
      'foundby': foundby,
      'datefound': datefound,
      'colorOrmodel': colorOrmodel,
      'wherefound':wherefound,
    };
    _ref.push().set(contact);
  }

}
