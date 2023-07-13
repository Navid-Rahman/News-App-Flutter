import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const THEME_STATUS = "THEME_STATUS";

  // Sets the dark theme value in shared preferences
  // value: true to enable dark theme, false to disable it
  Future<void> setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      THEME_STATUS,
      value,
    );
  }

  // Retrieves the dark theme value from shared preferences
  // Returns: true if dark theme is enabled, false if it's disabled
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          THEME_STATUS,
        ) ??
        false;
  }
}
