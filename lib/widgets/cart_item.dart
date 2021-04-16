import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:payment/providers/cart.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  final double total;

  const CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
    this.total,
  });
  // void add() {
  //   String id1 = this.id.toString();

  //   String title1 = this.title.toString();
  //   String quantity1 = this.quantity.toString();
  //   double price1 = this.quantity * (this.price);
  //   String totalp = total.toString();
  //   String total1 = price1.toString();
  //   final DatabaseReference _ref =
  //       FirebaseDatabase.instance.reference().child("Orders");

  //   // final DatabaseReference _ref1 =
  //   //     FirebaseDatabase.instance.reference().child("Orders").child("order");

  //   Map<String, String> order = {
  //     'Item': title1 + "  Quantity:" + quantity1 + "  Total Price:" + total1,
  //   };
  //   Map<String, Object> finalorder = {
  //     // 'id': id1,
  //     'order': order,
  //     'total price': totalp,
  //   };
  //   ;
  //   _ref.push().set(finalorder);
  // }

  @override
  Widget build(BuildContext context) {
    // String id1 = this.total.toString();
    // String title1 = this.title.toString();
    // final Map<String, String> order = {
    //   'id': id1,
    //   'title': title1,
    // };
    //

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
      child: Column(
        children: [
          Card(
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
          //RaisedButton(onPressed: add),
        ],
      ),
    );
  }
}
