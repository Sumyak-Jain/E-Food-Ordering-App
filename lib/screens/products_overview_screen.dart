import 'package:flutter/material.dart';
import 'package:food_app/Drawer.dart';
import 'package:food_app/commons.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/widgets/badge.dart';
import 'package:food_app/BottomNavigation.dart';

import 'package:food_app/widgets/product_grid.dart';
import 'package:food_app/widgets/product_item.dart';
import 'package:food_app/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:food_app/homepage.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/SignupStudent.dart';

import 'cart_screen.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  int selectedPage = 0;

  // final _pageOptions = [
  //   //ProductOverviewScreen(),
  //   ProductGrid(),
  //   // homepage(),
  //   StudentLogin(),
  //   SignupStudent()
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            text: "Food Menu",
            color: white,
            align: TextAlign.center,
            size: 20,
          ),
        ),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: MenuDrawer(),
      // body: Column(children: [
      //   ProductGrid(),
      //   _pageOptions[selectedPage],
      // ]),
      body: ProductGrid(),
    );
  }
}
