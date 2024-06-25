import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  final GlobalKey<YgSnackBarManagerState> rootSnackBarManagerKey = GlobalKey<YgSnackBarManagerState>();
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _darkMode = false;
  bool _businessTheme = false;
  late SharedPreferences _sharedPreferences;

  String _version = '';
  String get version => _version;

  void init() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _sharedPreferences = await SharedPreferences.getInstance();

    _darkMode = _sharedPreferences.getBool('dark_mode') ?? _darkMode;
    _businessTheme = _sharedPreferences.getBool('business_theme') ?? _businessTheme;
    _updateTheme();

    notifyListeners();
  }

  void toggleDarkMode() {
    _darkMode ^= true;
    _sharedPreferences.setBool('dark_mode', _darkMode);
    _updateTheme();
  }

  void toggleProfessionalTheme() {
    _businessTheme ^= true;
    _sharedPreferences.setBool('business_theme', _businessTheme);
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
