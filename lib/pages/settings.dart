import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Icon(Icons.account_balance_rounded, color: Colors.black,size: 20.0,),
        centerTitle: true,

        backgroundColor: Colors.white,


      ),
      body: Column(
        children: <Widget> [
          Text("USER:" , )
        ],
      ),
    );
  }
}
