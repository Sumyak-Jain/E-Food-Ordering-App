import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

/*class NameItem {
  String name;
  NameItem({this.name});
}*/

class Name with ChangeNotifier {
  String name = "";

  String get names {
    print(name);
    print("get");
    return name;
  }

  /* List<NameItem> _orders = [];

  List<NameItem> get orders {
    return [..._orders];
  }*/

  void addName(String nameL) {
    name = nameL;
    //orders.add(NameItem(name: name));
    // orders.add(NameItem(name: nameL));
    print("hello0");
    print(name);
    // print(_orders);
    print("hello");
    //  print(orders);
    // names:
    //nameL;
    notifyListeners();
  }
}
