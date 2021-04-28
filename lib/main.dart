import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/EditMenu.dart';
import 'package:food_app/FoodEditMenu.dart';
import 'package:food_app/Forgot_pwd.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/Student_history.dart';
import 'package:food_app/VendorLogin.dart';
import 'package:food_app/VendorOrder.dart';
import 'package:food_app/VendorSignup.dart';
import 'package:food_app/commons.dart';
import 'package:food_app/homepage.dart';
import 'package:food_app/providers/cart.dart';
import 'package:food_app/providers/Name.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/vendor_name.dart';
import 'package:food_app/screens/cart_screen.dart';
import 'package:food_app/screens/products_overview_screen.dart';

import 'package:food_app/splashscreen.dart';
import 'package:food_app/startpage.dart';
import 'package:provider/provider.dart';
import 'package:food_app/providers/payment.dart';
import 'package:food_app/providers/orders.dart';
import 'package:splashscreen/splashscreen.dart';
import 'BottomNavigation.dart';
import 'SignupStudent.dart';
import 'VendorOrder.dart';
import 'OrdersReady.dart';
import 'splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  /* Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      home: Forgot_pwd(),
    );
  }*/
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
          create: (ctx) => Name(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => VendorName(),
        ),
      ],
      child: MaterialApp(
        title: 'Food App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.teal[300],
            accentColor: white,
            appBarTheme:
                AppBarTheme(titleTextStyle: TextStyle(color: Colors.white))),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
        },
        //  home: ProductOverviewScreen(),
        home: splashscreen(),
      ),
    );
  }
}
