import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'search_modal_theme.tailor.dart';

@tailorComponent
class _$YgSearchModalTheme {
  // region Header

  static const List<EdgeInsets> headerPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<double> headerSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<double> headerHeight = <double>[
    64,
    64,
    64,
    64,
  ];

  static const List<TextStyle> valueStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  static final List<TextStyle> placeholderStyle = <TextStyle>[
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

  static const List<Color> cursorColor = <Color>[
    consumer_light.FhColors.textHighlight,
    consumer_dark.FhColors.textHighlight,
    professional_light.FhColors.textHighlight,
    professional_dark.FhColors.textHighlight,
  ];

  // endregion

  // region Results

  static final List<TextStyle> resultTitleStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Regular,
    consumer_dark.FhTextStyles.sectionHeading3Regular,
    professional_light.FhTextStyles.sectionHeading3Regular,
    professional_dark.FhTextStyles.sectionHeading3Regular,
  ];

  static final List<TextStyle> resultTitleHighlightedStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Medium,
    consumer_dark.FhTextStyles.sectionHeading3Medium,
    professional_light.FhTextStyles.sectionHeading3Medium,
    professional_dark.FhTextStyles.sectionHeading3Medium,
  ];

  static final List<TextStyle> resultSubtitleStyle = <TextStyle>[
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

  static final List<TextStyle> resultSubtitleHighlightedStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.textWeak,
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
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];
}
