import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'defaults.tailor.dart';

@tailorComponent
class _$YgDefaults {
  static const List<Brightness> brightness = <Brightness>[
    Brightness.light, // consumer_light
    Brightness.dark, // consumer_dark
    Brightness.light, // professional_light
    Brightness.dark, // professional_dark
  ];

  static const List<Color> colorSchemeSeed = <Color>[
    consumer_light.FhColors.backgroundHighlightDefault,
    consumer_dark.FhColors.backgroundHighlightDefault,
    professional_light.FhColors.backgroundHighlightDefault,
    professional_dark.FhColors.backgroundHighlightDefault,
  ];

  static final List<Color> splashColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static final List<Color> highlightColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static final List<Color> focusColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static const List<Color> scaffoldColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> appBarColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> invertedIconColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

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
