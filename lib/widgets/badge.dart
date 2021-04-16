import 'package:flutter/material.dart';
import 'package:payment/commons.dart';
import 'package:payment/widgets/title.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: CustomText(
              text: value,
              color: teal,
              size: 10,
              align: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
