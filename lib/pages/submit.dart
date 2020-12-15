import 'package:comm_app/pages/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Submit extends StatefulWidget {
  @override
  _SubmitState createState() => _SubmitState();
}



class _SubmitState extends State<Submit> {

  Map data = {};
  var db = new Data();
  var submitState = 0;
  var submitCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(

          title: Icon(Icons.account_balance_rounded, color: Colors.black,size: 20.0),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back , color: Colors.black),onPressed: (){
             Navigator.popAndPushNamed(context,"/map", arguments: {
               "email": data["user"],
               "_id": data["_id"]
             });
          },),
          backgroundColor: Colors.white,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Center(
              child: Image.file(data["img"], height: 350, width: 350,)
            ),
            Center(
              child: Text(
                "COMPLAINT MESSAGE",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(



                  child: TextField(
                    controller: submitCon,
                    decoration: InputDecoration(
                        hintText: "Your Complaint",

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        fillColor: Colors.white,
                        filled: true,
                        ),
                  ),
                ),
            ),

            SizedBox(height: 5,),
            Center(
                child: OutlineButton(
                  onPressed: () async {
                    setState(() {
                      submitState = 1;
                    });

                    await db.addMarker(data["_id"],data["user"],submitCon.text, data["imgC"], data["lat"].toString(), data["lon"].toString());
                    Navigator.popAndPushNamed(context, "/map" , arguments: {
                      "email": data["user"],
                      "_id": data["_id"]
                    });
                  },
                  child: Text("REPORT IT"),
                  color: Colors.black,
                  borderSide: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightedBorderColor: Colors.black,
                )),
            SizedBox(height: 20,),
            Center(
              child: submitState == 1 ? SpinKitFadingCircle(color: Colors.black, size: 50.0,):null,
            ),
          ],
        ),
    );
  }
}
