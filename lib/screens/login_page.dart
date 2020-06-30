import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/screens/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  bool isLogged = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            handleSignIn().whenComplete(() => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage())));
          },
          color: Colors.deepPurple,
          child: Text("Google Sign In / Sign Up"),
        ),
      ),
    );
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    sharedPreferences = await SharedPreferences.getInstance();
    isLogged = await _googleSignIn.isSignedIn();

    if (isLogged) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount account = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    AuthResult result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseUser user = result.user;

    if (user != null) {
      QuerySnapshot snapshot = await Firestore.instance
          .collection("Users")
          .where("UserID", isEqualTo: user.uid)
          .getDocuments();
      List<DocumentSnapshot> documents = snapshot.documents;

      if (documents.length == 0) {
        Firestore.instance.collection("Users").document(user.uid).setData({
          "uid": user.uid,
          "name": user.displayName,
          "image": user.photoUrl,
        });

        await sharedPreferences.setString("uid", user.uid);
        await sharedPreferences.setString("name", user.displayName);
        await sharedPreferences.setString("image", user.photoUrl);
      } else {
        await sharedPreferences.setString("uid", documents[0]["uid"]);
        await sharedPreferences.setString("name", documents[0]["name"]);
        await sharedPreferences.setString("image", documents[0]["image"]);
      }

      Fluttertoast.showToast(msg: "Sign in Successful");

      setState(() {
        loading = false;
      });
    } else {}
  }
}
