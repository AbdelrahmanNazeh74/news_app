import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimary = Color.fromARGB(255, 57, 165, 82);
  static Color darkPrimary = Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
      color: lightPrimary,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: lightPrimary,
    primaryColor: darkPrimary,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      color: darkPrimary,
    ),
  );
}
