import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'ViewModel/home.dart';
import 'ViewModel/taskViewModel.dart'; 
import 'ViewModel/setting_view_model.dart';
import 'UI/mytheme.dart';

void _initDatabaseFactoryForDesktop() {

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {

    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  }
}

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  
  _initDatabaseFactoryForDesktop();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => SettingViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final settingViewModel = context.watch<SettingViewModel>();
    final bool isDark = settingViewModel.isDark;

    return MaterialApp(
      title: 'TD Flutter App',
      debugShowCheckedModeBanner: false,

      theme: isDark ? MyTheme.dark() : MyTheme.light(), 
      home: const Home(),
    );
  }
}