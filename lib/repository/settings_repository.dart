class SettingRepository {
  Future<bool> getSettings() async {
    // Simule une lecture depuis une source de données
    return Future.value(false);
  }

  void saveSettings(bool isDark) {
    // Simule une sauvegarde
    print("Thème sauvegardé : $isDark");
  }
}
