import 'package:flutter/material.dart';
import 'package:foodApp3/commons.dart';
import 'package:foodApp3/providers/cart.dart';
import 'package:foodApp3/providers/product_provider.dart';
import 'package:foodApp3/screens/cart_screen.dart';
import 'package:foodApp3/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Food App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal[300],
          accentColor: white,
        ),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
        },
        home: ProductOverviewScreen(),
      ),
    );
  }
}
