import 'package:flutter/material.dart';

import '../commons.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign align;
  CustomText(
      {this.color, this.size, @required this.text, this.weight, this.align});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? black,
      ),
      textAlign: align,
    );
  }
}
