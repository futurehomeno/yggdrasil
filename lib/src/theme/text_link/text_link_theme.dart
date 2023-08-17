import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'text_link_theme.tailor.dart';

@tailorComponent
class _$YgTextLinkTheme {
  static const List<TextStyle> smallWeakTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular,
    consumer_dark.FhTextStyles.caption1Regular,
    professional_light.FhTextStyles.caption1Regular,
    professional_dark.FhTextStyles.caption1Regular,
  ];

  static const List<TextStyle> mediumWeakTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  static const List<TextStyle> smallStrongTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium,
    consumer_dark.FhTextStyles.caption1Medium,
    professional_light.FhTextStyles.caption1Medium,
    professional_dark.FhTextStyles.caption1Medium,
  ];

  static const List<TextStyle> mediumStrongTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_dark.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    professional_dark.FhTextStyles.paragraph2Medium,
  ];

  static const List<Color> defaultColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> hoverColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static const List<Color> focusColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> pressedColor = <Color>[
    consumer_light.FhColors.interactiveHighlightPressed,
    consumer_dark.FhColors.interactiveHighlightPressed,
    professional_light.FhColors.interactiveHighlightPressed,
    professional_dark.FhColors.interactiveHighlightPressed,
  ];

  static const List<Color> disabledColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDisabled,
    consumer_dark.FhColors.interactiveHighlightDisabled,
    professional_light.FhColors.interactiveHighlightDisabled,
    professional_dark.FhColors.interactiveHighlightDisabled,
  ];

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.only(left: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(left: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(left: professional_light.FhDimensions.xxs),
    EdgeInsets.only(left: professional_dark.FhDimensions.xxs),
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];
}
