import 'package:flutter/material.dart';
import 'package:movie/screen/home.dart';
import 'package:movie/utilities/category_list.dart';
import 'package:provider/provider.dart';
import '../components/app_title.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_bar.dart';
import '../widgets/movie_bar.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> list = [
    const MovieBar(
      cardTitle: "Latest Releases",
      searchId: 'now_playing',
    ),
    const MovieBar(
      cardTitle: "Coming Soon",
      searchId: 'upcoming',
    ),
    const MovieBar(
      cardTitle: "Popular",
      searchId: 'popular',
    ),
    const MovieBar(
      cardTitle: "Top Rated",
      searchId: 'top_rated',
    ),
  ];
  void updateCategory() {
    list = [];

    list.add(MovieBar(
      cardTitle: Provider.of<CategoryList>(context).title,
      searchId: Provider.of<CategoryList>(context).searchId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Provider.of<CategoryList>(context).categoryCount,
      initialIndex: Provider.of<CategoryList>(context).active,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTitle(
              titleText: 'Browse',
              titleIcon: Icons.notifications_none_outlined,
            ),
            const Searchbar(
              hintText: 'Search by Name,Genre or Award',
            ),
            const SizedBox(
              height: 5.0,
            ),
            CategoryBar(
              updateList: updateCategory,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 7,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 110.0),
                      children: Provider.of<CategoryList>(context).activeList,
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 110.0),
                      children: [
                        Provider.of<CategoryList>(context).activeList[0]
                      ],
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: ListView(
                        padding: const EdgeInsets.only(bottom: 110.0),
                        children: [
                          Provider.of<CategoryList>(context).activeList[1]
                        ]),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: ListView(
                        padding: const EdgeInsets.only(bottom: 110.0),
                        children: [
                          Provider.of<CategoryList>(context).activeList[2]
                        ]),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: ListView(
                        padding: const EdgeInsets.only(bottom: 110.0),
                        children: [
                          Provider.of<CategoryList>(context).activeList[3]
                        ]),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 7,
            //   child: RefreshIndicator(
            //     onRefresh: () async {
            //       Navigator.pop(context);
            //       Navigator.pushNamed(context, Home.id);
            //     },
            //     child: ListView(
            //       padding: EdgeInsets.only(bottom: 110.0),
            //       children: Provider.of<CategoryList>(context).activeList,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
//
// class ListMaker extends StatefulWidget {
//   const ListMaker({super.key});
//
//   @override
//   State<ListMaker> createState() => _ListMakerState();
// }
//
// class _ListMakerState extends State<ListMaker> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.only(bottom: 110.0),
//       children: Provider.of<CategoryList>(context).activeList,
//     );
//   }
// }
