import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' ;


class Data{
  Data();
  void createDB() async
  {
    final db = await Db.create("");
    print("setting up...");
    await db.open();
    print("its on!");
    DbCollection collUser = db.collection("users");
    //DbCollection collMark = db.collection("markers");
    print(await collUser.find().toList());
  }
}

