import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/yg_color.dart';
import 'package:yggdrasil/yggdrasil.dart';

class TokenColorMapper extends ColorMapper {
  const TokenColorMapper({
    required this.colors,
    required this.fallbackColor,
  });

  final YgColor colors;
  final Color fallbackColor;

  @override
  Color substitute(String? id, String elementName, String attributeName, Color color) {
    if (id == null) {
      return fallbackColor;
    }

    return YgColors.getColorFromString(
          colors: colors,
          colorName: id,
        ) ??
        fallbackColor;
  }
}
