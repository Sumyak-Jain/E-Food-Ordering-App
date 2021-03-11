import 'package:flutter/material.dart';
import 'package:foodapp2/widgets/title.dart';

import '../commons.dart';

class BottomNavIcon extends StatelessWidget {
  final Icon icon;
  final String name;
  final Function onTap;
  BottomNavIcon({this.icon, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: [
            IconButton(
              icon: icon,
              onPressed: () {},
              color: white,
              iconSize: 22,
            ),
            // SizedBox(
            //   height: 0.2,
            // ),
            CustomText(
              text: name,
              size: 10.5,
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}
