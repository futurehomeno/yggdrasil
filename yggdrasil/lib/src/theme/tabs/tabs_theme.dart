import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'tabs_theme.tailor.dart';

@tailorComponent
class _$YgTabsTheme {
  // region Spacing and Padding

  /// Padding around the whole tab.
  static const List<EdgeInsets> tabPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  /// Spacing between the icon and the label in a column.
  static const List<double> iconLabelSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  // endregion

  // region Background

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

  // endregion

  // region Indicator

  static const List<Gradient> indicatorGradient = <Gradient>[
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_dark.FhGradients.actionPrimaryDefault,
    professional_light.FhGradients.actionPrimaryDefault,
    professional_dark.FhGradients.actionPrimaryDefault,
  ];

  static const List<double> indicatorHeight = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
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

  // region Label

  static final List<TextStyle> selectedLabelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Medium.copyWith(),
    consumer_dark.FhTextStyles.sectionHeading3Medium.copyWith(),
    professional_light.FhTextStyles.sectionHeading3Medium.copyWith(),
    professional_dark.FhTextStyles.sectionHeading3Medium.copyWith(),
  ];

  static final List<Color> selectedLabelColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static final List<TextStyle> unselectedLabelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Regular.copyWith(),
    consumer_dark.FhTextStyles.sectionHeading3Regular.copyWith(),
    professional_light.FhTextStyles.sectionHeading3Regular.copyWith(),
    professional_dark.FhTextStyles.sectionHeading3Regular.copyWith(),
  ];

  static final List<Color> unselectedLabelColor = <Color>[
    consumer_light.FhColors.textWeak,
    consumer_dark.FhColors.textWeak,
    professional_light.FhColors.textWeak,
    professional_dark.FhColors.textWeak,
  ];

  // endregion
}
