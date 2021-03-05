import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignupStudent extends StatefulWidget {
  @override
  _SignupStudentState createState() => _SignupStudentState();
}

class _SignupStudentState extends State<SignupStudent> {
  TextEditingController _namecontroller,
      _emailcontroller,
      _numbercontroller,
      _password;

  final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child("studentdetails");

  void sendData() {
    // _ref.push().set({'first_name': 'gaurav', 'last_name': 'jain'});
  }

  @override
  Void initState() {
    super.initState;
    _namecontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _numbercontroller = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Student Signup"),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[300]))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        labelText: 'COLLEGE  E-MAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[300]))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _numbercontroller,
                    decoration: InputDecoration(
                        labelText: 'PHONE NUMBER ',
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
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[300]))),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 50.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.teal[300],
                        child: InkWell(
                          onTap: () {
                            signup();
                            showAlertDialog(context);
                          },
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text('LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }

  void signup() {
    String name = _namecontroller.text;
    String id = _emailcontroller.text;
    String number = _numbercontroller.text;
    String password = _password.text;
    Map<String, String> studentdetails = {
      'name': name,
      'email-id': id,
      'number': number,
      'password': password,
    };
    _ref.push().set(studentdetails);
  }

  showAlertDialog(BuildContext context) {
    //create button

    Widget okButton = InkWell(
      child: Text("OK"),
      onTap: () {
        Navigator.of(context).pop();
      },
    );

    //create alertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Student Signup"),
      content: Text("Account Created Successfully!"),
      actions: [okButton],
    );

    //show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
