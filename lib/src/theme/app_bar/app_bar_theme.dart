import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/app_bar/extensions/_extensions.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'app_bar_theme.tailor.dart';

@tailorComponent
class _$YgAppBarTheme {
  @themeExtension
  static final List<LargeAppBarTheme> largeAppBarTheme = LargeAppBarTheme.themes;

  @themeExtension
  static final List<MediumAppBarTheme> mediumAppBarTheme = MediumAppBarTheme.themes;

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  // Spacing around the title in the toolbar.
  static const List<double> titleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  // Spacing between the action and the edge of the app bar.
  static const List<double> actionEdgeSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  /// Spacing between edge and title on both sides when it's expanded.
  static const List<double> titleExpandedPadding = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
      height: 1.2,
    ),
    consumer_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
      height: 1.2,
    ),
    professional_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_light.FhColors.textDefault,
      height: 1.2,
    ),
    professional_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
      height: 1.2,
    ),
  ];

  /// Elevation when the app bar is at the top.
  static const List<double> elevation = <double>[
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  /// Elevation when there's content "under" the app bar.
  static const List<double> scrolledUnderElevation = <double>[
    1.0,
    1.0,
    1.0,
    1.0,
  ];

  static const List<double> toolbarHeight = <double>[
    64.0,
    64.0,
    64.0,
    64.0,
  ];
}
