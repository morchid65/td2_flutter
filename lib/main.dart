import 'package:flutter/material.dart';
import 'mytheme.dart';
import 'home.dart';

void main() {
  runApp(const MyTD2App());
}

class MyTD2App extends StatelessWidget {
  const MyTD2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark(); // Ajoute les parenthèses si c'est une méthode
    return MaterialApp(
      theme: theme,
      title: 'TD2',
      home: Home(),
    );
  }
}