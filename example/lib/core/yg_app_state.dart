import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _outlineToggled = false;

  void toggleTheme() {
    if (_currentTheme == YgTheme.consumerLight) {
      _currentTheme = YgTheme.consumerDark;
    } else {
      _currentTheme = YgTheme.consumerLight;
    }

    notifyListeners();
  }

  void toggleOutline() {
    _outlineToggled ^= true;
    notifyListeners();
  }

  YgTheme get defaultTheme => _defaultTheme;
  YgTheme get currentTheme => _currentTheme;

  bool get outlineToggled => _outlineToggled;

  ThemeData get currentThemeData {
    return YgThemeDataHelper.getThemeData(_currentTheme);
  }
}
