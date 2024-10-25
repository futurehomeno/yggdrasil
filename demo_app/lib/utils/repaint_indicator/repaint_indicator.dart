import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepaintIndicator extends SingleChildRenderObjectWidget {
  const RepaintIndicator({
    super.key,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RepaintIndicatorRenderer();
  }
}

class RepaintIndicatorRenderer extends RenderProxyBox {
  final _random = Random();
  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(
        255,
        (_random.nextDouble() * 255).toInt(),
        (_random.nextDouble() * 255).toInt(),
        (_random.nextDouble() * 255).toInt(),
      );

    context.canvas.drawRect(offset & size, paint);
    super.paint(context, offset);
  }
}
