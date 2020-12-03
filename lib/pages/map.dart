import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Icon(Icons.account_balance_rounded, color: Colors.black,size: 20.0,),
        centerTitle: true,

        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.apps_outlined), onPressed: (){},color: Colors.black,),
        ],
        leading: IconButton(icon: Icon(Icons.photo_camera_outlined, color: Colors.black,), onPressed: (){},),
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: LatLng(37.43296265331129, -122.08832357078792),
        zoom: 19.151926040649414,
      ),
      ),

    );
  }
}

