import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'search_bar_theme.tailor.dart';

@tailorComponent
class _$YgSearchBarTheme {
  // region Content

  static const List<double> contentHeight = <double>[
    consumer_light.FhDimensions.xxl,
    consumer_dark.FhDimensions.xxl,
    professional_light.FhDimensions.xxl,
    professional_dark.FhDimensions.xxl,
  ];

  static const List<double> contentSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<EdgeInsets> contentPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  // endregion

  // region Container

  static const List<Color> containerDefaultColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> containerHoveredColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<Color> containerFocusedColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<BorderRadius> containerBorderRadius = <BorderRadius>[
    consumer_light.FhRadii.xl,
    consumer_dark.FhRadii.xl,
    professional_light.FhRadii.xl,
    professional_dark.FhRadii.xl,
  ];

  // endregion

  // region Bar

  static const List<Color> barColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<double> barHeight = <double>[
    64,
    64,
    64,
    64,
  ];

  static const List<EdgeInsets> barPadding = <EdgeInsets>[
    EdgeInsets.symmetric(horizontal: 16),
    EdgeInsets.symmetric(horizontal: 16),
    EdgeInsets.symmetric(horizontal: 16),
    EdgeInsets.symmetric(horizontal: 16),
  ];

  static const List<double> elevation = <double>[
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  static const List<double> scrolledUnderElevation = <double>[
    1.0,
    1.0,
    1.0,
    1.0,
  ];

  // endregion

  // region Value

  static final List<TextStyle> placeholderTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  static final List<TextStyle> valueTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  // endregion

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.42, 0.0, 0.58, 1.0),
    Cubic(0.42, 0.0, 0.58, 1.0),
    Cubic(0.42, 0.0, 0.58, 1.0),
    Cubic(0.42, 0.0, 0.58, 1.0),
  ];
}
