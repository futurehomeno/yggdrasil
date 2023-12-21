import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yggdrasil/yggdrasil.dart';

class StorageKeys {
  const StorageKeys._();

  static const String darkMode = 'dark_mode';
  static const String businessTheme = 'business_theme';
}

class YgAppState extends ChangeNotifier {
  YgAppState({
    required this.storage,
  });

  SharedPreferences storage;

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _darkMode = false;
  bool _businessTheme = false;

  void init() {
    _darkMode = storage.getBool(StorageKeys.darkMode) ?? _darkMode;
    _businessTheme = storage.getBool(StorageKeys.businessTheme) ?? _businessTheme;
    _updateTheme();
  }

  void toggleDarkMode() async {
    _darkMode ^= true;
    _updateTheme();
    await storage.setBool(StorageKeys.darkMode, _darkMode);
  }

  void toggleProfessionalTheme() async {
    _businessTheme ^= true;
    _updateTheme();
    await storage.setBool(StorageKeys.businessTheme, _businessTheme);
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
