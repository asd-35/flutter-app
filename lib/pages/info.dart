import 'package:flutter/material.dart';



class Info extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Info> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 30,),
            Center(

              child: Text(
                "COMPLAINT",
                style: TextStyle(
                  color: Colors.redAccent,
                  letterSpacing: 1.0,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Image(height: 350, width: 350,
                image: NetworkImage("https://www.bingolonline.com/image/img/1/yol-medeniyet-ise_1359429660.jpg"),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget> [
                SizedBox(width: 20,),
                Text(
                  "Image taken by :",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Example Example",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.0,
                    fontSize: 15
                    ,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget> [
                SizedBox(width: 20,),
                Text(
                  "Description :",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget> [
                SizedBox(width: 20,),
                Text(
                  "dasdadadadaddasdadadadada\ndsadasdadadasdadsa",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.0,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        )


    );
  }
}
