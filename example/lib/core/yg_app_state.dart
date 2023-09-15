import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _darkMode = false;
  bool _businessTheme = false;

  void toggleDarkMode() {
    _darkMode ^= true;
    _updateTheme();
  }

  void toggleProfessionalTheme() {
    _businessTheme ^= true;
    _updateTheme();
  }

  void _updateTheme() {
    if (_businessTheme) {
      if (_darkMode) {
        _currentTheme = YgTheme.professionalDark;
      } else {
        _currentTheme = YgTheme.professionalLight;
      }
    } else {
      if (_darkMode) {
        _currentTheme = YgTheme.consumerDark;
      } else {
        _currentTheme = YgTheme.consumerLight;
      }
    }
    notifyListeners();
  }

  YgTheme get defaultTheme => _defaultTheme;
  YgTheme get currentTheme => _currentTheme;

  ThemeData get currentThemeData {
    return YgThemeDataHelper.getThemeData(_currentTheme);
  }
}
