import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'callout_themes.tailor.dart';

@tailorComponent
class _$YgCalloutThemes {
  static List<Color> highlightBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundHighlightWeak,
    consumer_dark.FhColors.backgroundHighlightWeak,
    professional_light.FhColors.backgroundHighlightWeak,
    professional_dark.FhColors.backgroundHighlightWeak,
  ];

  static List<Color> successBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundSuccessWeak,
    consumer_dark.FhColors.backgroundSuccessWeak,
    professional_light.FhColors.backgroundSuccessWeak,
    professional_dark.FhColors.backgroundSuccessWeak,
  ];

  static List<Color> warningBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWarningWeak,
    consumer_dark.FhColors.backgroundWarningWeak,
    professional_light.FhColors.backgroundWarningWeak,
    professional_dark.FhColors.backgroundWarningWeak,
  ];

  static List<Color> criticalBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundCriticalWeak,
    consumer_dark.FhColors.backgroundCriticalWeak,
    professional_light.FhColors.backgroundCriticalWeak,
    professional_dark.FhColors.backgroundCriticalWeak,
  ];

  static List<Color> highlightBorderColor = <Color>[
    consumer_light.FhColors.borderHighlightWeak,
    consumer_dark.FhColors.borderHighlightWeak,
    professional_light.FhColors.borderHighlightWeak,
    professional_dark.FhColors.borderHighlightWeak,
  ];

  static List<Color> successBorderColor = <Color>[
    consumer_light.FhColors.borderSuccessWeak,
    consumer_dark.FhColors.borderSuccessWeak,
    professional_light.FhColors.borderSuccessWeak,
    professional_dark.FhColors.borderSuccessWeak,
  ];

  static List<Color> warningBorderColor = <Color>[
    consumer_light.FhColors.borderWarningWeak,
    consumer_dark.FhColors.borderWarningWeak,
    professional_light.FhColors.borderWarningWeak,
    professional_dark.FhColors.borderWarningWeak,
  ];

  static List<Color> criticalBorderColor = <Color>[
    consumer_light.FhColors.borderCriticalWeak,
    consumer_dark.FhColors.borderCriticalWeak,
    professional_light.FhColors.borderCriticalWeak,
    professional_dark.FhColors.borderCriticalWeak,
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.sm,
    consumer_dark.FhRadii.sm,
    professional_light.FhRadii.sm,
    professional_dark.FhRadii.sm,
  ];

  static List<EdgeInsets> padding = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.sm),
    const EdgeInsets.all(consumer_dark.FhDimensions.sm),
    const EdgeInsets.all(professional_light.FhDimensions.sm),
    const EdgeInsets.all(professional_dark.FhDimensions.sm),
  ];

  static List<double> titleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<double> linkSpacing = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static List<double> closeButtonSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Bold,
    consumer_dark.FhTextStyles.sectionHeading3Bold,
    professional_light.FhTextStyles.sectionHeading3Bold,
    professional_dark.FhTextStyles.sectionHeading3Bold,
  ];

  static List<TextStyle> descriptionTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular,
    consumer_dark.FhTextStyles.paragraph3Regular,
    professional_light.FhTextStyles.paragraph3Regular,
    professional_dark.FhTextStyles.paragraph3Regular,
  ];

  static List<TextStyle> linkTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.interactiveHighlightDefault,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.interactiveHighlightDefault,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.interactiveHighlightDefault,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.interactiveHighlightDefault,
    ),
  ];
}
