import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'foodapp',
      home: Loginpage(),
    );
  }
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Vendor Login',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email ID",
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.teal),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(children: <Widget>[
              ButtonTheme(
                height: 50,
                //disabledColor: Colors.teal,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: null,
                child: Text(
                  'New user? Sign in',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
