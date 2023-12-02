import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context)=> HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        primaryColor: Color.fromARGB(255, 57, 165, 82),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 57, 165, 82),
        )
      ),
    );
  }
}
