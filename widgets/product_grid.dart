import 'package:flutter/material.dart';
import 'package:foodApp3/providers/product.dart';

import 'package:foodApp3/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodApp3/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (c) => product[i],
        child: ProductItem(

            // price: product[i].price,
            // id: product[i].id,
            // title: product[i].title,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
