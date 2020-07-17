import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  String  _Users_Collection = "Users";
  Firestore _Users = Firestore.instance;

  Future createUser(Map<String,dynamic> data) {
    _Users.collection(_Users_Collection).document(data["userId"]).setData(data);
  }
}