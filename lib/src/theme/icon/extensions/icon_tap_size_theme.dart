import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'icon_tap_size_theme.tailor.dart';

@tailorComponent
class _$YgIconTapSizeTheme {
  static const List<double> larger = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];

  static const List<double> largest = <double>[
    consumer_light.FhDimensions.xxl,
    consumer_dark.FhDimensions.xxl,
    professional_light.FhDimensions.xxl,
    professional_dark.FhDimensions.xxl,
  ];
}
