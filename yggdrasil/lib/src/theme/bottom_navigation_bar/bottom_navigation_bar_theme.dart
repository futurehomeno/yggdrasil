import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'bottom_navigation_bar_theme.tailor.dart';

@tailorComponent
class _$YgBottomNavigationBarTheme {
  // region Background

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> hoverBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> pressedBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  // endregion

  // region Divider

  static const List<Color> dividerColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<double> dividerHeight = <double>[
    1.0,
    1.0,
    1.0,
    1.0,
  ];

  // endregion

  // region Spacing and padding

  /// Padding around an individual item.
  static const List<EdgeInsets> itemPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.xxs,
      vertical: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.xxs,
      vertical: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.xxs,
      vertical: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.xxs,
      vertical: professional_dark.FhDimensions.xs,
    ),
  ];

  /// Spacing between the icon and the title.
  static const List<double> iconLabelSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  /// Spacing between the title and the optional subtitle.
  static const List<double> titleSubtitleSpacing = <double>[
    2.0,
    2.0,
    2.0,
    2.0,
  ];

  // endregion

  // region Indicator

  /// Color of the moving selection indicator placed at the top of the bar.
  ///
  /// Matches [YgWizardHeader]'s progress foreground so the two components share
  /// a common selection accent.
  static const List<Color> indicatorColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  /// Stroke height of the indicator. Matches [YgWizardHeader]'s `barStroke`.
  static const List<double> indicatorHeight = <double>[
    4.0,
    4.0,
    4.0,
    4.0,
  ];

  /// Radius applied to the bottom corners of the indicator only — produces a
  /// rectangle that hangs from the top edge with subtly rounded bottom corners.
  static const List<BorderRadius> indicatorRadius = <BorderRadius>[
    BorderRadius.only(
      bottomLeft: Radius.circular(consumer_light.FhDimensions.xs),
      bottomRight: Radius.circular(consumer_light.FhDimensions.xs),
    ),
    BorderRadius.only(
      bottomLeft: Radius.circular(consumer_dark.FhDimensions.xs),
      bottomRight: Radius.circular(consumer_dark.FhDimensions.xs),
    ),
    BorderRadius.only(
      bottomLeft: Radius.circular(professional_light.FhDimensions.xs),
      bottomRight: Radius.circular(professional_light.FhDimensions.xs),
    ),
    BorderRadius.only(
      bottomLeft: Radius.circular(professional_dark.FhDimensions.xs),
      bottomRight: Radius.circular(professional_dark.FhDimensions.xs),
    ),
  ];

  // endregion

  // region Icons

  static const List<Color> selectedIconColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> unselectedIconColor = <Color>[
    consumer_light.FhColors.iconWeak,
    consumer_dark.FhColors.iconWeak,
    professional_light.FhColors.iconWeak,
    professional_dark.FhColors.iconWeak,
  ];

  // endregion

  // region Text styles

  static final List<TextStyle> selectedTitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Bold.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.caption1Bold.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.caption1Bold.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.caption1Bold.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> unselectedTitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  static final List<TextStyle> selectedSubtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> unselectedSubtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  // endregion

  // region Animation

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 250),
    Duration(milliseconds: 250),
    Duration(milliseconds: 250),
    Duration(milliseconds: 250),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
  ];

  // endregion
}
