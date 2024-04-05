import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'pulse_theme.tailor.dart';

@tailorComponent
class _$YgPulseTheme {
  static const List<Size> preferredSize = <Size>[
    Size.square(140),
    Size.square(140),
    Size.square(140),
    Size.square(140),
  ];

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static const List<Duration> pulseDuration = <Duration>[
    Duration(seconds: 3),
    Duration(seconds: 3),
    Duration(seconds: 3),
    Duration(seconds: 3),
  ];

  static const List<Duration> pulseInterval = <Duration>[
    Duration(seconds: 1),
    Duration(seconds: 1),
    Duration(seconds: 1),
    Duration(seconds: 1),
  ];

  static const List<Curve> pulseCurve = <Curve>[
    Curves.linear,
    Curves.linear,
    Curves.linear,
    Curves.linear,
  ];
}
