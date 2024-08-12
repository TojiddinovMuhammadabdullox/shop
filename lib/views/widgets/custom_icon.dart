import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white.withOpacity(0.5),
          size: 30,
        ),
      ),
    );
  }
}
