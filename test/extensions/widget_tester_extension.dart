import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpWidgetWithYgTheme({
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
