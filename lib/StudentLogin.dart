import 'dart:async';
import 'BottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/Forgot_pwd.dart';
import 'package:food_app/SignupStudent.dart';
import 'package:food_app/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'VendorSignup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  TextEditingController _emailcontroller, _password;

  final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child("StudentDetails");

  @override
  initState() {
    super.initState;

    _emailcontroller = TextEditingController();

    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[300],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Hello!',
                          style: TextStyle(
                            color: Colors.teal[300],
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 25.0),
                    TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          labelText: 'SAP EMAIL ID',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[300]))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _password,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[300]))),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot_pwd()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.teal[300],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    // SizedBox(height: 0.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal[300],
                          child: InkWell(
                            onTap: () {
                              signin(context);
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 170.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupStudent()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'New User? Create Account',
                                style: TextStyle(
                                    color: Colors.teal[300],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
          ]),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signin(BuildContext context) async {
    String email = _emailcontroller.text;
    String password = _password.text;
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: _emailcontroller.text, password: _password.text)
            .catchError((errMsg) {
      Fluttertoast.showToast(
          msg: "Invalid Email or Password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal[300],
          textColor: Colors.white,
          fontSize: 18.0);
    }))
        .user;

    if (firebaseUser.emailVerified) {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homepage()),
      );
    } else {
      await firebaseUser.sendEmailVerification();
      Fluttertoast.showToast(
          msg: "A mail is sent to your email please verify to login",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal[300],
          textColor: Colors.white,
          fontSize: 18.0);
      if (firebaseUser.emailVerified) {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      }
    }
  }
}
