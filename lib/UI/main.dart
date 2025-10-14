import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des tâches',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF800000),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF800000),
          foregroundColor: Colors.white,
        ),
        cardColor: Color(0xFF800000),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: Home(), // ✅ corrigé ici
    );
  }
}
