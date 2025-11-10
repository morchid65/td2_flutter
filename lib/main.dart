
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io'; 
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'ViewModel/home.dart';
import 'UI/mytheme.dart';
import 'ViewModel/setting_view_model.dart';
import 'ViewModel/taskViewModel.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; 
  }
  runApp(MyTD2());
}

class MyTD2 extends StatelessWidget {
  MyTD2({super.key});

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

            home: Home(), 
          );
        },
      ),
    );
  }
}