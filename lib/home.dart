import 'package:flutter/material.dart';
import './card1.dart';
import './card2.dart';
import './card3.dart';

class Home extends StatefulWidget {
   @override
   State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int _selectedIndex = 0;

    static List<Widget> pages = <Widget>[
      Ecran1(),
      Ecran2(),
      Ecran3(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TD2'),
          titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        ),
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Screen1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Screen2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Screen3',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          onTap: _onItemTapped,
        ),
      );
    }
}