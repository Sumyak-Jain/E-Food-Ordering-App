import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/Orders.dart';
import 'SignupStudent.dart';

class VendorSignup extends StatefulWidget {
  @override
  _SignupVendorState createState() => _SignupVendorState();
}

class _SignupVendorState extends State<VendorSignup> {
  TextEditingController _shopnamecontroller,
      _emailcontroller,
      _numbercontroller,
      _password;

  bool isShopNameValid = true;
  bool isEmailValid = true;
  bool isnumberValid = true;
  RegExp regExp1 = new RegExp(
    //name
    r'^[a-zA-z]+([\s][a-zA-Z]+)*$',
  );
  /* RegExp regExp2 = new RegExp(
    //email
    r'^((?!gmail).)*$',
  );
  */

  RegExp regExp3 = new RegExp(
    //number
    r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$',
  );
  final DatabaseReference _ref1 =
      FirebaseDatabase.instance.reference().child("VendorDetails");

  @override
  Void initState() {
    super.initState;
    _shopnamecontroller = TextEditingController();
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
          title: Text("Vendor Signup"),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _shopnamecontroller,
                    onChanged: (value) {
                      if (regExp1.hasMatch(value)) {
                        isShopNameValid = true;
                      } else {
                        isShopNameValid = false;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'SHOP NAME',
                        errorText: isShopNameValid ? null : "Invalid name",
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
                        labelText: 'E-MAIL',
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
                    onChanged: (value) {
                      if ((regExp3.hasMatch(value)) && value.length == 10) {
                        isnumberValid = true;
                      } else {
                        isnumberValid = false;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'PHONE NUMBER ',
                        errorText: isnumberValid ? null : "Invalid number",
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
                            _shopnamecontroller.clear();
                            _emailcontroller.clear();
                            _numbercontroller.clear();
                            _password.clear();
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
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupStudent()),
                          );
                        },
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
    String shop_name = _shopnamecontroller.text;
    String id = _emailcontroller.text;
    String number = _numbercontroller.text;
    String password = _password.text;
    Map<String, String> vendor_details = {
      'shop name': shop_name,
      'email-id': id,
      'number': number,
      'password': password,
    };
    _ref1.push().set(vendor_details);
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
      title: Text("Vendor Signup"),
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
