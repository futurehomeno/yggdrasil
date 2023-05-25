import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'extensions/_extensions.dart';

part 'tokens.tailor.dart';

@tailorComponent
class _$YgTokens {
  @themeExtension
  static List<YgBorder> borders = YgBorder.themes;

  @themeExtension
  static List<YgColor> colors = YgColor.themes;

  @themeExtension
  static List<YgDimension> dimensions = YgDimension.themes;

  @themeExtension
  static List<YgGradient> gradients = YgGradient.themes;

  @themeExtension
  static List<YgRadius> radii = YgRadius.themes;

  @themeExtension
  static List<YgShadow> shadows = YgShadow.themes;

  @themeExtension
  static List<YgTextStyle> textStyles = YgTextStyle.themes;
}
