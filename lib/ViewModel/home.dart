import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UI/card1.dart';          
import '../UI/card2.dart';          
import '../UI/card3.dart';          
import '../UI/card4.dart';          
import '../UI/ecran_settings.dart'; 
import '../UI/task_form_screen.dart';
import '../UI/mytheme.dart';
import 'setting_view_model.dart'; 

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
    const Card4(),           
    const EcranSettings(),         
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final isDark = context.watch<SettingViewModel>().isDark; 
    final theme = isDark ? MyTheme.dark() : MyTheme.light();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TD Flutter App',
          style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white), 
        ),
        backgroundColor: theme.primaryColor,
      ),
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

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
          BottomNavigationBarItem(icon: Icon(Icons.filter_1), label: 'Tasks (DB)'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_2), label: 'Tasks (JSON)'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_3), label: 'Tasks (REST)'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_4), label: 'Card 4'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey, 
        selectedItemColor: theme.primaryColor, 
      ),
    );
  }
}