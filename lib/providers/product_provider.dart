import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

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
    Product(
      id: 'p4',
      title: "Pizza",
      price: 80,
    ),
    Product(
      id: 'p5',
      title: "Burger",
      price: 35,
    ),
    Product(
      id: 'p6',
      title: "Aloo Paratha",
      price: 40,
    ),
    Product(
      id: 'p7',
      title: "Paneer Paratha",
      price: 45,
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
