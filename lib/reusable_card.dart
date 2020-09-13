import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.myColor, this.cardChild, this.onPress});

  final Color myColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
//                      color: Color(0xFF1D1E33),
            color: myColor,
            borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
