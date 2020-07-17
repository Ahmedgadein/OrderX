import 'file:///C:/Users/Ahmed-Obied/ecommerce_app/lib/repository/google_sign_in.dart';
import 'package:ecommerceapp/repository/user_provider.dart';
import 'package:ecommerceapp/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleAuth googleAuth = GoogleAuth();
  SharedPreferences sharedPreferences;

  bool isLogged = false;
  bool loading = false;

  final _key = GlobalKey<FormState>();
  final _scaffold_key = GlobalKey<ScaffoldState>();

  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffold_key,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // ====== Logo ========= //
          Padding(
            padding: EdgeInsets.only(top: 90, bottom: 50),
            child: Container(
              height: 200,
              width: 200,
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
                    // ========== Email text field ================ //
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
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return "Invalid Email";
                              }

                              return null;
                            },
                            controller: _email_controller,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // =========== Password text field =========== //
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
                            onPressed: () async {
                              if (_key.currentState.validate()) {
                                if(! await user.signIn(_email_controller.text, _password_controller.text))
                                  _scaffold_key.currentState.showSnackBar(SnackBar(content: Text("Log in failed"),));
                              }
                            },
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
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

        //======= Google Sign-in ========== //
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
}
