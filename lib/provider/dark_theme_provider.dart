import 'package:flutter/material.dart';
import 'package:newsapp_flutter/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _darkTheme = false;

  // Getter for the dark theme status
  bool get getDarkTheme {
    return _darkTheme;
  }

  // Setter for the dark theme status
  // value: true to enable dark theme, false to disable it
  set setDarkTheme(bool value) {
    _darkTheme = value;

    // Set the dark theme value in shared preferences
    darkThemePrefs.setDarkTheme(value);

    // Notify listeners that the dark theme status has changed
    notifyListeners();
  }
}
