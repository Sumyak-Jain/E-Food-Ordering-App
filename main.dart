import 'package:flutter/material.dart';
// import 'package:food_app/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      home: Welcome1(),
    );
  }
}

class Welcome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: 'E Food Ordering',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 50),
            Image.asset('assets/images/food1.png'),
            SizedBox(height: 50),
            RaisedButton(onPressed: null,child: Text('Welcome'), padding: EdgeInsets.all(20),color: Colors.teal[400],)
          ],
        ),
      ),
    );
  }
}
