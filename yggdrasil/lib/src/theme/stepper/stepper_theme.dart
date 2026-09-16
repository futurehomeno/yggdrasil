import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'stepper_theme.tailor.dart';

@tailorComponent
class _$YgStepperTheme {
  static const List<TextStyle> valueTextStyleSmall = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Medium,
    consumer_dark.FhTextStyles.paragraph3Medium,
    professional_light.FhTextStyles.paragraph3Medium,
    professional_dark.FhTextStyles.paragraph3Medium,
  ];

  static const List<TextStyle> valueTextStyleMedium = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Medium,
    consumer_dark.FhTextStyles.sectionHeading3Medium,
    professional_light.FhTextStyles.sectionHeading3Medium,
    professional_dark.FhTextStyles.sectionHeading3Medium,
  ];

  static const List<TextStyle> valueTextStyleLarge = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Medium,
    consumer_dark.FhTextStyles.pageHeading3Medium,
    professional_light.FhTextStyles.pageHeading3Medium,
    professional_dark.FhTextStyles.pageHeading3Medium,
  ];

  static const List<TextStyle> metricTextStyleSmall = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular,
    consumer_dark.FhTextStyles.caption1Regular,
    professional_light.FhTextStyles.caption1Regular,
    professional_dark.FhTextStyles.caption1Regular,
  ];

  static const List<TextStyle> metricTextStyleMedium = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular,
    consumer_dark.FhTextStyles.paragraph3Regular,
    professional_light.FhTextStyles.paragraph3Regular,
    professional_dark.FhTextStyles.paragraph3Regular,
  ];

  static const List<TextStyle> metricTextStyleLarge = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Regular,
    consumer_dark.FhTextStyles.sectionHeading3Regular,
    professional_light.FhTextStyles.sectionHeading3Regular,
    professional_dark.FhTextStyles.sectionHeading3Regular,
  ];

  static const List<Color> textDefaultColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> textDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  static const List<double> heightSmall = <double>[
    52.0,
    52.0,
    52.0,
    52.0,
  ];

  static const List<double> heightMedium = <double>[
    64.0,
    64.0,
    64.0,
    64.0,
  ];

  static const List<double> heightLarge = <double>[
    80.0,
    80.0,
    80.0,
    80.0,
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];
}
