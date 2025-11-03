import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewModel/setting_view_model.dart';
import 'mytheme.dart';
import 'home.dart';

void main() {
  runApp(MyTD2());
}

class MyTD2 extends StatelessWidget {
  const MyTD2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
        builder: (context, notifier, child) {
          return MaterialApp(
            theme: notifier.isDark ? MyTheme.dark() : MyTheme.light(),
            title: 'TD2',
            home: const Home(),
          );
        },
      ),
    );
  }
}
