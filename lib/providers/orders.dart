import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/providers/Name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './cart.dart';
import 'package:food_app/SignupStudent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  int i = 0;

  List<OrderItem> get orders {
    return [..._orders];
  }

  final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child("StudentDetails");
  Future<void> addOrders(
      List<CartItem> cartProducts, double total, String name) async {
    final timeStamp = DateTime.now();
    print("ordersss");
    print(name);
    try {
      final response = await http.put(
          Uri.parse(
            'https://e-food-app-b686a-default-rtdb.firebaseio.com/StudentDetails/' +
                name +
                '/orders.json',
          ),
          body: json.encode({
            'amount': "Rs. " + total.toString(),
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      // 'id': cp.id.toString(),
                      'title': cp.title.toString(),
                      'quantity': cp.quantity.toString(),
                      'price': "Rs. " + cp.price.toString()
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              amount: total,
              dateTime: timeStamp,
              products: cartProducts));
      notifyListeners();
    } catch (err) {
      throw err;
    }
    try {
      i = i + 1;
      final response = await http.post(
          Uri.parse(
            'https://e-food-app-b686a-default-rtdb.firebaseio.com/order_history/' +
                name +
                '/orders.json',
          ),
          body: json.encode({
            'id': "order no. " + i.toString(),
            'amount': "Rs. " + total.toString(),
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      // 'id': cp.id.toString(),
                      'title': cp.title.toString(),
                      'quantity': cp.quantity.toString(),
                      'price': "Rs. " + cp.price.toString()
                    })
                .toList(),
          }));

      _orders.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              amount: total,
              dateTime: timeStamp,
              products: cartProducts));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
