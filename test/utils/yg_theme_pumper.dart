import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgThemePumper {
  const YgThemePumper._();

  static Future<void> pumpWidgetWithYgTheme({
    required WidgetTester widgetTester,
    required Widget widget,
    required YgTheme ygTheme,
  }) {
    return widgetTester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(ygTheme),
        home: widget,
      ),
    );
  }
}
