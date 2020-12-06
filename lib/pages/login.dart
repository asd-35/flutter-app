import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool secureText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Center(
                child: Icon(
              Icons.account_balance_rounded,
              color: Colors.black,
              size: 70.0,
            )),
            SizedBox(height: 20.0),
            Text(
              "E-MAIL",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                  hintText: "Your E-mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 20.0),
            Text(
              "PASSWORD",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        secureText = !secureText;
                      });
                    },
                  )),
              obscureText: secureText,
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Text(
                  " Continue as anonymous ----------->",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.account_box_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/map");
                    })
              ],
            ),
            SizedBox(height: 20.0),
            Center(
                child: OutlineButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/map");
              },
              child: Text("LOGIN"),
              color: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              highlightedBorderColor: Colors.black,
            )),
            SizedBox(height: 20.0),
            Center(
                child: OutlineButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/signup");
              },
              child: Text("SIGN UP"),
              color: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              highlightedBorderColor: Colors.black,
            )),
          ]),
        ));
  }
}
