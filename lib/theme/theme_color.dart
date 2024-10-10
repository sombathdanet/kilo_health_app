import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
        secondary: const Color(0xff606060),
        seedColor: Colors.black,
        primaryContainer: const Color(0xff606060).withOpacity(0.5),
        onPrimaryContainer: const Color(0xffF9F6F4)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    cardColor: const Color(0xff222222),
    colorScheme: ColorScheme.fromSeed(
      secondary: Colors.white,
      seedColor: Colors.black,
      primaryContainer: const Color(0xff222222),
      onPrimaryContainer: const Color(0xff222222),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}
