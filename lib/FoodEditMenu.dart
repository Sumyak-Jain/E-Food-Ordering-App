import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/vendor_drawer.dart';
import 'VendorSignup.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FoodEditMenu extends StatefulWidget {
  @override
  _FoodEditMenuState createState() => _FoodEditMenuState();
}

class _FoodEditMenuState extends State<FoodEditMenu> {
  TextEditingController _itemnamecontroller,
      _pricecontroller,
      _itemnamecontroller1,
      _pricecontroller1;
  bool isItemNameValid = true;
  bool isPriceValid = true;
  bool isItemNameValid1 = true;
  bool isPriceValid1 = true;

  RegExp regExp1 = new RegExp(
    //itemname
    r'^[a-zA-z]+([\s][a-zA-Z]+)*$',
  );

  RegExp regExp2 = new RegExp(
    //price
    r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$',
  );
  Query _ref;

  final DatabaseReference _ref2 =
      FirebaseDatabase.instance.reference().child("Food Items");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemnamecontroller = TextEditingController();
    _pricecontroller = TextEditingController();

    _itemnamecontroller1 = TextEditingController();
    _pricecontroller1 = TextEditingController();

    _ref = FirebaseDatabase.instance.reference().child("Food Items");
    // .orderByChild('shop name');
  }

  // ignore: deprecated_member_use

  Widget buildOrders({Map FoodMenu}) {
    // ignore: deprecated_member_use

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 180,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 6,
              ),
              Icon(
                Icons.fastfood,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Item Name:  " + FoodMenu['title'],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.teal[300],
                  fontWeight: FontWeight.bold,
                ),
              ),

              // ignore: deprecated_member_use
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 6,
              ),
              Icon(
                Icons.money_sharp,
                color: Colors.teal,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Price:  Rs." + FoodMenu['price'],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.teal[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              SizedBox(width: 60),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  showDeleteDialog(FoodMenu: FoodMenu);
                },
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Delete',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
              SizedBox(width: 50),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  edittMenu(FoodMenu: FoodMenu);
                },
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Edit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Food Menu", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[300],
      ),
      drawer: VendorDrawer(),
      body: Container(
        //  height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final Map FoodMenu = snapshot.value;
            FoodMenu['key'] = snapshot.key;

            return buildOrders(FoodMenu: FoodMenu);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  showDeleteDialog({Map FoodMenu}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${FoodMenu['title']}'),
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
                      .child(FoodMenu['key'])
                      .remove()
                      .whenComplete(() => Navigator.pop(context));
                },
                child: Text('Delete'),
              )
            ],
          );
        });
  }

  edittMenu({Map FoodMenu}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Edit Item',
                    style: TextStyle(
                      color: Colors.teal[300],
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            content: new Container(
              child: Column(
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: _itemnamecontroller,
                      onChanged: (value) {
                        if ((regExp1.hasMatch(value))) {
                          isItemNameValid = true;
                        } else {
                          isItemNameValid = false;
                        }
                        setState(() {});
                      },
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Item Name',
                          errorText: isItemNameValid ? null : "Invalid Name",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[300])),
                          hintText: '${FoodMenu['title']}'),
                    ),
                  ),
                  new Expanded(
                    child: new TextField(
                      controller: _pricecontroller,
                      onChanged: (value) {
                        if ((regExp2.hasMatch(value))) {
                          isPriceValid = true;
                        } else {
                          isPriceValid = false;
                        }
                        setState(() {});
                      },
                      autofocus: true,
                      decoration: new InputDecoration(
                          labelText: 'Item Price',
                          errorText: isPriceValid ? null : "Invalid Price",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[300])),
                          hintText: '${FoodMenu['price']}'),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  savechanges(FoodMenu: FoodMenu);
                },
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Save Changes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
              // ignore: deprecated_member_use
            ],
          );
        });
  }

  addItem() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Add Item',
                    style: TextStyle(
                      color: Colors.teal[300],
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            content: new Container(
              child: Column(
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      controller: _itemnamecontroller1,
                      onChanged: (value) {
                        if ((regExp1.hasMatch(value))) {
                          isItemNameValid1 = true;
                        } else {
                          isItemNameValid1 = false;
                        }
                        setState(() {});
                      },
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Item Name',
                        errorText: isItemNameValid1 ? null : "Invalid Name",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[300])),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new TextField(
                      controller: _pricecontroller1,
                      onChanged: (value) {
                        if ((regExp2.hasMatch(value))) {
                          isPriceValid1 = true;
                        } else {
                          isPriceValid1 = false;
                        }
                        setState(() {});
                      },
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Item Price',
                        errorText: isPriceValid1 ? null : "Invalid Price",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal[300])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  add_item();
                },
                color: Colors.teal[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Add Item',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
              // ignore: deprecated_member_use
            ],
          );
        });
  }

  void savechanges({Map FoodMenu}) {
    String item_name = _itemnamecontroller.text;
    String item_price = _pricecontroller.text;

    Map<String, String> changes = {
      'title': item_name,
      'price': item_price,
    };
    _ref2.child(FoodMenu['key']).update(changes).then((value) {
      Navigator.pop(context);
    });
  }

  void add_item() {
    String item_name = _itemnamecontroller1.text;
    String item_price = _pricecontroller1.text;

    Map<String, String> items = {
      'title': item_name,
      'price': item_price,
    };
    _ref2.push().set(items).then((value) {
      Navigator.pop(context);
    });
  }
}
