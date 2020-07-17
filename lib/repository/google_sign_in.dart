import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database/UserService.dart';

class GoogleAuth{
  UserService _service = UserService();

  Future<FirebaseUser> googleSignIn() async {
    FirebaseAuth mAuth;
    FirebaseUser user;

    mAuth = FirebaseAuth.instance;

    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount account = await googleSignIn.signIn();

    GoogleSignInAuthentication authentication = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    try{
      mAuth.signInWithCredential(credential)
      .then((value){
//        if(va)
        _service.createUser({
         "userId": value.user.uid,
         "email": value.user.email,
         "name": value.user.displayName,
       });
      });

    }catch(error){
      print(error);
      return null;
    }
  }
}