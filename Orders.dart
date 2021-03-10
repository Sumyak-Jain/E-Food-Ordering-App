import 'dart:ffi';
import 'VendorSignup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Orders"),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 30.0, right: 20.0),
                  child: Column(children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Order ID',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey[800]),
                      ),
                    )
                  ])),
            ]));
  }
}
