// lib/UI/mytheme.dart
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}