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
          children: <Widget> [
            SizedBox(width: 20,height: 20,)
          ],
        )


    );
  }
}
