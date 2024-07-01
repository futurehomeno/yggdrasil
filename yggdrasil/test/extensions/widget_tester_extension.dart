import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Used for pumping various YgThemes inside golden test widgets.
  Future<void> pumpWidgetWithYgTheme({
    required Widget widget,
    required YgTheme ygTheme,
  }) {
    return pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(ygTheme),
        home: widget,
      ),
    );
  }
}
