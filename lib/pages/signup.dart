import 'package:flutter/material.dart';

enum genders { Female, Male }

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  genders _genders = genders.Female;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up",
            style: TextStyle(color: Colors.black, fontSize: 25.0)),
        toolbarHeight: 70.0,
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(Icons.account_balance_rounded, color: Colors.black, size: 50.0),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "NAME & SURNAME",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(

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
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/login");
                  },
                  child: Text("SIGN UP"),
                  color: Colors.black,
                  borderSide: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightedBorderColor: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
