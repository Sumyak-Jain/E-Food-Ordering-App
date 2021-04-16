import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:payment/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: "Rajma Chawal ",
      price: 60,
    ),
    Product(
      id: 'p2',
      title: "Chole Bhature",
      price: 50,
    ),
    Product(
      id: 'p3',
      title: "Fried Rice",
      price: 40,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
