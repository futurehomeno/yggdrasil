// ignore_for_file: avoid-unrelated-type-assertions, invalid_use_of_protected_member

import 'package:flutter/rendering.dart';

import '_yg_debug.dart';

mixin YgRenderObjectDebugPainterMixin on RenderObject {
  YgDebugType _type = YgDebugType.other;

  YgDebugType get type => _type;

  set type(YgDebugType newType) {
    if (_type == newType) {
      return;
    }

    if (YgDebug.isEnabled(type) != YgDebug.isEnabled(newType) && attached) {
      markNeedsPaint();
    }

    _type = newType;
  }

  static final Paint _layoutPaint = Paint()
    ..color = const Color(0x800080ff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  static final Paint _intractablePaint = Paint()
    ..color = const Color(0x80ff8000)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  static final Paint _otherPaint = Paint()
    ..color = const Color(0x80ff00ff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.square;

  void _paintYgDebug({
    required PaintingContext context,
    required Offset offset,
    required Size size,
  }) {
    final Path path = Path();

    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx + size.width, offset.dy);
    path.lineTo(offset.dx + size.width, size.height + offset.dy);
    path.lineTo(offset.dx, size.height + offset.dy);
    path.lineTo(offset.dx, offset.dy);

    final Paint paint = switch (_type) {
      YgDebugType.intractable => _intractablePaint,
      YgDebugType.layout => _layoutPaint,
      YgDebugType.other => _otherPaint,
    };

    context.canvas.drawPath(path, paint);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (YgDebug.isEnabled(type)) {
      _paintYgDebug(
        context: context,
        offset: offset,
        size: switch (this) {
          RenderBox(:final Size size) => size,
          // ignore: invalid_use_of_protected_member
          RenderSliver(:final Size Function() getAbsoluteSize) => getAbsoluteSize(),
          _ => Size.zero,
        },
      );
    }
    super.paint(context, offset);
  }
}
