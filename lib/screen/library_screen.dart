import 'package:flutter/material.dart';
import 'package:movie/components/app_title.dart';
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
<<<<<<< HEAD
            onIconPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xFF1A1A1A),
                    title: const Text(
                      'Add new Library',
                      textAlign: TextAlign.center,
                    ),
                    content: const TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: 'Create New Library',
                      ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 7.0),
                          child: const Text(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 7.0),
                          decoration: BoxDecoration(
                            color: kInactiveTextColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
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
=======
>>>>>>> parent of 27dbbe5 (added Dialog in library)
          ),
          const Searchbar(
            hintText: 'Search for movie',
          ),
          const Text('This page is Empty')
        ],
      ),
    );
  }
}
