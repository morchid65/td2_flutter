import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_app/ViewModel/home.dart';
import 'package:td2_app/UI/mytheme.dart';
import 'package:td2_app/ViewModel/setting_view_model.dart';
import 'package:td2_app/ViewModel/taskViewModel.dart'; 

void main() {
  runApp(MyTD2()); // Retire le const ici
}

class MyTD2 extends StatelessWidget {
  // Retire const ici
  // const MyTD2({super.key}); 
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
      // Retire const dans le Consumer pour éviter l'erreur G962A111C
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