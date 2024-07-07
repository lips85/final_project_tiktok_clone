import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeConfigRepository {
  static const String _isDarkMode = "darkmode";

  final SharedPreferences _preferences;

  DarkmodeConfigRepository(this._preferences);

  Future<void> setDark(bool value) async {
    _preferences.setBool(_isDarkMode, value);
  }

  bool isDark() {
    return _preferences.getBool(_isDarkMode) ?? false;
  }
}
