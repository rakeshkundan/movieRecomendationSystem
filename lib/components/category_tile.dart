// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class CategoryTile extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPress;
  const CategoryTile(
      {super.key,
      this.text = "Category",
      this.isActive = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: kIconColor)
            : Border.all(
                color: Color(0x00000000),
              ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          minimumSize: Size(0, 0),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
