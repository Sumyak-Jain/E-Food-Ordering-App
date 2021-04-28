import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/OrdersReady.dart';
import 'package:food_app/VendorLogin.dart';
import 'package:food_app/providers/Name.dart';
import 'package:food_app/providers/vendor_name.dart';
import 'package:provider/provider.dart';
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
  bool ispasswordValid = true;
  RegExp regExp1 = new RegExp(
    //name
    r'^[a-zA-z]+([\s][a-zA-Z]+)*$',
  );

  RegExp regExp2 = new RegExp(
    //email
    r'^((?!stu).)*$',
  );
  RegExp regExp3 = new RegExp(
    //number
    r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$',
  );
  final DatabaseReference _ref1 =
      FirebaseDatabase.instance.reference().child("VendorDetails");

  get vendordetails => null;

  @override
  initState() {
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
        title: Text("Vendor Signup", style: TextStyle(color: Colors.white)),
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
                      onChanged: (value) {
                        if (regExp2.hasMatch(value) && value.length >= 10) {
                          isEmailValid = true;
                        } else {
                          isEmailValid = false;
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          labelText: 'E-MAIL',
                          errorText: isEmailValid
                              ? null
                              : "Please don't enter college id",
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
                      onChanged: (value) {
                        if (value.length >= 6) {
                          ispasswordValid = true;
                        } else {
                          ispasswordValid = false;
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          errorText:
                              ispasswordValid ? null : "min 6 characters",
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
                          child: Consumer<VendorName>(
                            builder: (context, nameL, child) {
                              return InkWell(
                                onTap: () {
                                  signup();
                                  print("hello");
                                  print(_shopnamecontroller.text.toString());
                                  nameL.addName(
                                      _shopnamecontroller.text.toString());
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
                              );
                            },
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
                                  builder: (context) => VendorLogin()),
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
          ]),
    );
  }

  void signup() {
    String shop_name = _shopnamecontroller.text;
    String id = _emailcontroller.text;
    String number = _numbercontroller.text;
    String password = _password.text;
    Map<String, String> vendordetails = {
      'shop name': shop_name,
      'email-id': id,
      'number': number,
      'password': password,
    };
    if (shop_name.isEmpty || id.isEmpty || password.isEmpty || number.isEmpty) {
      showAlertDialog1(context);
    } else {
      _ref1.push().set(vendordetails);

      registerNewUser(context);
    }
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

  showAlertDialog1(BuildContext context) {
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
      content: Text("Empty Data Field Please Enter Data!"),
      actions: [okButton],
    );

    //show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailcontroller.text, password: _password.text)
            .catchError((errMsg) {
      print(errMsg.toString());
    }))
        .user;
    if (firebaseUser != null) {
      _emailcontroller.clear();
      _shopnamecontroller.clear();
      _numbercontroller.clear();
      _password.clear();

      _ref1.child(firebaseUser.uid).set(vendordetails);
      showAlertDialog(context);
    }
  }
}
