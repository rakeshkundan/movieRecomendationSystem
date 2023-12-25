// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/constants.dart';
import 'package:movie/widgets/app_title.dart';
import 'package:movie/widgets/bottom_nav_bar.dart';

class MessageScreen extends StatelessWidget {
  static String id = 'message_screen';
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                AppTitle(
                  titleText: 'Messages',
                  titleIcon: Icons.mail_outline,
                ),
                SpinKitRing(color: kIconColor)
              ],
            ),
            Positioned(
              bottom: 25.0,
              left: 0.0,
              right: 0.0,
              child: BottomNavBar(),
            )
          ],
        ),
      ),
    );
  }
}
