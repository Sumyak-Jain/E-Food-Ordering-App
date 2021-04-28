import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/Drawer.dart';
import 'package:food_app/commons.dart';
import 'package:food_app/items.dart';
import 'dart:convert';
import 'package:food_app/providers/Name.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/providers/orders.dart';
import 'package:food_app/providers/payment.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'VendorSignup.dart';
import 'BottomNavigation.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Student_history extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student_history> {
  Query _ref;

  Razorpay razorpay;
  void initState() {
    razorpay = Razorpay();
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS,
        Provider.of<Paymenthelper>(context, listen: false)
            .handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        Provider.of<Paymenthelper>(context, listen: false).handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET,
        Provider.of<Paymenthelper>(context, listen: false)
            .handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  Future checkMeOut(double amount) async {
    var options = {
      'key': 'rzp_test_sX9byr8MEVDj4G',
      'amount': amount * 100,
      //'name': Provider.of<Authentication>(context, listen: false).getUserEmail,
      'descrption': 'payment',
      'profile': {
        'contact': '1234567890',
        //'email':
        //     Provider.of<Authentication>(context, listen: false).getUserEmail,
      },
      'external': {
        'wallet': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: deprecated_member_use

  Widget buildOrders({Map order}) {
    final cart = Provider.of<Cart>(context);

    // _ref = FirebaseDatabase.instance
    //     .reference()
    //     .child("order_history")
    //     .child("sumyak")
    //     .child("orders");

    // ignore: deprecated_member_use

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 5, right: 5, top: 20),
      height: 300,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: deprecated_member_use

          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.bookmark,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                order['id'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
              SizedBox(width: 25),
              Icon(
                Icons.payment_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Total Bill: " + order['amount'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.fastfood,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Items",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          for (int i = 0; i < order['length']; i++)
            Flexible(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                //  spacing: 20, // gap between adjacent chips
                //   runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.teal, child: Text('$i')),
                    label: Text(
                      order['products'][i]['title'].toString() +
                          "  ×  " +
                          order['products'][i]['quantity'].toString() +
                          "  = " +
                          order['products'][i]['price'].toString(),

                      //   "hello",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    backgroundColor: Colors.grey[350],
                    elevation: 2.0,
                  ),
                ],
              ),
            ),
          SizedBox(height: 10),
          Center(
            // ignore: deprecated_member_use
            child: RaisedButton(
              child: Text('Re Order'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.teal[300],
              onPressed: () async {
                await checkMeOut(double.parse(order['amount']));

                // final response = await http.put(
                //     Uri.parse(
                //       'https://e-food-app-b686a-default-rtdb.firebaseio.com/StudentDetails/' +
                //           "gaurav" +
                //           '/orders.json',
                //     ),
                //     body: json.encode({
                //       'amount': "Rs. " + order['amount'].toString(),
                //       'dateTime': DateTime.now().toIso8601String(),
                //       'products': {
                //         // 'id': cp.id.toString(),
                //         'title': order['products']['title'].toString(),
                //         'quantity': order['products']['quantity'].toString(),
                //         'price': order['products']['price'].toString()
                //       }
                //     }));
              },
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user_name = Provider.of<Name>(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order History",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[300],
      ),
      drawer: MenuDrawer(),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref = FirebaseDatabase.instance
              .reference()
              .child("order_history")
              .child(user_name.names)
              .child("orders"),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final Map<dynamic, dynamic> order = snapshot.value;
            order['key'] = snapshot.key;
            List item = order['products'];
            //  String item1 = order['products'][0]['title'].toString();
            //  print(item1);
            print(item);
            print(order);
            order['length'] = item.length;
            order['item'] = item;

            return buildOrders(order: order);
          },
        ),
      ),
    );
  }
}
