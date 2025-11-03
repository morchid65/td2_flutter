import 'package:flutter/material.dart';
import '../UI/card1.dart';
import '../UI/card2.dart';
import '../UI/card3.dart';
import '../UI/card4.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[Ecran1(), Ecran2(), Ecran3()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TD2 App',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card1'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card2'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card3'),
        ],
      ),
    );
  }
}