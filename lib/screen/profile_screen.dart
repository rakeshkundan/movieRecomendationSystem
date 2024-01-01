// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/constants.dart';
import 'package:movie/data/profile_data.dart';
import 'package:movie/models/database.dart';
import 'package:movie/screen/profile_detail_screen.dart';
import 'package:movie/data/app_title.dart';
import 'package:movie/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTitle(
                  titleText: 'Profile',
                  titleIcon: Icons.person,
                  onIconPress: () {
                    Navigator.pushNamed(context, ProfileDetailScreen.id);
                  },
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileDetailScreen.id);
                      },
                      child: CircleAvatar(
                        backgroundColor: kInactiveTextColor,
                        radius: 40,
                        child: Text(
                          Provider.of<ProfileData>(context).name![0],
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${Provider.of<ProfileData>(context).name}',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProfileDetailScreen.id);
                            },
                            child: Text(
                              'View Profile',
                              style: TextStyle(color: kIconColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      RowItem(
                        icon: Icons.electric_bolt_outlined,
                        text: 'What\'s new',
                        onPress: () {},
                      ),
                      RowItem(
                        icon: Icons.history_sharp,
                        text: 'Listening history',
                        onPress: () {},
                      ),
                      RowItem(
                        icon: Icons.settings_outlined,
                        text: 'Settings and privacy',
                        onPress: () {},
                      ),
                      RowItem(
                        icon: Icons.logout,
                        text: 'Logout',
                        onPress: () async {
                          DatabaseHelper dbHelp = DatabaseHelper.instance;
                          bool flag = await dbHelp.deleteDb();
                          // var id = await dbHelp.deleteUser(
                          //     Provider.of<ProfileData>(context, listen: false).profile['Phone']!);
                          if (flag) {
                            if (!context.mounted) return;
                            Provider.of<ProfileData>(context, listen: false)
                                .setIsProfileSet(false);

                            if (!context.mounted) return;
                            Navigator.popUntil(context, (route) => false);
                            Navigator.pushNamed(context, ProfileScreen.id);
                          } else {
                            if (!context.mounted) return;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error!!'),
                                    content: Text(
                                        'Some Unexpexted Error.Please restart the app.'),
                                    actions: [
                                      RawMaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('ok'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                      )
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
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;
  const RowItem(
      {super.key,
      this.text = 'text',
      this.icon = Icons.rectangle_outlined,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
