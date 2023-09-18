import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'tabs_theme.tailor.dart';

@tailorComponent
class _$YgTabsTheme {
  static const List<EdgeInsets> tabItemPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.md,
    ),
  ];

  static const List<EdgeInsets> indicatorPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> iconMargin = <EdgeInsets>[
    EdgeInsets.only(
      bottom: consumer_light.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      bottom: consumer_dark.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      bottom: professional_light.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      bottom: professional_dark.FhDimensions.xxs,
    ),
  ];

  static const List<Color> tabBarBackgroundColor = <Color>[
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

  static const List<Color> focusBackgroundColor = <Color>[
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

  static const List<Color> unselectedIconColor = <Color>[
    consumer_light.FhColors.iconWeak,
    consumer_dark.FhColors.iconWeak,
    professional_light.FhColors.iconWeak,
    professional_dark.FhColors.iconWeak,
  ];

  static const List<Color> selectedIconColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> indicatorColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> dividerColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<double> indicatorHeight = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<BorderRadius> contentContainerBorderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxs,
    consumer_dark.FhRadii.xxs,
    professional_light.FhRadii.xxs,
    professional_dark.FhRadii.xxs,
  ];

  static final List<TextStyle> unselectedLabelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.sectionHeading3Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.sectionHeading3Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.sectionHeading3Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
  ];

  static final List<TextStyle> selectedLabelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.sectionHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
  ];
}
