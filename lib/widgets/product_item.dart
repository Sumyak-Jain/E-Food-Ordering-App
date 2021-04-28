import 'package:flutter/material.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/providers/product.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/widgets/title.dart';
import 'package:provider/provider.dart';

import '../commons.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;

  // const ProductItem({
  //   this.id,
  //   this.title,
  //   this.price,
  // });
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        height: 80,
        child: Card(
          elevation: 10,
          color: Colors.teal[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Spacer(),
                    Center(
                      child: Container(
                        width: 50,
                        child: CustomText(
                          text: "₹" + product.price.toString(),
                          size: 16,
                          color: white,
                          weight: FontWeight.bold,
                          align: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      child: FloatingActionButton(
                        heroTag: null,
                        elevation: 10,
                        backgroundColor: Colors.white,
                        onPressed: () {
                          cart.removeOne(product.id, product.price,
                              product.title, product.quantity);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.teal[300],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      child: FloatingActionButton(
                        heroTag: null,
                        elevation: 10,
                        backgroundColor: Colors.white,
                        onPressed: () {
                          cart.addItem(
                              product.id, product.price, product.title);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.teal[300],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
