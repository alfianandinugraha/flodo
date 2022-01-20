import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _current = ThemeMode.light;

  ThemeMode get current => _current;

  bool get isDark => _current == ThemeMode.dark;

  void toggle() {
    _current = _current == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
