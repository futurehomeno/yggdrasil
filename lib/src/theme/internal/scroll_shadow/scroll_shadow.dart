import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'scroll_shadow.tailor.dart';

@tailorComponent
class _$YgScrollShadowThemes {
  static List<Duration> fadeDuration = <Duration>[
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
  ];

  static List<Curve> fadeCurve = <Curve>[
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
  ];

  static List<Color> shadowColor = <Color>[
    Colors.black.withOpacity(0.15),
    Colors.black.withOpacity(0.15),
    Colors.black.withOpacity(0.15),
    Colors.black.withOpacity(0.15),
  ];

  static List<double> shadowSize = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
}
