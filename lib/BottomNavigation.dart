import 'package:flutter/material.dart';
import 'package:food_app/SignupStudent.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/homepage.dart';

/*class BottomNavigation extends StatefulWidget {
  final Widget home;

  const BottomNavigation({Key key, this.home}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
 
  int _selectedIndex=0;
  static List<Widget> _widgetOptions = <Widget>[
  
    homepage(),
    StudentLogin(),
    homepage(),
  ];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.teal[300],
          items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: onTap,
        ));
  }
}*/

class BottomNavigation extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<BottomNavigation> {
  int selectedPage = 0;

  final _pageOptions = [homepage(), StudentLogin(), SignupStudent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 20),
                // ignore: deprecated_member_use
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 20),
                // ignore: deprecated_member_use
                title: Text('History')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 20),
                // ignore: deprecated_member_use
                title: Text('Profile')),
          ],
          selectedItemColor: Colors.white,
          elevation: 5.0,
          unselectedItemColor: Colors.grey[800],
          currentIndex: selectedPage,
          backgroundColor: Colors.teal[300],
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
