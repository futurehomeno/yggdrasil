import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'scroll_shadow.tailor.dart';

@tailorComponent
class _$YgScrollShadowThemes {
  static const List<Duration> fadeDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> fadeCurve = <Curve>[
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
  ];

  static const List<Color> shadowColor = <Color>[
    Color.fromRGBO(36, 45, 65, 0.19),
    Color.fromRGBO(0, 0, 0, 0.19),
    Color.fromRGBO(36, 45, 65, 0.19),
    Color.fromRGBO(0, 0, 0, 0.19),
  ];

  static const List<double> shadowSize = <double>[
    24,
    24,
    24,
    24,
  ];
}
