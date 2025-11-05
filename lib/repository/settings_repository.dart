import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart'; // Pour debugPrint

class SettingRepository {
  static const THEME_KEY = "darkMode"; 

  saveSettings(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
    debugPrint("Thème sauvegardé : $value");
  }

  Future<bool> getSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false; 
  }
}