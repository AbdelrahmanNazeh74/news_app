import 'package:flutter/material.dart';
import 'package:news_app/Screens/category_details.dart';
import 'package:news_app/Screens/home_screen.dart';
import 'package:news_app/Screens/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (context)=> SplashScreen(),
        HomeScreen.routeName : (context)=> HomeScreen(),
        CategoryDetails.routeName : (context)=> CategoryDetails()
      },
      initialRoute: CategoryDetails.routeName,
    );
  }
}
