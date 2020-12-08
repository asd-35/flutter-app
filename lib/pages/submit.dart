import 'dart:io';
import 'package:flutter/material.dart';



class Submit extends StatefulWidget {
  @override
  _SubmitState createState() => _SubmitState();
}



class _SubmitState extends State<Submit> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(

          title: Icon(Icons.account_balance_rounded, color: Colors.black,size: 20.0),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back , color: Colors.black),onPressed: (){
            Navigator.pop(context);
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
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/map");
                  },
                  child: Text("REPORT IT"),
                  color: Colors.black,
                  borderSide: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightedBorderColor: Colors.black,
                )),
          ],
        ),
    );
  }
}
