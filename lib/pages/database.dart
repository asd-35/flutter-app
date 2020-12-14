import 'package:mongo_dart/mongo_dart.dart';


class Data{

  var id;
  var state = 0;

  Data();

  Future<bool> UserCheck(user,password) async
  {
    final db = await Db.create("key");
    print("setting up...");
    await db.open();
    print("its on!");
    DbCollection collUser = db.collection("users");
    //DbCollection collMark = db.collection("markers");
    var tempUser = await collUser.findOne(where.eq("username", user).and(where.eq("password", password)));

    if(tempUser != null) {
      if (tempUser["username"] == user && tempUser["password"] == password) {
        print("eyoo");
        id = tempUser["_id"];
        tempUser = null;
        return true;
      }
    }else{
      print("nope");
      return false;
    }
    db.close();


  }

  Future signUser(nickname,user,password,gender) async
  {
    final db = await Db.create("key");
    print("setting up...");
    await db.open();
    print("its on!");

    DbCollection collUser = db.collection("users");
    await collUser.save({
      "username": user,
      "password": password,
      "nickname": nickname,
      "gender": gender
    });
    print("sign up complete");
  }
}