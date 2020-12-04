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

        title: Icon(Icons.account_balance_rounded, color: Colors.black,size: 20.0),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back , color: Colors.black),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.white,


      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Text("USER :" , style: TextStyle(color: Colors.black, letterSpacing: 2.0)),
                SizedBox(width: 20.0,),
                Text("example@gmail.com" , style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                TextButton(onPressed: (){
                  Navigator.popAndPushNamed(context, "/login");
                }, child: Text("SIGN OUT", style: TextStyle(color: Colors.red , fontSize: 20))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


