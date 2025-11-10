import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart'; 

// Imports nécessaires
import '../ViewModel/setting_view_model.dart';
import 'mytheme.dart'; 

class EcranSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final settingViewModel = context.watch<SettingViewModel>();
    
    return SettingsList(

      lightTheme: SettingsThemeData(
        settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
        settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor,
      ),
      darkTheme: SettingsThemeData(
        settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
        settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor,
      ),
      sections: [
        SettingsSection(
          title: const Text('Thème'),
          tiles: [
            SettingsTile.switchTile(
              initialValue: settingViewModel.isDark,
              onToggle: (bool value) {
           
                context.read<SettingViewModel>().isDark = value; 
              },
              title: const Text('Mode sombre'),
              leading: const Icon(Icons.invert_colors),
            )
          ],
        )
      ],
    );
  }
}