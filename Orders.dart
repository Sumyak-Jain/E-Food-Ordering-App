import 'dart:ffi';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_sms/flutter_sms.dart';
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
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ref = FirebaseDatabase.instance.reference().child("VendorDetails");
    // .orderByChild('shop name');
  }

  // ignore: deprecated_member_use

  Widget buildOrders({Map order}) {
    // ignore: deprecated_member_use

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.bookmark_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['shop name'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 20, color: Colors.teal),
              ),

              SizedBox(width: 110),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  //  print(order['number']);
                  //  print(recipents);
                  recipents.add(order['number']);
                  print(recipents);
                  _sendSMS(
                      "Dear, " +
                          order['shop name'] +
                          "\nORDER ID - " +
                          order['password'] +
                          "\nPlease Pickup! Your order is ready \nThank You \nE-Food Ordering App Team",
                      recipents);
                  recipents.clear();
                  print(recipents);
                },
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Order Ready',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['email-id'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              /*  Icon(
                Icons.food_bank_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['item name'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
              
              SizedBox(width: 15),
              */
              Icon(
                Icons.payment_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['password'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.call,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['number'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
            ],
          )
        ],
      ),
    );
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
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final Map order = snapshot.value;

            return buildOrders(order: order);
          },
        ),
      ),
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

final List<String> recipents = [];
void _sendSMS(String message, recipents) async {
  String _result =
      await FlutterSms.sendSMS(message: message, recipients: recipents)
          .catchError((onError) {
    print(onError);
  });
  print(_result);
}
