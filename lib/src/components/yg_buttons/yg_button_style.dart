import 'package:flutter/material.dart';

class YgButtonStyle {
  const YgButtonStyle({
    required this.backgroundColor,
    required this.textStyle,
    required this.shape,
    required this.padding,
  });

  final Color backgroundColor;
  final TextStyle textStyle;
  final ShapeBorder shape;
  final EdgeInsets padding;
}
