import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/commons.dart';
import 'package:food_app/vendor_drawer.dart';
import 'VendorSignup.dart';
import 'BottomNavigation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OrdersReady extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}
//final DatabaseReference _ref2 =
//    FirebaseDatabase.instance.reference().child("Order ID");

class _OrderState extends State<OrdersReady> {
  Query _ref;
  final DatabaseReference _ref2 =
      FirebaseDatabase.instance.reference().child("StudentDetails");

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    _ref = FirebaseDatabase.instance.reference().child("StudentDetails");

    // .orderByChild('shop name');
  }

  // ignore: deprecated_member_use

  Widget buildOrders({Map order}) {
    // ignore: deprecated_member_use

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 450,
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
                order['name'],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.teal),
              ),

              SizedBox(width: 20),
              // ignore: deprecated_member_use
              Expanded(
                child: Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      //  print(order['number']);
                      //  print(recipents);
                      recipents.add(order['number']);
                      print(recipents);
                      _sendSMS(
                          "Dear, " +
                              order['name'] +
                              "\nSAP ID - " +
                              order['email'] +
                              "\nPlease Pickup! Your order is ready \nThank You \nE-Food Ordering App Team",
                          recipents);
                      recipents.clear();
                      print(recipents);
                    },
                    color: Colors.teal[300],
                    elevation: 6.0,
                    splashColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('Order Ready',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      recipents.add(order['number']);
                      print(recipents);
                      _sendSMS(
                          "Dear, " +
                              order['name'] +
                              "\nSAP ID - " +
                              order['email'] +
                              "\nYour estimated order ready time is 10 mins",
                          recipents);
                      recipents.clear();
                      print(recipents);
                    },
                    color: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('10 mins',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      recipents.add(order['number']);
                      print(recipents);
                      _sendSMS(
                          "Dear, " +
                              order['name'] +
                              "\nSAP ID - " +
                              order['email'] +
                              "\nYour estimated order ready time is 20 mins",
                          recipents);
                      recipents.clear();
                      print(recipents);
                    },
                    color: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('20 mins',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Center(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      recipents.add(order['number']);
                      print(recipents);
                      _sendSMS(
                          "Dear, " +
                              order['name'] +
                              "\nSAP ID - " +
                              order['email'] +
                              "\nYour estimated order ready time is 30 mins",
                          recipents);
                      recipents.clear();
                      print(recipents);
                    },
                    color: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('30 mins',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
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
                order['email'],
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
              SizedBox(width: 15),
              Icon(
                Icons.payment_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Total Bill: " + order['orders']['amount'],
                style: TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, color: Colors.teal),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(children: [
            Icon(
              Icons.fastfood,
              color: Colors.teal,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Items:",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.teal),
            ),
          ]),
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
                      order['orders']['products'][i]['title'].toString() +
                          "  ×  " +
                          order['orders']['products'][i]['quantity']
                              .toString() +
                          "  = " +
                          order['orders']['products'][i]['price'].toString(),

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
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              SizedBox(width: 145),
              new Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[350],
                ),
                // border: Border.all(width: 4, color: Colors.white)),
                child: new IconButton(
                  color: Colors.red,
                  iconSize: 40,
                  icon: new Icon(Icons.delete_sharp),
                  onPressed: () {
                    print("delete");
                    showDeleteDialog(order: order);
                    // buildOrders(order: order);
                  },
                ),
              )
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
        title: Text(
          "Orders",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[300],
      ),
      drawer: VendorDrawer(),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final Map<dynamic, dynamic> order = snapshot.value;
            order['key'] = snapshot.key;
            List item = order['orders']['products'];
            // String item = order['orders']['products'][0].toString();
            print(item);
            print(order);
            order['length'] = item.length;
            order['item'] = item;
            //  for (int i = 0; i < order['length']; i++) {
            //  print(order['orders']['products'][i]);
            //  }
            return buildOrders(order: order);
          },
        ),
      ),
    );
  }

  showDeleteDialog({Map order}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete  ${order['email']}'),
            content: Text("Are you sure you want to delete?"),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  _ref2
                      .child(order['key'])
                      .remove()
                      .whenComplete(() => Navigator.pop(context));
                },
                child: Text('Delete'),
              )
            ],
          );
        });
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
