import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';


class Data{

  var id;
  var state = 0;
  var mail;
  var url = "key";
  Data();

  Future<bool> UserCheck(user,password) async
  {
    final db = await Db.create(url);
    print("setting up...");
    await db.open(secure: true);
    print("its on!");
    DbCollection collUser = db.collection("users");
    //DbCollection collMark = db.collection("markers");
    var tempUser = await collUser.findOne(where.eq("username", user).and(where.eq("password", password)));

    if(tempUser != null) {
      if (tempUser["username"] == user && tempUser["password"] == password) {
        print("eyoo");
        id = tempUser["_id"];
        mail = tempUser["nickname"];
        tempUser = null;
        return true;
      }
    }else{
      print("nope");
      return false;
    }
    db.close();


  }

  Future signUser(nickname,user,password,gender,id) async
  {
    final db = await Db.create(url);
    print("setting up...");
    await db.open(secure:true);
    print("its on!");

    DbCollection collUser = db.collection("users");
    await collUser.save({
      "username": user,
      "password": password,
      "nickname": nickname,
      "gender": gender,
      "social_id": id
    });
    print("sign up complete");
    db.close();
  }

  Future addMarker(id,user,description,image,lat,lon) async
  {
    final db = await Db.create(url);
    print("setting up...");
    await db.open(secure: true);
    print("its on!");

    DbCollection collMark = db.collection("markers");
    print(description);
    print(image);
    print(lat);
    print(lon);
    Map<String,dynamic> img = {
      "data": base64Encode(image)

    };
    await collMark.save({
      "user": user,
      "image": img,
      "lat": lat,
      "lon": lon,
      "description": description,
      "user_id": id,
      "isMarked": "0"
    });


    db.close();
  }

  Future<Set> getMarkers() async
  {
    final db = await Db.create(url);
    print("setting up...");
    await db.open(secure: true);
    print("its on!");

    DbCollection collMark = db.collection("markers");

    var result;
    result = await collMark.find().toSet();

    return result;
  }
}