import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'mytheme.dart';
import '../ViewModel/setting_view_model.dart';

class EcranSettings extends StatefulWidget {
  @override
  State<EcranSettings> createState() => _EcranSettingsState();
}

class _EcranSettingsState extends State<EcranSettings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
            settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
            settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor),
        lightTheme: SettingsThemeData(
            settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
            settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor),
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: context.watch<SettingViewModel>().isDark,
                onToggle: (bool value) {
                  context.read<SettingViewModel>().isDark = value;
                },
                title: const Text('Dark mode'),
                leading: const Icon(Icons.invert_colors),
              )
            ],
          )
        ],
      ),
    );
  }
}