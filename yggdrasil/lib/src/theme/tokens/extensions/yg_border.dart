import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'yg_border.tailor.dart';

@tailorComponent
class _$YgBorder {
  static const List<Border> none = <Border>[
    consumer_light.FhBorders.none,
    consumer_dark.FhBorders.none,
    professional_light.FhBorders.none,
    professional_dark.FhBorders.none,
  ];

  static const List<Border> sm = <Border>[
    consumer_light.FhBorders.sm,
    consumer_dark.FhBorders.sm,
    professional_light.FhBorders.sm,
    professional_dark.FhBorders.sm,
  ];

  static const List<Border> md = <Border>[
    consumer_light.FhBorders.md,
    consumer_dark.FhBorders.md,
    professional_light.FhBorders.md,
    professional_dark.FhBorders.md,
  ];

  static const List<Border> lg = <Border>[
    consumer_light.FhBorders.lg,
    consumer_dark.FhBorders.lg,
    professional_light.FhBorders.lg,
    professional_dark.FhBorders.lg,
  ];
}
