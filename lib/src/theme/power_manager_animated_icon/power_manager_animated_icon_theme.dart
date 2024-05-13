import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'power_manager_animated_icon_theme.tailor.dart';

@tailorComponent
class _$PowerManagerAnimatedIconTheme {
  static const List<Color> increasingColor = <Color>[
    consumer_light.FhColors.iconSuccess,
    consumer_dark.FhColors.iconSuccess,
    professional_light.FhColors.iconSuccess,
    professional_dark.FhColors.iconSuccess,
  ];

  static const List<Color> decreasingColor = <Color>[
    consumer_light.FhColors.iconCritical,
    consumer_dark.FhColors.iconCritical,
    professional_light.FhColors.iconCritical,
    professional_dark.FhColors.iconCritical,
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
