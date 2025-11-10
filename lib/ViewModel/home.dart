// lib/ViewModel/home.dart
import 'package:flutter/material.dart';


import '../UI/card1.dart';          
import '../UI/card2.dart';          
import '../UI/ecran_settings.dart'; 
import '../UI/card3.dart';          
import '../UI/card4.dart';          
import '../UI/task_form_screen.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Card1(),          
    const Card2(),           
    const Card3(),           
    EcranSettings(),         
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
        title: const Text('TD Flutter'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskFormScreen(taskToEdit: null),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(), 
          
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(icon: Icon(Icons.filter_1), label: 'Card 1'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_2), label: 'Card 2'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_3), label: 'Card 3'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}