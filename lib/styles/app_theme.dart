import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    primarySwatch: MaterialColor(
      0xFF8B4513, // Base color for light brown (SaddleBrown)
      {
        50: Color(0xFFF7E8DB),
        100: Color(0xFFEDD1B7),
        200: Color(0xFFE2B991),
        300: Color(0xFFD7A06B),
        400: Color(0xFFCD894C),
        500: Color(0xFFC47133),
        600: Color(0xFFB8672F),
        700: Color(0xFFA95D29),
        800: Color(0xFF8B4513), // SaddleBrown
        900: Color(0xFF63330D),
      },
    ),
    primaryColor: Color(0xFF8B4513),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF8B4513), // Light brown AppBar
      elevation: 2,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8B4513),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[800]),
      bodySmall: TextStyle(fontSize: 14, color: Colors.grey[600]),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Color(0xFF8B4513)),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    primarySwatch: MaterialColor(
      0xFF5D4037, // Base color for dark brown (Dark Chocolate)
      {
        50: Color(0xFFF0E6E5),
        100: Color(0xFFD9CAC7),
        200: Color(0xFFC1ADA8),
        300: Color(0xFFA99089),
        400: Color(0xFF927776),
        500: Color(0xFF7A5D5D),
        600: Color(0xFF6C5352),
        700: Color(0xFF5D4037), // Dark Chocolate
        800: Color(0xFF48302A),
        900: Color(0xFF34211D),
      },
    ),
    primaryColor: Color(0xFF5D4037),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF5D4037), // Dark brown AppBar
      elevation: 2,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF5D4037),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[300]),
      bodySmall: TextStyle(fontSize: 14, color: Colors.grey[400]),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Color(0xFF5D4037)),
    ),
  );
}
