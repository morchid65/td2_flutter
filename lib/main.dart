import 'package:flutter/material.dart';
import 'card1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des tâches',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(800000), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(800000),
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(800000), 
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: Ecran1(),
    );
  }
}
