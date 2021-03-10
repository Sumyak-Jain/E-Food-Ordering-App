import 'package:flutter/material.dart';
import 'Orders.dart';

class VendorOrder extends StatefulWidget {
  @override
  _VendorOrderState createState() => _VendorOrderState();
}

class _VendorOrderState extends State<VendorOrder> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Vendor"),
          backgroundColor: Colors.teal[300],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 170.0),
                      Container(
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.teal[300],
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Orders()),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Orders',
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
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  'Edit Menu',
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
            ]));
  }
}
