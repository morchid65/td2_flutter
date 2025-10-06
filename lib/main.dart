import 'package:flutter/material.dart';
import 'mytheme.dart';
import 'home.dart';

void main() {
  runApp(MyTD2App());
}

class MyTD2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'TD2',
      home: Home(),
    );
  }
}