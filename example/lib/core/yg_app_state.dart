import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;

  void toggleTheme() {
    if (_currentTheme == YgTheme.consumerLight) {
      _currentTheme = YgTheme.consumerDark;
    } else {
      _currentTheme = YgTheme.consumerLight;
    }

    notifyListeners();
  }

  YgTheme get defaultTheme => _defaultTheme;
  YgTheme get currentTheme => _currentTheme;

  ThemeData get currentThemeData {
    if (_currentTheme == YgTheme.consumerLight) {
      return YgThemeDataHelper.consumerLightThemeData;
    }

    return YgThemeDataHelper.consumerDarkThemeData;
  }
}
