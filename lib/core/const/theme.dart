import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xff4E98E9),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff4E98E9),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.grey.shade700,
      dividerColor: Colors.black,
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
    ),
    primaryColor: const Color(0xff4E98E9),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff4E98E9),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.black,
      dividerColor: Colors.white,
    ),
  );
}
