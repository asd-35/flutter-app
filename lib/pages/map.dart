import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  File _image;
  final picker = ImagePicker();

  Future getImage(bool cam) async {
    if (cam) {
      final picked = await picker.getImage(source: ImageSource.camera);
      setState(() {
        if (picked != null) {
          _image = File(picked.path);
        } else {
          print('Photo was not taken');
        }
      });
    }
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(41.01224, 28.976018), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            Icons.account_balance_rounded,
            color: Colors.black,
            size: 20.0,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.apps_outlined),
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              color: Colors.black,
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.photo_camera_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              getImage(true);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
          ],
        ));
  }
}
