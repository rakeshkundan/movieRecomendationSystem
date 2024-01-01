// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie/data/app_title.dart';
import 'package:movie/screen/chat_screen.dart';
import 'package:movie/widgets/bottom_nav_bar.dart';

class MessageScreen extends StatelessWidget {
  static String id = 'message_screen';

  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    // print(arguments['data']);
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
                Expanded(
                    child: ListView.builder(
                  itemCount: arguments['data'].length,
                  itemBuilder: (context, index) {
                    var data = arguments['data'][index];
                    return ContactTile(
                      name: data['cname'],
                      lastMessage: data['lmessage'],
                      unreadCount: data['unreadCount'],
                      number: data['cnum'],
                    );
                  },
                )),
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

class ContactTile extends StatelessWidget {
  final String name;
  final int unreadCount;
  final String lastMessage;
  final String number;
  const ContactTile(
      {super.key,
      this.name = '',
      this.lastMessage = '',
      this.unreadCount = 0,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.id);
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastMessage,
                        style: TextStyle(
                          color: Color(0xff39c4a6),
                        ),
                      ),
                      (unreadCount > 0)
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Text(
                                '$unreadCount',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
