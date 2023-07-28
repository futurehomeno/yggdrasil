import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAppState extends ChangeNotifier {
  UniqueKey _key = UniqueKey();
  final YgTheme _defaultTheme = YgTheme.consumerLight;
  YgTheme _currentTheme = YgTheme.consumerLight;
  YgTheme get theme => _defaultTheme;
  bool _outlineToggled = false;
  bool _debugPaintSizeEnabled = false;
  bool _debugPaintBaselinesEnabled = false;
  bool _debugPaintLayerBordersEnabled = false;
  bool _debugPaintPointersEnabled = false;
  bool _debugRepaintRainbowEnabled = false;
  bool _debugRepaintTextRainbowEnabled = false;

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

  Future<void> toggleDebugPaintSizeEnabled() async {
    _debugPaintSizeEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  Future<void> toggleDebugPaintBaselinesEnabled() async {
    _debugPaintBaselinesEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  Future<void> toggleDebugPaintLayerBordersEnabled() async {
    _debugPaintLayerBordersEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  Future<void> toggleDebugPaintPointersEnabled() async {
    _debugPaintPointersEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  Future<void> toggleDebugRepaintRainbowEnabled() async {
    _debugRepaintRainbowEnabled ^= true;
    _updateAppKey();
    notifyListeners();
  }

  Future<void> toggleDebugRepaintTextRainbowEnabled() async {
    _debugRepaintTextRainbowEnabled ^= true;
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

  bool get outlineToggled => _outlineToggled;
  bool get debugPaintSizeEnabled => _debugPaintSizeEnabled;
  bool get debugPaintBaselinesEnabled => _debugPaintBaselinesEnabled;
  bool get debugPaintLayerBordersEnabled => _debugPaintLayerBordersEnabled;
  bool get debugPaintPointersEnabled => _debugPaintPointersEnabled;
  bool get debugRepaintRainbowEnabled => _debugRepaintRainbowEnabled;
  bool get debugRepaintTextRainbowEnabled => _debugRepaintTextRainbowEnabled;

  ThemeData get currentThemeData {
    return YgThemeDataHelper.getThemeData(_currentTheme);
  }
}
