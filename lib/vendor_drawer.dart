import 'package:flutter/material.dart';
import 'package:food_app/StudentLogin.dart';
import 'package:food_app/VendorOrder.dart';
import 'package:food_app/providers/vendor_name.dart';
import 'package:food_app/startpage.dart';
import 'package:provider/provider.dart';
import 'VendorLogin.dart';

class VendorDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<VendorName>(context);
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 135,
                  height: 135,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/Avator.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  "Welcome! " + user.names,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            //   Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VendorOrder()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => startpage()),
            );
          },
        )
      ],
    ));
  }
}
