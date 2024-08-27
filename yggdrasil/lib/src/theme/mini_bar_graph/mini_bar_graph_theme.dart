import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'mini_bar_graph_theme.tailor.dart';

@tailorComponent
class _$YgMiniBarGraphTheme {
  // region Bar

  static const List<double> barWidth = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> maxBarSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<Color> barColorSuccess = <Color>[
    consumer_light.FhColors.borderSuccessDefault,
    consumer_dark.FhColors.borderSuccessDefault,
    professional_light.FhColors.borderSuccessDefault,
    professional_dark.FhColors.borderSuccessDefault,
  ];

  static const List<Color> barColorWarning = <Color>[
    consumer_light.FhColors.backgroundWarningDefault,
    consumer_dark.FhColors.backgroundWarningDefault,
    professional_light.FhColors.backgroundWarningDefault,
    professional_dark.FhColors.backgroundWarningDefault,
  ];

  static const List<Color> barColorNeutral = <Color>[
    consumer_light.FhColors.iconHighlight,
    consumer_dark.FhColors.iconHighlight,
    professional_light.FhColors.iconHighlight,
    professional_dark.FhColors.iconHighlight,
  ];

  static const List<Color> barColorNull = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> barBorderColorNull = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> barColorDefault = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<BorderRadius> barBorderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxs,
    consumer_dark.FhRadii.xxs,
    professional_light.FhRadii.xxs,
    professional_dark.FhRadii.xxs,
  ];

  // endregion

  // region Value Text

  static const List<TextStyle> valueTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading1Regular,
    consumer_dark.FhTextStyles.pageHeading1Regular,
    professional_light.FhTextStyles.pageHeading1Regular,
    professional_dark.FhTextStyles.pageHeading1Regular,
  ];

  static const List<Color> valueTextColorPositive = <Color>[
    consumer_light.FhColors.textSuccess,
    consumer_dark.FhColors.textSuccess,
    professional_light.FhColors.textSuccess,
    professional_dark.FhColors.textSuccess,
  ];

  static const List<Color> valueTextColorWarning = <Color>[
    consumer_light.FhColors.textWarning,
    consumer_dark.FhColors.textWarning,
    professional_light.FhColors.textWarning,
    professional_dark.FhColors.textWarning,
  ];

  static const List<Color> valueTextColorNeutral = <Color>[
    consumer_light.FhColors.textHighlight,
    consumer_dark.FhColors.textHighlight,
    professional_light.FhColors.textHighlight,
    professional_dark.FhColors.textHighlight,
  ];

  static const List<Color> valueTextColorDisabled = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  // endregion

  // region Indicator

  static const List<double> barIndicatorSpacing = <double>[
    3.0,
    3.0,
    3.0,
    3.0,
  ];

  static const List<double> indicatorSize = <double>[
    4.0,
    4.0,
    4.0,
    4.0,
  ];

  // endregion

  static final List<double> minGraphHeight = <double>[
    40.0,
    40.0,
    40.0,
    40.0,
  ];

  static final List<TextStyle> metricTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular,
    consumer_dark.FhTextStyles.caption1Regular,
    professional_light.FhTextStyles.caption1Regular,
    professional_dark.FhTextStyles.caption1Regular,
  ];

  static const List<EdgeInsets> graphPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<double> valueTextBarGraphSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> valueTextMetricSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];
}
