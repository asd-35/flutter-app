import 'package:flutter/material.dart';
import 'package:comm_app/pages/login.dart';
import 'package:comm_app/pages/signup.dart';
import "package:comm_app/pages/map.dart";
import "package:comm_app/pages/settings.dart";

void main() => runApp(MaterialApp(
      initialRoute: "/login",
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/map': (context) => Map(),
        '/settings': (context) => Settings(),
      },
    ));
