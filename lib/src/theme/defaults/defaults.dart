import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'defaults.tailor.dart';

@tailorComponent
class _$YgDefaults {
  static List<Brightness> brightness = <Brightness>[
    Brightness.light, // consumer_light
    Brightness.dark, // consumer_dark
    Brightness.light, // professional_light
    Brightness.dark, // professional_dark
  ];

  static List<Color> splashColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static List<Color> highlightColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static List<Color> focusColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withAlpha(150),
    consumer_dark.FhColors.backgroundDisabled.withAlpha(150),
    professional_light.FhColors.backgroundDisabled.withAlpha(150),
    professional_dark.FhColors.backgroundDisabled.withAlpha(150),
  ];

  static List<Color> scaffoldColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> appBarColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];
}
