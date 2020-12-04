import 'package:flutter/material.dart';
import 'package:comm_app/pages/login.dart';
import "package:comm_app/pages/map.dart";
import "package:comm_app/pages/settings.dart";

void main() => runApp(MaterialApp(
      initialRoute: "/login",
      routes: {
        '/login': (context) => Login(),
        '/map': (context) => Map(),
        '/settings': (context) => Settings(),
      },
    ));
