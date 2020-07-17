import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/cupertino.dart';

import 'database/UserService.dart';

enum Status {Uninitialized, UnAuthenticated, Authenticating, Authenticated}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;

  Status get status => _status;
  FirebaseUser get user => _user;

  UserService _service = UserService();

  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(onStateChanged);
  }

  // Firebase Sign in
  Future<bool> signIn(String email, String password) async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(error){
      _status = Status.UnAuthenticated;
      notifyListeners();
      print(error.toString());
      return false;
    }
  }

  // Firebase Sign up
  Future<bool> signUp(String name, String email, String password) async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
        Map<String, dynamic> values = {
          "userId": value.user.uid,
          "name": name,
          "email":email
        };
        _service.createUser(values);
      });
      return true;

    }catch(error){
      _status = Status.UnAuthenticated;
      notifyListeners();
      print(error.toString());
      return false;
    }
  }

  Future signOut(){
    _auth.signOut();
    _status = Status.UnAuthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }


  void onStateChanged(FirebaseUser event) async{
    if(event == null){
      _status = Status.UnAuthenticated;
    }else{
      _status = Status.Authenticated;
      _user = event;
    }
    notifyListeners();
  }
}
