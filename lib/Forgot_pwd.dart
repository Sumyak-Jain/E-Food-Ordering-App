import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/SignupStudent.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/startpage.dart';
import 'VendorSignup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Forgot_pwd extends StatefulWidget {
  @override
  Forgot_pwdState createState() => Forgot_pwdState();
}

class Forgot_pwdState extends State<Forgot_pwd> {
  TextEditingController _emailcontroller, _passwordcontroller;

  bool isEmailValid = true;
  bool ispasswordValid = true;

  @override
  initState() {
    super.initState;

    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reset Password", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[300],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
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
                    /*    SizedBox(height: 10.0),
                    TextField(
                      controller: _passwordcontroller,
                      onChanged: (value) {
                        if (value.length >= 6) {
                          ispasswordValid = true;
                        } else {
                          ispasswordValid = false;
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          labelText: 'NEW PASSWORD',
                          errorText:
                              ispasswordValid ? null : "min 6 characters",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[300]))),
                    ),*/
                    /*  SizedBox(height: 15.0),
                    RichText(
                      text: TextSpan(
                          text:
                              'NOTE: A reset link will be sent to your email to confirm and verify new password please make sure you enter the same password here and in the link ! ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ),*/
                    SizedBox(height: 20.0),

                    // SizedBox(height: 0.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal[300],
                          child: InkWell(
                            onTap: () {
                              reset(context);
                            },
                            child: Center(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    //   SizedBox(height: 10.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentLogin()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Return to  Sign In',
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
  void reset(BuildContext context) async {
    String email = _emailcontroller.text;
    String pwd = _passwordcontroller.text;
    Map<String, String> changes = {
      'password': pwd,
    };
    print(changes);

    // Attach a listener to read the data at our posts reference

    if (email.isNotEmpty || pwd.isNotEmpty) {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: "A password resent link has been sent to your email",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal[300],
          textColor: Colors.white,
          fontSize: 18.0);
      /*  final DatabaseReference _ref = FirebaseDatabase.instance
          .reference()
          .child("StudentDetails")
          .orderByChild("email")
          .equalTo(email);
      print(_ref);
      _ref.update(changes).then((_) {
        _emailcontroller.clear();
        _passwordcontroller.clear();
        Fluttertoast.showToast(
            msg: "A password resent link has been sent to your email",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.teal[300],
            textColor: Colors.white,
            fontSize: 18.0);
      });*/
    } else {
      // print(details ?? " ");

      Fluttertoast.showToast(
          msg: "Invalid or empty email",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal[300],
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }
}
