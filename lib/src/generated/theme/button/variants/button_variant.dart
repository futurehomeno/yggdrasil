import 'package:flutter/material.dart';

abstract class ButtonVariant<T extends ButtonVariant<T>> extends ThemeExtension<T> {
  const ButtonVariant({
    required this.borderDefaultColor1,
    required this.borderDefaultColor2,
    required this.borderHoverColor1,
    required this.borderHoverColor2,
    required this.borderPressedColor1,
    required this.borderPressedColor2,
    required this.borderDisabledColor1,
    required this.borderDisabledColor2,
    required this.textDefaultColor,
    required this.iconDefaultColor,
  });

  final Color borderDefaultColor1;
  final Color borderDefaultColor2;
  final Color borderHoverColor1;
  final Color borderHoverColor2;
  final Color borderPressedColor1;
  final Color borderPressedColor2;
  final Color borderDisabledColor1;
  final Color borderDisabledColor2;
  final Color textDefaultColor;
  final Color iconDefaultColor;

  @override
  T lerp(covariant ThemeExtension<T>? other, double t);

  @override
  T copyWith({
    Color? borderDefaultColor1,
    Color? borderDefaultColor2,
    Color? borderHoverColor1,
    Color? borderHoverColor2,
    Color? borderPressedColor1,
    Color? borderPressedColor2,
    Color? borderDisabledColor1,
    Color? borderDisabledColor2,
    Color? textDefaultColor,
    Color? iconDefaultColor,
  });
}
