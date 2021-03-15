import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/VendorOrder.dart';
import 'package:food_app/VendorSignup.dart';
import 'package:food_app/homepage.dart';
import 'package:food_app/splashscreen.dart';
import 'package:food_app/startpage.dart';

import 'BottomNavigation.dart';
import 'SignupStudent.dart';
import 'VendorOrder.dart';
import 'Orders.dart';
import 'splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      home: startpage(),
    );
  }
}
