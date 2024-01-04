// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie/components/app_title.dart';
import 'package:movie/constants.dart';
import 'package:movie/widgets/search_bar.dart';

class LibraryScreen extends StatelessWidget {
  static String id = 'library_screen';
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AppTitle(
            titleText: 'Library',
            titleIcon: Icons.add,
            onIconPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Add new Library',
                      textAlign: TextAlign.center,
                    ),
                    content: TextField(
                      minLines: 1,
                      maxLines: 2,
                      maxLength: 20,
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      RawMaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kInactiveTextColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 7.0),
                          child: Text(
                            'Cancel',
                            style: kAlertButtonTextStyle,
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 7.0),
                          decoration: BoxDecoration(
                            color: kInactiveTextColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Add',
                            style: kAlertButtonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Searchbar(
            hintText: 'Search for movie',
          ),
          Text('This page is Empty')
        ],
      ),
    );
  }
}
