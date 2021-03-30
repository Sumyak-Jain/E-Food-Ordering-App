import 'package:flutter/material.dart';
import 'package:foodApp3/commons.dart';
import 'package:foodApp3/providers/cart.dart';
import 'package:foodApp3/widgets/bottomNavigation.dart';
import 'package:foodApp3/widgets/title.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

// class CartScreen extends StatefulWidget {
//   static const routeName = '/cart';

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

//class _CartScreenState extends State<CartScreen> {
//   Razorpay razorpay;
//   TextEditingController textEditingController = new TextEditingController();
//   @override
//   void initState() {
//     super.initState();

//     razorpay = new Razorpay();

//     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
//     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
//     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     razorpay.clear();
//   }

//   void openCheckout(double amount) {
//     var options = {
//       "key": "rzp_test_kxRtAi6n0rqAZL",
//       "amount": amount * 100,
//       "name": "Shop Name",
//       // "description": "Payment for the some random product",
//       "prefill": {"contact": "2323232323", "email": "shdjsdh@gmail.com"},
//       "external": {
//         "wallets": ["paytm"]
//       }
//     };

//     try {
//       razorpay.open(options);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// //String id, String title, int quantity, double price, double amount
//   void handlerPaymentSuccess() {
//     print("Payment success");
//     Toast.show("Payment success", context);
// String id1 = id;
// String title1 = title;
// String quan = quantity.toString();
// String price1 = price.toString();
// String amt = amount.toString();
// Map<String, String> cartDetails = {
//   'id': id1,
//   'title': title1,
//   'quantity': quan,
//   'price': price1,
//   'amount': amt,
// };
// if (id1.isEmpty || title1.isEmpty || quan.isEmpty || price1.isEmpty) {
//   Toast.show("Empty", context);
// } else {
//   Toast.show("Not Empty", context);
// }
//}

// void handlerErrorFailure() {
//   print("Pament error");
//   Toast.show("Pament error", context);
// }

// void handlerExternalWallet() {
//   print("External Wallet");
//   Toast.show("External Wallet", context);
// }
class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double amount = cart.totalAmount;
    // String id1=cart.items[1].id;
    // String title=cart.items[1].title;
    // int quantity=cart.items[1].quantity;
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
                    onPressed: () {
                      //openCheckout(amount);
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
              ),
            ),
          ),
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
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     'Search',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
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
