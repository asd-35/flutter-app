import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:comm_app/pages/database.dart";


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  var data;
  var db = new Data();
  @override

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    db.UserCheck(data["user"], data["password"]);

    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 50.0,

        ),
      ),
    );
  }
}


