import 'package:flutter/material.dart';
import 'package:td2_app/UI/card1.dart';
import 'package:td2_app/UI/ecran_settings.dart';
import 'package:td2_app/UI/task_form_screen.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Ecran1(),        
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
        title: const Text('TD4 Flutter - Task Manager'), 
      ),
      
      body: _widgetOptions.elementAt(_selectedIndex),
      
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskFormScreen(), 
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(), 
          
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}