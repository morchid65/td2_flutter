import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import '../api/myapi.dart';
import 'detail.dart';

class EcranSettings extends StatefulWidget {
  const EcranSettings({super.key});

  @override
  State<EcranSettings> createState() => _EcranSettingsState();
}

class _EcranSettingsState extends State<EcranSettings> {
  bool _dark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Thème'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                initialValue: _dark,
                onToggle: _onToggle,
                title: const Text('Mode sombre'),
                leading: const Icon(Icons.invert_colors),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onToggle(bool value) {
    debugPrint('Dark mode: $value');
    setState(() {
      _dark = value;
    });
  }
}
