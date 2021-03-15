import 'dart:ffi';
import 'VendorSignup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'modelclass.dart';

class Orders extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}
//final DatabaseReference _ref2 =
//    FirebaseDatabase.instance.reference().child("Order ID");

class _OrderState extends State<Orders> {
  List<Model> list = [];
  @override
  void initState() {
    super.initState();
    final DatabaseReference db =
        FirebaseDatabase.instance.reference().child("OrderID");
    db.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      list.clear();
      for (var key in keys) {
        Model m = new Model(
          data[key]['orderID'],
        );
        list.add(m);
      }
      setState(() {
        print('Lenght: ${list.length}');
      });
    });
  }

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
                          fontSize: 25,
                          color: Colors.grey[800]),
                    ),
                  )
                ])),
            SizedBox(height: 10.0),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.teal[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTap,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
      ),
    );
  }
}
