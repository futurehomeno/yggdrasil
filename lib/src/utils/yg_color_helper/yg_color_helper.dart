import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/_generated.dart';

class YgColorHelper {
  static Color getColorFromString({
    required BuildContext context,
    required String colorName,
  }) {
    final Color? color = YgColors.getColor(
      context: context,
      colorName: colorName,
    );
    if (color == null) {
      throw Exception('Color $colorName not found');
    }

    return color;
  }
}
