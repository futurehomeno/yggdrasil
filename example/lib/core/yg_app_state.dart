import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _darkMode = false;
  bool _businessTheme = false;
  String _version = '';
  String get version => _version;

  void init() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    _darkMode = storage.getBool(StorageKeys.darkMode) ?? _darkMode;
    _businessTheme = storage.getBool(StorageKeys.businessTheme) ?? _businessTheme;

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    notifyListeners();
  }

  void toggleDarkMode() async {
    _darkMode ^= true;
    _updateTheme();

    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool(StorageKeys.darkMode, _darkMode);
  }

  void toggleProfessionalTheme() async {
    _businessTheme ^= true;
    _updateTheme();

    final SharedPreferences storage = await SharedPreferences.getInstance();
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

class StorageKeys {
  const StorageKeys._();

  static const String darkMode = 'dark_mode';
  static const String businessTheme = 'business_theme';
}
