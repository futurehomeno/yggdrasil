import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'extensions/_extensions.dart';

part 'tokens.tailor.dart';

@tailorComponent
class _$YgTokens {
  @themeExtension
  static const List<YgBorder> borders = YgBorder.themes;

  @themeExtension
  static const List<YgColor> colors = YgColor.themes;

  @themeExtension
  static const List<YgDimension> dimensions = YgDimension.themes;

  @themeExtension
  static const List<YgGradient> gradients = YgGradient.themes;

  @themeExtension
  static const List<YgRadius> radii = YgRadius.themes;

  @themeExtension
  static const List<YgShadow> shadows = YgShadow.themes;

  @themeExtension
  static const List<YgTextStyle> textStyles = YgTextStyle.themes;
}
