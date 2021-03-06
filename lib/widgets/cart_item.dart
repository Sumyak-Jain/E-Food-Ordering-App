import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  final double total;
  final String name;

  const CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
    this.total,
    this.name,
  });

  get order12 => null;

  // @override
  void add() {
    String id1 = this.id.toString();

    String title1 = this.title.toString();
    String quantity1 = this.quantity.toString();
    double price1 = this.quantity * (this.price);
    String totalp = total.toString();
    String total1 = price1.toString();
    final DatabaseReference _ref =
        FirebaseDatabase.instance.reference().child("Orders");

    final DatabaseReference _ref1 =
        FirebaseDatabase.instance.reference().child("Orders").child("order");

    Map<String, String> order = {
      'Item': title1 + "  Quantity:" + quantity1 + "  Total Price:" + total1,
    };
    Map<String, Object> finalorder = {
      // 'id': id1,
      'order': order,
      'total price': totalp,
    };
    ;
    _ref1.push().set(order);
  }

  @override
  Widget build(BuildContext context) {
    //  add();
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItems(productId);
      },
      child: Card(
        elevation: 15,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal[300],
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    'Rs $price',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(
              'Total :  \Rs${(price * quantity)}',
            ),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
