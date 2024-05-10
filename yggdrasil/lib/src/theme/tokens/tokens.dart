import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'extensions/_extensions.dart';

part 'tokens.tailor.dart';

@tailorComponent
class _$YgTokens {
  @themeExtension
  static final List<YgBorder> borders = YgBorder.themes;

  @themeExtension
  static final List<YgColor> colors = YgColor.themes;

  @themeExtension
  static final List<YgDimension> dimensions = YgDimension.themes;

  @themeExtension
  static final List<YgGradient> gradients = YgGradient.themes;

  @themeExtension
  static final List<YgRadius> radii = YgRadius.themes;

  @themeExtension
  static final List<YgTextStyle> textStyles = YgTextStyle.themes;
}
