import 'package:firebase_database/firebase_database.dart';

class UserService{
  DatabaseReference UsersDatabase = FirebaseDatabase.instance.reference().child("Users");

  Future create_user(Map data){
    String id = data["uid"];
    UsersDatabase.child(id).set(data)
        .catchError((e) => {print(e.toString())});
  }
}