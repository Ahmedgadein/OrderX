import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/screens/Homepage.dart';
import 'package:ecommerceapp/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
     // ====== Logo ========= //
          Padding(
            padding: EdgeInsets.only(top: 90),
            child: Container(
              height: 250,
              width: 250,
              child: Image.asset("assets/logo/logo_no_bg.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Center(
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[

      // ========== Email textfield ================ //
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.blue[500].withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          child: TextFormField(
                            controller: _email_controller,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                    ),

          // =========== Password textfield =========== //
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.blue[500].withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            controller: _password_controller,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock_outline,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Cannot be empty";
                              } else {
                                if (value.length < 8) {
                                  return "Password cannot be shorter than 8 characters";
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

          // ============= Login Button ============== //
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 0.0,
                        color: Colors.deepPurple[900],
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: MaterialButton(
                            elevation: 0.0,
                            onPressed: () {},
                            color: Colors.deepPurple[900],
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      // ========= Forgot Password =========== //
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

    // ========= Sign Up ============ //
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
        child: OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage("assets/logo/google_logo.png"),
                    height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
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
