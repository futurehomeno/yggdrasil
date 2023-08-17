import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'yg_dimensions.tailor.dart';

@tailorComponent
class _$YgDimension {
  static const List<double> none = <double>[
    consumer_light.FhDimensions.none,
    consumer_dark.FhDimensions.none,
    professional_light.FhDimensions.none,
    professional_dark.FhDimensions.none,
  ];
  static const List<double> xxs = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];
  static const List<double> xs = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
  static const List<double> sm = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];
  static const List<double> md = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];
  static const List<double> lg = <double>[
    consumer_light.FhDimensions.lg,
    consumer_dark.FhDimensions.lg,
    professional_light.FhDimensions.lg,
    professional_dark.FhDimensions.lg,
  ];
  static const List<double> xl = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];
  static const List<double> xxl = <double>[
    consumer_light.FhDimensions.xxl,
    consumer_dark.FhDimensions.xxl,
    professional_light.FhDimensions.xxl,
    professional_dark.FhDimensions.xxl,
  ];
}
