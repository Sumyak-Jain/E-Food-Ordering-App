import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;
  // final int quantity;
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    this.quantity,
  });
}
