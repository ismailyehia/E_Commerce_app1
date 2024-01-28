import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get currentThemeMode => _themeMode;


  void toggleTheme() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void toggleTheme2() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }
}
