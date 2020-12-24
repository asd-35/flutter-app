import 'dart:async';
import 'dart:convert';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:comm_app/pages/database.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;
  Location _location = Location();
  LocationData _locationData;
  var _image;
  final picker = ImagePicker();
  List<Marker> map = [];
  bool submit;
  var data;
  var _cmpressed_image;
  var db = new Data();

  watchLocation() async {
    _location.onLocationChanged.listen((LocationData currentLocation) {
      LatLng latLng =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latLng, 15);
      mapController.animateCamera(cameraUpdate);

      setState(() {
        this._locationData = currentLocation;
      });
    });
  }

  Future<void> getMark() async {

    var temp = await db.getMarkers();

    for(var value in temp) {
      if (value["isMarked"] == "1") {

      } else{
        map.add(Marker(markerId: MarkerId(value["_id"].toString()),
          position: LatLng(
              double.parse(value["lat"]), double.parse(value["lon"])),
          onTap: () {
            Navigator.pushNamed(context, '/info', arguments: {
              "user": value["user"],
              "image": MemoryImage(base64Decode(value["image"]["data"])),
              "description": value["description"],});
          },
        ));
    }
    }

  }


  @override
  void initState() {
    super.initState();
    getMark();
    watchLocation();

  }

  Future getImage(bool cam) async {
    if (cam) {
      final picked = await picker.getImage(source: ImageSource.camera);


        _cmpressed_image = await FlutterImageCompress.compressWithFile(
            picked.path,
            format: CompressFormat.jpeg,
            quality: 70
        );


      setState(() {
        if (picked != null) {
          print("photo taken");
          _image = File(picked.path);
          submit = true;
        } else {
          print('Photo was not taken');
          submit = false;
          print(submit);
        }
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;



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
              Navigator.popAndPushNamed(context, "/settings",arguments: data);
            },
            color: Colors.black,
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.photo_camera_outlined,
            color: Colors.black,
          ),
          onPressed: () async {
            await getImage(true);

            if (submit) {
              Navigator.pushNamed(context,"/submit",arguments: {
                "img" : _image,
                "imgC" : _cmpressed_image,
                "lat": this._locationData.latitude.toString(),
                "lon": this._locationData.longitude.toString(),
                "accType": data["accType"],
                "_id" : data["_id"],
                "user": data["email"]
              });
              submit = false;
            }
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
              myLocationEnabled: true,
              mapToolbarEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              markers: Set.from(map),

              initialCameraPosition: CameraPosition(
                target: LatLng(this._locationData?.latitude ?? 41.015137,
                    this._locationData?.longitude ?? 28.979530),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              }),
        ],
      ),
    );
  }

}
