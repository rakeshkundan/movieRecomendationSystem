import 'package:flutter/material.dart';
import 'package:movie/data/contact_detail.dart';
import 'package:movie/data/profile_data.dart';
import 'package:movie/data/state_data.dart';
import 'package:movie/screen/chat_screen.dart';
import 'package:movie/screen/circle_screen.dart';
import 'package:movie/screen/home.dart';
import 'package:movie/screen/home_screen.dart';
import 'package:movie/screen/library_screen.dart';
import 'package:movie/screen/loading_screen.dart';
import 'package:movie/screen/message_screen.dart';
import 'package:movie/screen/movie_detail_screen.dart';
import 'package:movie/screen/profile_detail_screen.dart';
import 'package:movie/screen/profile_screen.dart';
import 'package:movie/screen/search_result.dart';
import 'package:movie/services/session.dart';
import 'package:movie/utilities/category_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        ChangeNotifierProvider(
          create: (BuildContext context) => ProfileData(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ContactDetail(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Session(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF1A1A1A),
          appBarTheme: const AppBarTheme(
            // backgroundColor: Color(0xFF1A1A1A),
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => const Home(),
          HomeScreen.id: (context) => const HomeScreen(),
          CircleScreen.id: (context) => CircleScreen(),
          LibraryScreen.id: (context) => const LibraryScreen(),
          MessageScreen.id: (context) => const MessageScreen(),
          ChatScreen.id: (context) => const ChatScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          ProfileDetailScreen.id: (context) => const ProfileDetailScreen(),
          MovieDetailScreen.id: (context) => const MovieDetailScreen(),
          SearchResult.id: (context) => SearchResult(),
          LoadingScreen.id: (context) => const LoadingScreen(),
        },
      ),
    );
  }
}
