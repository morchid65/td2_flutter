import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UI/home.dart';
import 'UI/mytheme.dart';
import 'ViewModel/setting_view_model.dart';
import 'ViewModel/taskViewModel.dart'; 

void main() {
  runApp(const MyTD2());
}

class MyTD2 extends StatelessWidget {
  const MyTD2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            SettingViewModel settingViewModel = SettingViewModel();
            return settingViewModel;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            TaskViewModel taskViewModel = TaskViewModel();
            taskViewModel.generateTasks();
            return taskViewModel;
          },
        )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, settingNotifier, child) {
          return MaterialApp(
            theme: settingNotifier.isDark ? MyTheme.dark() : MyTheme.light(),
            title: 'TD3',
            home: const Home(), 
          );
        },
      ),
    );
  }
}