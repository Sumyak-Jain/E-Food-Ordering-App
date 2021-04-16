import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payment/providers/cart.dart';
import 'package:payment/providers/orders.dart';
import 'package:payment/providers/payment.dart';
import 'package:payment/providers/product_provider.dart';
import 'package:payment/screens/cart_screen.dart';
import 'package:payment/screens/login.dart';
import 'package:payment/screens/products_overview_screen.dart';
import 'package:payment/screens/singup.dart';
import 'package:payment/screens/welcome.dart';
import 'package:provider/provider.dart';

import 'commons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(
          create: (ctx) => Paymenthelper(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
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
