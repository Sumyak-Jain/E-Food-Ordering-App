import 'package:flutter/material.dart';
import 'package:foodApp3/commons.dart';
import 'package:foodApp3/providers/cart.dart';
import 'package:foodApp3/widgets/badge.dart';
import 'package:foodApp3/widgets/bottomNavigation.dart';

import 'package:foodApp3/widgets/product_grid.dart';
import 'package:foodApp3/widgets/product_item.dart';
import 'package:foodApp3/widgets/title.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            text: "FOOD MENU",
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
      body: ProductGrid(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.teal[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     'Search',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            title: Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTap,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
      ),
    );
  }
}
