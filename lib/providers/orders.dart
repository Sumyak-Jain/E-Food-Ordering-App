import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './cart.dart';
import 'package:flutter/material.dart';

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

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    //final url = 'https://e-food-366d1-default-rtdb.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(
          Uri.parse(
            'https://e-food-366d1-default-rtdb.firebaseio.com/orders.json',
          ),
          body: json.encode({
            'id': DateTime.now().toString(),
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.title,
                      'quantity': cp.quantity,
                      'price': cp.price
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
