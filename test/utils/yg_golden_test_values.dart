import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_theme_test_data.dart';

/// Common values used for golden testing widgets.
class YgGoldenTestValues {
  const YgGoldenTestValues._();

  /// Size of "device" when creating golden tests.
  ///
  /// [minWidth] = 320 as that's the lowest in Figma (iPhoneSE).
  /// [maxWidth] = 430 as that's the highest in Figma (iPhone 15 Pro Max).
  static const BoxConstraints scenarioConstraints = BoxConstraints(
    minWidth: 320.0,
    maxWidth: 430.0,
  );

  /// All themes that we want to test in goldens.
  static List<YgThemeTestData> get themesToTest => <YgThemeTestData>[
        YgThemeTestData(
          fileName: 'consumer_light',
          theme: YgTheme.consumerLight,
          themeName: 'Consumer light',
        ),
        YgThemeTestData(
          fileName: 'consumer_dark',
          theme: YgTheme.consumerDark,
          themeName: 'Consumer dark',
        ),
      ];

  static const String shortText = 'Alchemist.';

  static const String mediumText = 'No black and yellow, no rendering error!';

  static const String longText =
      'Golden tests, do not like me the best, I am a very long text, rendering errors are my flex, I am going to break your widget next!';
}
