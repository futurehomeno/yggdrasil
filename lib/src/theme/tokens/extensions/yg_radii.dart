import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'yg_radii.tailor.dart';

@tailorComponent
class _$YgRadius {
  static const List<BorderRadius> none = [
    consumer_light.FhRadii.none,
    consumer_dark.FhRadii.none,
    professional_light.FhRadii.none,
    professional_dark.FhRadii.none,
  ];
  static const List<BorderRadius> xxs = [
    consumer_light.FhRadii.xxs,
    consumer_dark.FhRadii.xxs,
    professional_light.FhRadii.xxs,
    professional_dark.FhRadii.xxs,
  ];
  static const List<BorderRadius> xs = [
    consumer_light.FhRadii.xs,
    consumer_dark.FhRadii.xs,
    professional_light.FhRadii.xs,
    professional_dark.FhRadii.xs,
  ];
  static const List<BorderRadius> sm = [
    consumer_light.FhRadii.sm,
    consumer_dark.FhRadii.sm,
    professional_light.FhRadii.sm,
    professional_dark.FhRadii.sm,
  ];
  static const List<BorderRadius> md = [
    consumer_light.FhRadii.md,
    consumer_dark.FhRadii.md,
    professional_light.FhRadii.md,
    professional_dark.FhRadii.md,
  ];
  static const List<BorderRadius> lg = [
    consumer_light.FhRadii.lg,
    consumer_dark.FhRadii.lg,
    professional_light.FhRadii.lg,
    professional_dark.FhRadii.lg,
  ];
  static const List<BorderRadius> xl = [
    consumer_light.FhRadii.xl,
    consumer_dark.FhRadii.xl,
    professional_light.FhRadii.xl,
    professional_dark.FhRadii.xl,
  ];
  static const List<BorderRadius> xxl = [
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];
}
