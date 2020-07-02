import 'package:ecommerceapp/screens/login_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey _key = GlobalKey<FormState>();

  TextEditingController _username_controller = TextEditingController();
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  TextEditingController _confirm_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
      // ====== Logo ========= //
          Padding(
            padding: EdgeInsets.only(top: 50),
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

      // ============ Username textfield ===============//
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
                            controller: _username_controller,
                            decoration: InputDecoration(
                              hintText: "Username",
                              icon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ),
                    ),

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

      // ============ Confirm Password ================ //
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
                            controller: _confirm_password_controller,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
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

      // ============= Sign up Button ============== //
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
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text(
                              "Sign Up",
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

      // ========= Login ========== //
          Container(
            padding: EdgeInsets.only(top:10.0),
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
