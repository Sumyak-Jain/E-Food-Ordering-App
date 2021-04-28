import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/VendorLogin.dart';
import 'package:food_app/VendorSignup.dart';
import 'OrdersReady.dart';
import 'BottomNavigation.dart';

class startpage extends StatefulWidget {
  @override
  _startpageState createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "E-Food Ordering",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Container(
                      width: 390,
                      // height: 200,
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/mainphoto.png",
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(height: 70.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal[300],
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VendorLogin()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'VENDOR',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 30.0),
                    Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal[300],
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentLogin()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'STUDENT',
                                style: TextStyle(
                                    color: Colors.white,
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
}
