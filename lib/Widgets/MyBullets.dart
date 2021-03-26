import 'package:flutter/material.dart';

class MyBullets extends StatelessWidget {
  final Color color;
  MyBullets({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}
