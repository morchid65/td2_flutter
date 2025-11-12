import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.merriweatherSans(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      textTheme: TextTheme(
        headlineSmall: GoogleFonts.merriweatherSans(fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.openSans(fontSize: 16, color: Colors.black),
        bodySmall: GoogleFonts.openSans(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.merriweatherSans(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        headlineSmall: GoogleFonts.merriweatherSans(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: GoogleFonts.openSans(fontSize: 16, color: Colors.white),
        bodySmall: GoogleFonts.openSans(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}