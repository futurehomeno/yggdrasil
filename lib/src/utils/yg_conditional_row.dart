import 'package:flutter/material.dart';

class YgConditionalRow extends Row {
  YgConditionalRow({
    required this.conditionalChildren,
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
  }) : super(
          children: conditionalChildren.whereType<Widget>().toList(),
        );

  final List<Widget?> conditionalChildren;
}
