import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

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
      return ThemeData(
        brightness: Brightness.light,
        extensions: <YgTheme>[YgTheme.consumerLight],
      );
    }

    return ThemeData(
      brightness: Brightness.dark,
      extensions: <YgTheme>[YgTheme.consumerDark],
    );
  }
}
