import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:payment/commons.dart';
import 'package:payment/providers/authentication.dart';
import 'package:payment/providers/cart.dart';
import 'package:payment/providers/payment.dart';

import 'package:payment/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/orders.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child("OrderDetails");

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

  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double amount = cart.totalAmount;

    double price;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Your Cart',
          color: white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'Rs ${cart.totalAmount}',
                      style: TextStyle(
                          color:
                              // ignore: deprecated_member_use
                              Colors.white),
                    ),
                    backgroundColor: Colors.teal[300],
                  ),
                  FlatButton(
                    child: Text('Checkout'),
                    onPressed: () async {
                      print(cart.totalAmount);
                      await checkMeOut(amount);
                      await Provider.of<Orders>(context, listen: false)
                          .addOrders(
                              cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    textColor: Colors.teal[300],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].title,
                total: cart.totalAmount,
              ),
            ),
          ),
          // CheckoutButton(
          //   cart: cart,
          // ),
        ],
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
