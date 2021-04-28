import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/VendorOrder.dart';
import 'package:food_app/vendor_drawer.dart';

import 'FoodEditMenu.dart';

class EditMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Menu", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[300],
      ),
      drawer: VendorDrawer(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodEditMenu()),
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
