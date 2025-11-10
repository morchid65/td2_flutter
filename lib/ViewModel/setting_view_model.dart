// lib/ViewModel/setting_view_model.dart
import 'package:flutter/cupertino.dart';
import '../repository/settings_repository.dart';

class SettingViewModel extends ChangeNotifier {
  late bool _isDark;
  late SettingRepository _settingRepository;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    _settingRepository.saveSettings(value);
    notifyListeners();
  }

  SettingViewModel() {
    _isDark = false;
    _settingRepository = SettingRepository();
    getSettings();
  }

  Future<void> getSettings() async {
    _isDark = await _settingRepository.getSettings();
    notifyListeners();
  }
}