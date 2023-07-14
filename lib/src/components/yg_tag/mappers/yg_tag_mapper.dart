import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tag/_yg_tag.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgTagMapper {
  const YgTagMapper._();

  static EdgeInsets buildPadding({
    required BuildContext context,
    required YgTagSize tagSize,
  }) {
    switch (tagSize) {
      case YgTagSize.small:
        return context.tagTheme.paddingSmall;
      case YgTagSize.medium:
        return context.tagTheme.paddingMedium;
    }
  }
}
