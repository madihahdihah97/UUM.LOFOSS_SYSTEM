import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/lost_form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class LostImage extends StatefulWidget {
  @override
  _LostImageState createState() => _LostImageState();
}

class _LostImageState extends State<LostImage> {
  File _image;
  @override
  Widget build(BuildContext context) {

   Future getImage() async {
     var image =await ImagePicker.pickImage(source: ImageSource.gallery);

     setState((){
      _image =image;
      print('Image Path $_image');
     });
   }
   
   Future uploadpicture(BuildContext context) async {
     String fileName =basename(_image.path);
     StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
     StorageUploadTask uploadTask =firebaseStorageRef.putFile(_image);
     StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
     
     setState(() {
       print("Profile Picture uploaded");
       Scaffold.of(context).showSnackBar(SnackBar(content: Text('Picture Lost Uploaded')));
     });
   }
   

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('ITEM LOST'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return Lostform();
        }));
      },
      child: Icon(Icons.file_copy,color:Colors.pink[400],
      ),
      ),
      body: Builder(
        builder: (context)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:20.0),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:<Widget> [
                 Align(
                   alignment: Alignment.center,
                   child: CircleAvatar(
                     radius: 100.0,
                     backgroundColor: Colors.blue[900],
                     child: ClipOval(
                       child: SizedBox(
                         width: 180.0,
                         height: 180.0,
                         child: (_image!=null)?Image.file(_image,fit: BoxFit.fill,)
                         :Image(image: AssetImage('assets/key1.jpg'),
                         fit: BoxFit.fill,
                         ),
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top:60.0),
                   child:IconButton(icon:Icon(Icons.camera_alt,size: 30.0,
                   ), 
                   onPressed: (){
                     getImage();
                   },
                   ),
                      
                        ),
               ], 
              ),
              SizedBox(
               height: 20.0 
              ),
              SizedBox(
               height: 20.0, 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [
                  RaisedButton(
                    color: Colors.blue[900],
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.pink[200],
                    child: Text('Cancel',style:TextStyle(color: Colors.white,fontSize:16.0),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue[900],
                    onPressed: (){
                      uploadpicture(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.pink[200],
                    child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
