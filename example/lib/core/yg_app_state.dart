import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  UniqueKey _key = UniqueKey();
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _debugOutlineEnabled = false;
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

  Future<void> toggleDebugOutlineEnabled() async {
    _debugOutlineEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  /// Updates the app key to force a rebuild of the app.
  void _updateAppKey() {
    _key = UniqueKey();
  }

  UniqueKey get key => _key;

  YgTheme get defaultTheme => _defaultTheme;
  YgTheme get currentTheme => _currentTheme;

  bool get debugOutlineEnabled => _debugOutlineEnabled;

  ThemeData get currentThemeData {
    return YgThemeDataHelper.getThemeData(_currentTheme);
  }
}
