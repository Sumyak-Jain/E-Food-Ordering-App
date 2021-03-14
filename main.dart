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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Login"),
        backgroundColor: Colors.teal[300],
      ),
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
                Text('Hello!',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.teal,
                    ))
              ],
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal))),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.teal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'New user? Register',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ])),
    );
  }
}
