// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String titleText;
  final IconData titleIcon;
  const AppTitle({
    super.key,
    this.titleText = 'Title',
    this.titleIcon = Icons.rectangle_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Icon(
            titleIcon,
            size: 25.0,
          ),
        ],
      ),
    );
  }
}
