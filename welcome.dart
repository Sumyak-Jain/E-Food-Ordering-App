import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        leading: IconButton(
          onPressed: null,
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
                    "assets/images/food.png",
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/burger.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 180,
                    height: 50,
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
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/drink.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 180,
                    height: 50,
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
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/deserts.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 180,
                    height: 50,
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
        backgroundColor: Colors.teal,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
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
