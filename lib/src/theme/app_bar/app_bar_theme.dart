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

  @themeExtension
  static final List<SmallAppBarTheme> smallAppBarTheme = SmallAppBarTheme.themes;

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> borderColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<double> leadingIconSize = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static const List<double> trailingIconSize = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static const List<double> titleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  // !--- IMPORTANT ---
  // If the size of the app bar changes, the size of the app bar must be updated in the
  // `preferredSize` getter in the widget as well.
  // Strange things might happen if this is not the same as collapsedHeight.
  static const List<double> toolbarHeight = <double>[
    64.0,
    64.0,
    64.0,
    64.0,
  ];

  // Strange things might happen if this is not the same as collapsedHeight.
  static const List<double> collapsedHeight = <double>[
    64.0,
    64.0,
    64.0,
    64.0,
  ];
}
