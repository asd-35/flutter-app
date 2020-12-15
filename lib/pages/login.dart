import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:comm_app/pages/database.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool secureText = true;

class _LoginState extends State<Login> {


  var checking = 0;
  var db = new Data();
  final mailCon = new TextEditingController();
  final passwordCon = new TextEditingController();

  var loading = SpinKitFadingCircle(color: Colors.black, size: 50.0,);

  void initState() {

    super.initState();
  }

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
              controller: mailCon,
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
              controller: passwordCon,
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
                      Navigator.popAndPushNamed(context, "/map",arguments: {
                        "accType" : "anon",
                        "email": "anonymous",
                        "_id": "None",
                      });
                    })
              ],
            ),
            SizedBox(height: 20.0),
            Center(
                child: OutlineButton(
              onPressed: () async {
                mailCon.text;
                passwordCon.text;
                setState(() {
                  checking = 1;
                });
                 var result = await db.UserCheck(mailCon.text, passwordCon.text);
                 if(result == true){
                   Navigator.popAndPushNamed(context, "/map" ,arguments: {
                     "_id": db.id,
                     "accType" : "signed",
                     "email": db.mail
                   });
                 }else
                   {
                     setState(() {
                       checking = 2;
                     });
                   }
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
                Navigator.pushNamed(context, "/signup");
              },
              child: Text("SIGN UP"),
              color: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              highlightedBorderColor: Colors.black,
            )
            ),
                SizedBox(height: 20.0),
                Center(
                  child: checking == 1 ? loading:null ,
                ),
                Center(
                  child: checking == 2 ? Text("E-mail or password wrong " , style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),):null ,
                ),
          ]),
        ));
  }
}
