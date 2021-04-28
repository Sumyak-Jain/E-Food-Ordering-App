import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/drawer.dart';
import 'package:food_app/screens/products_overview_screen.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Center(
          widthFactor: 4,
          child: Text(
            "Menu",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 280,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/food.png",
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/burger.png",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 180,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(
                        "FOOD",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.teal[300],
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductOverviewScreen()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/drinks.png",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 180,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(
                        "BEVERAGES",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.teal[300],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              /*   SizedBox(
                height: 25,
                
           */
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/cake.png",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 180,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(
                        "DESERTS",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.teal[300],
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
