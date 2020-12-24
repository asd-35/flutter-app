import 'package:flutter/material.dart';
import "package:comm_app/pages/database.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum genders { Female, Male }

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  genders _genders;
  var db = new Data();
  var fillFormsCheck = 0;
  final mailCon = new TextEditingController();
  final passwordCon = new TextEditingController();
  final nickCon = new TextEditingController();
  final idCon = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: const Text("Sign Up",
              style: TextStyle(color: Colors.black, fontSize: 25.0)),
        ),
        toolbarHeight: 70.0,
        elevation: 1.0,
        backgroundColor: Colors.white,

        actions: <Widget>[
          Icon(Icons.account_balance_rounded, color: Colors.black, size: 30.0),
        ],
        leading: IconButton(icon: Icon(Icons.arrow_back , color: Colors.black),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "NICKNAME",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              controller: nickCon,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))

              ),

              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 8.0),
            Text(
              "E-MAIL",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              controller: mailCon,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              decoration:  InputDecoration(
            border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 8.0),
            Text(
              "PASSWORD",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              controller: passwordCon,
              obscureText: true,
              decoration:  InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 8.0),
            Text(
              "ID",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              controller: idCon,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))
              ),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 8.0),
            Text("GENDER",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.0,
                )),
            ListTile(
              title: const Text("Female"),
              leading: Radio(
                value: genders.Female,
                groupValue: _genders,
                onChanged: (genders value) {
                  setState(() {
                    _genders = value;
                  });
                },
              ),
            ),
            SizedBox(height: 5.0),
            ListTile(
              title: const Text("Male"),
              leading: Radio(
                value: genders.Male,
                groupValue: _genders,
                onChanged: (genders value) {
                  setState(() {
                    _genders = value;
                  });
                },
              ),
            ),
            Center(
                child: OutlineButton(
                  onPressed: () async {
                    //Navigator.popAndPushNamed(context, "/login");
                   // print(_genders.toString().substring(8));
                    if(nickCon.text != "" && passwordCon.text != "" && mailCon.text != "" && _genders != null && idCon.text != null)
                      {
                        setState(() {
                          fillFormsCheck = 2;
                        });
                        await db.signUser(nickCon.text, mailCon.text, passwordCon.text, _genders.toString().substring(8),idCon.text);
                        Navigator.popAndPushNamed(context, "/login");
                      }
                      else
                        {
                          setState(() {
                            fillFormsCheck = 1;
                          });
                        }
                  },
                  child: Text("SIGN UP"),
                  color: Colors.black,
                  borderSide: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightedBorderColor: Colors.black,
                )),
            SizedBox(height: 20,),
            Center(
              child : fillFormsCheck == 1 ? Text("Please fill all the forms given " , style: TextStyle(color: Colors.red, fontSize: 20),):null
            ),
            Center(
                child : fillFormsCheck == 2 ? SpinKitFadingCircle(color: Colors.black, size: 50.0,):null
            )
          ],
        ),
      ),
    );
  }
}
