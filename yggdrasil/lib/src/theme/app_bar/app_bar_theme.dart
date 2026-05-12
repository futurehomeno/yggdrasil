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

  // Vertical padding of the app bar (when collapsed).
  static const List<double> titleVerticalPadding = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  // Horizontal padding of the app bar.
  static const List<double> appBarHorizontalPadding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  /// Spacing between edge and title on both sides when it's expanded.
  static const List<double> titleExpandedHorizontalPadding = <double>[
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

  /// For all intents and purposes, this is the height of the app bar.
  static const List<double> toolbarHeight = <double>[
    64.0,
    64.0,
    64.0,
    64.0,
  ];

  /// Background color of the title when [YgAppBar.onTitleTap] is set.
  static const List<Color> titleButtonBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  /// Border radius of the tappable title container — matches [YgButton] so
  /// the title reads as a button.
  static const List<BorderRadius> titleButtonBorderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  /// Inner padding of the tappable title container.
  static const List<EdgeInsets> titleButtonPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.sm,
      vertical: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.sm,
      vertical: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.sm,
      vertical: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.sm,
      vertical: professional_dark.FhDimensions.xs,
    ),
  ];

  /// Spacing between the title text and the trailing icon inside the button.
  static const List<double> titleButtonIconSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  /// Text style of the title when rendered inside the tappable button —
  /// slightly smaller than [titleTextStyle] so the button feels distinct from
  /// the default heading.
  static final List<TextStyle> titleButtonTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
      height: 1.2,
    ),
    consumer_dark.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
      height: 1.2,
    ),
    professional_light.FhTextStyles.sectionHeading3Medium.copyWith(
      color: professional_light.FhColors.textDefault,
      height: 1.2,
    ),
    professional_dark.FhTextStyles.sectionHeading3Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
      height: 1.2,
    ),
  ];
}
