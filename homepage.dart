import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentLogin()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          widthFactor: 4.5,
          child: Text(
            "Menu",
            textAlign: TextAlign.center,
          ),
        ),
      ),
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
                      onPressed: () {},
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTap,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
      ),
    );
  }
}
