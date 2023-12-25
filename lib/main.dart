// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie/data/state_data.dart';
import 'package:movie/screen/circle_screen.dart';
import 'package:movie/screen/home.dart';
import 'package:movie/screen/home_screen.dart';
import 'package:movie/screen/library_screen.dart';
import 'package:movie/screen/message_screen.dart';
import 'package:movie/screen/movie_detail_screen.dart';
import 'package:movie/screen/profile_screen.dart';
import 'package:movie/screen/search_result.dart';
import 'package:movie/utilities/category_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoryList(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StateData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1A1A1A),
          appBarTheme: AppBarTheme(
            // backgroundColor: Color(0xFF1A1A1A),
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          HomeScreen.id: (context) => HomeScreen(),
          CircleScreen.id: (context) => CircleScreen(),
          LibraryScreen.id: (context) => LibraryScreen(),
          MessageScreen.id: (context) => MessageScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          MovieDetailScreen.id: (context) => MovieDetailScreen(),
          SearchResult.id: (context) => SearchResult(),
        },
      ),
    );
  }
}
