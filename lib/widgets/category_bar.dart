<<<<<<< HEAD
=======
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

>>>>>>> parent of 27dbbe5 (added Dialog in library)
import 'package:flutter/material.dart';
import 'package:movie/constants.dart';
import 'package:movie/utilities/category.dart';
import 'package:provider/provider.dart';
import 'package:movie/utilities/category_list.dart';

class CategoryBar extends StatelessWidget {
  final VoidCallback updateList;
  const CategoryBar({super.key, required this.updateList});

  List<Widget> catListGenerator(
      List<Category> activeList, BuildContext context) {
    List<Widget> catList = [];
    for (int i = 0; i < activeList.length; i++) {
      catList.add(
        Tab(
          height: 35,
          iconMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Text(
              activeList[i].text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return catList;
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      onTap: (x) {
        Provider.of<CategoryList>(context, listen: false).setActive(x);
      },
      indicator: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(width: 1.0, color: kIconColor),
      ),
      padding: const EdgeInsets.only(left: 20),
      // indicatorPadding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      // indicatorColor: Colors.transparent,
      isScrollable: true,
      tabs: catListGenerator(
          Provider.of<CategoryList>(context).category, context),
    );

    /// This was previous implementation👇

    // return Container(
    //   padding: EdgeInsets.only(left: 20.0),
    //   height: 35.0,
    //   child: Consumer<CategoryList>(
    //     builder: (context, data, child) {
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           var item = data.category[index];
    //           return CategoryTile(
    //             text: item.text,
    //             isActive: item.isChecked,
    //             onPress: () {
    //               Provider.of<CategoryList>(context, listen: false)
    //                   .setActive(index);
    //               Navigator.pop(context);
    //               Navigator.pushNamed(context, Home.id);
    //             },
    //           );
    //         },
    //         itemCount: CategoryList().categoryCount,
    //         scrollDirection: Axis.horizontal,
    //       );
    //     },
    //   ),
    // );
  }
}
