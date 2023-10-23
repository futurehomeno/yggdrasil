import 'package:flutter/material.dart';

/// Common values used for golden testing widgets.
class YgGoldenTestValues {
  const YgGoldenTestValues._();

  static const BoxConstraints scenarioConstraints = BoxConstraints(
    maxWidth: 320.0,
    minWidth: 320.0,
  );

  static const String shortText = 'Alchemist.';

  static const String mediumText = 'Warming up your golden tests.';

  static const String longText = 'If you see black and yellow, you have a rendering error!';

  static const String veryLongText =
      'Golden tests, do not like me the best, I am a very long text, rendering errors are my flex, I am going to break your widget next!';
}
