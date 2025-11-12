import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository {
  static const themeKey = "darkMode";
  
  Future<void> saveSettings(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themeKey, value);
  }

  Future<bool> getSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeKey) ?? false;
  }
}