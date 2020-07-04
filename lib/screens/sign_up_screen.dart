import 'dart:collection';
import 'dart:developer';
import 'package:ecommerceapp/database/UserService.dart';
import 'package:ecommerceapp/screens/Homepage.dart';
import 'package:ecommerceapp/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey _key = GlobalKey<FormState>();

  bool hidePassword = true;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserService service = UserService();

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
                              border: InputBorder.none
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
                              border: InputBorder.none
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                Pattern pattern
                                = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = RegExp(pattern);
                                if(!regex.hasMatch(value))
                                  return "Invalid Email";
                                else
                                  return null;
                              }
                            },
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
                        child: ListTile(
                          title: TextFormField(
                            cursorColor: Colors.white,
                            controller: _password_controller,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock_outline,
                              ),
                              border: InputBorder.none
                            ),
                            obscureText: hidePassword,
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
                          trailing: IconButton(icon: Icon(Icons.remove_red_eye),
                            onPressed: (){
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                            },),
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
                        child: ListTile(
                          title: TextFormField(
                            cursorColor: Colors.white,
                            controller: _confirm_password_controller,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              icon: Icon(
                                Icons.lock_outline,
                              ),
                              border: InputBorder.none
                            ),
                            obscureText: hidePassword,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Cannot be empty";

                              } else if (value.length < 8){
                                  return "Password cannot be shorter than 8 characters";

                                }else if(_password_controller.text != value){
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          }),
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
                            onPressed: () async {
                              validateForm();
                            },
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

  Future validateForm() async{
    FormState formState = _key.currentState;
    if (formState.validate()){
      log("formState: Validated");
      FirebaseUser user = await firebaseAuth.currentUser();
      //Check if use exists
      if(user == null){
        debugPrint("user is null");
        firebaseAuth.createUserWithEmailAndPassword(email: _email_controller.text, password: _password_controller.text)
            .then((value) => {

            //Add User details to database
              service.create_user({
                "uid": value.user.uid.toString(),
                "username": _username_controller.text,
                "email": _email_controller.text
              })
              //Print error if encountere
        }).catchError((e) => {print(e.toString())});

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

      }
    }
  }
}


