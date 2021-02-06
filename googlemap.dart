import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:uumlofoss_project/uumlofoss_screens/uumlofosshome/homemenus.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOCATION UUMLOFOSS SERVICE'),
          actions:<Widget> [
            FlatButton.icon(icon:Icon(Icons.arrow_back,color:Colors.pink[100],
            ),
            label: Text('main menu',style:TextStyle(color:Colors.pink[100]),
            ),
            onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Homemenus()),
             );
             },
            ),
          ],
        ),
        body: Container(
          child:  Center(
          child: Goomap(),
        ),
        )
        
       
      ),
    );
  }
}


class Goomap extends StatefulWidget {
  @override
  _GoomapState createState() => _GoomapState();
}


class _GoomapState extends State<Goomap> {
  double screenHeight = 0.00, screenWidth = 0.00;
  String gmaploc = "";
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(6.4676929, 100.5067673);
  MarkerId markerId1 = MarkerId("marker");
  Set<Marker> _markers = Set();
  LatLng _lastMapPosition = _center;
  Position _currentPosition;
  String _homeloc = "searching...";
  double latitude, longitude, restlat, restlon;
  GoogleMapController gmcontroller;
  CameraPosition _home;
  CameraPosition _userpos;
  var first;


  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  @override
  void initState() {
    super.initState();
    _getLocation(_center);
    _markers.add(Marker(
        markerId: markerId1,
        position: _center,
        draggable: true,
        ));
        
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return StatefulBuilder(
      builder: (context, newSetState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 2 * (MediaQuery.of(context).size.height / 3),
                width: MediaQuery.of(context).size.width - 10,
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 17.0,
                  ),
                  markers: _markers.toSet(),
                  onTap: (newLatLng) {
                    _loadLoc(newLatLng, newSetState);
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height / 5.2,
                  width: MediaQuery.of(context).size.width - 10,
                  child: Column(
                    children: [
                      Text("Lat: "+latitude.toString()+" , "+"Lng: "+longitude.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:16),),
                      SizedBox(
                height: 5,
              ),
                      Text(""+_homeloc.toString()),
                    ],
                  ),
                  
                ),
                
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getLocation(position) async {
    
        if (position != null) {
          final coordinates = new Coordinates(
              position.latitude, position.longitude);
              
          var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
           first = addresses.first.addressLine;
           
          setState(() {
           
              latitude = position.latitude;
              longitude = position.longitude;
              _homeloc = first;
              
              return ;
              
            
          }
          
          );
        }
    } 
  


  void _loadLoc(LatLng loc, newSetState) async {
    newSetState(() {
      print("insetstate");
      _markers.clear();
      latitude = loc.latitude;
      longitude = loc.longitude;
      _getLocationfromlatlng(latitude, longitude, newSetState);
      _home = CameraPosition(
        target: loc,
        zoom: 17,
      );
      _markers.add(Marker(
        markerId: markerId1,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: 'New Location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
    _userpos = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 17,
    );
    _newhomeLocation();
  }


  _getLocationfromlatlng(double lat, double lng, newSetState) async {
    final Geolocator geolocator = Geolocator()
      ..placemarkFromCoordinates(lat, lng);
    _currentPosition = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //debugPrint('location: ${_currentPosition.latitude}');
    final coordinates = new Coordinates(lat, lng);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    newSetState(() {
      _homeloc = first.addressLine;
      if (_homeloc != null) {
        latitude = lat;
        longitude = lng;
        return;
      }
    });
    setState(() {
      _homeloc = first.addressLine;
      if (_homeloc != null) {
        latitude = lat;
        longitude = lng;
        return;
      }
    });
  }
  Future<void> _newhomeLocation() async {
    gmcontroller = await _controller.future;
    gmcontroller.animateCamera(CameraUpdate.newCameraPosition(_home));
  }
}


