import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/components/movie_tile.dart';
import 'package:movie/constants.dart';
import 'package:movie/services/networking.dart';
import 'package:movie/utilities/category_list.dart';
import 'package:provider/provider.dart';

class MoviesRow extends StatefulWidget {
  final NetworkHelper netHelp;
  final String catTitle;
  const MoviesRow(
      {super.key, required this.netHelp, this.catTitle = 'Coming Soon'});

  @override
  State<MoviesRow> createState() => _MoviesRowState();
}

class _MoviesRowState extends State<MoviesRow> {
  dynamic movieData;

  List<Widget> rowBuilder(var movieList) {
    List<Widget> newList = [];
    for (var movie in movieList) {
      try {
        newList.add(
          MovieTile(
            movieData: movie,
          ),
        );
      } catch (e) {
        // print(e);
      }
    }
    return newList;
  }

  List<Row> expandedBuilder(var movieList) {
    List<Row> newList = [];
    for (int i = 0; i < movieList.length; i++) {
      List<MovieTile> temp = [];
      while (i < movieList.length) {
        try {
          temp.add(
            MovieTile(
              movieData: movieList[i],
            ),
          );
        } catch (e) {
          // print(e);
        }

        if (temp.length == 3) break;
        i++;
      }
      if (temp.isNotEmpty) {
        newList.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: temp,
        ));
      }
    }
    return newList;
  }

  @override
  void initState() {
    super.initState();
    movieData = widget.netHelp.getData();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder(
        future: movieData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
          if (snapShot.hasData) {
            var data = snapShot.data;

            return !(Provider.of<CategoryList>(context)
                    .isSeeAll(widget.catTitle))
                ? SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rowBuilder(data['results']),
                    ),
                  )
                : Wrap(
                    children: rowBuilder(data['results']),
                  );
            //   SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child:
            //       Provider.of<CategoryList>(context).isSeeAll(widget.catTitle)
            //           ? Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: expandedBuilder(data['results']),
            //             )
            //           : Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: rowBuilder(data['results']),
            //             ),
            // );
          } else if (snapShot.hasError) {
            return const Text('Network Problem!');
          }

          return const SpinKitRing(
            color: kIconColor,
          );
        },
      );
    } catch (e) {
      return const Center(
        child: Text("Network Problem"),
      );
    }
  }
}
