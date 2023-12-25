// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/widgets/app_title.dart';
import 'package:movie/widgets/search_bar.dart';
import 'package:movie/widgets/bottom_nav_bar.dart';

class CircleScreen extends StatelessWidget {
  static String id = 'circle_screen';
  const CircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTitle(
                    titleText: 'Circles',
                    titleIcon: FontAwesomeIcons.userPlus,
                  ),
                  Searchbar(
                    hintText: 'Search for Friends by Name',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
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
        ));
  }
}
