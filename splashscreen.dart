import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/VendorOrder.dart';
import 'package:food_app/startpage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'VendorOrder.dart';
import 'StudentLogin.dart';

class splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new startpage(),
        title: new Text(
          'Welcome!',
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        image: new Image.asset('assets/splash.png'),
        backgroundColor: Colors.teal[300],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        loaderColor: Colors.white);
  }
}
