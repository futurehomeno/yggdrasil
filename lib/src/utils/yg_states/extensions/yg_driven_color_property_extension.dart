import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

extension YgDrivenColorPropertyExtension on YgDrivenColorProperty {
  YgDrivenDecorationProperty toDecoration() {
    return YgDrivenPropertyWithParent<Color, Decoration>.fromMapper(
      this,
      (Color color) => BoxDecoration(
        color: color,
      ),
    );
  }
}
