import 'package:flutter/material.dart';

/// YGG version of [UnderlineTabIndicator].
///
/// The M3 [UnderlineTabIndicator] contains an issue where if
/// the indicator gets too large, it covers up the bottom border
/// of the [TabBar].
class YgUnderlineTabIndicator extends Decoration {
  const YgUnderlineTabIndicator({
    required this.gradient,
    required this.borderSide,
    this.insets = EdgeInsets.zero,
  });

  /// Gradient og the TabBar indicator.
  final Gradient gradient;

  /// See [UnderlineTabIndicator].
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is YgUnderlineTabIndicator) {
      return YgUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
        gradient: gradient,
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is YgUnderlineTabIndicator) {
      return YgUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
        gradient: gradient,
      );
    }

    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _YgUnderlinePainter(this, gradient, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width - 2,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _YgUnderlinePainter extends BoxPainter {
  const _YgUnderlinePainter(
    this.decoration,
    this.gradient,
    super.onChanged,
  );

  final YgUnderlineTabIndicator decoration;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // Config size is given as 43 by 51.

    assert(configuration.size != null);

    final Rect rect = offset & configuration.size!;

    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration._indicatorRectFor(rect, textDirection).inflate(decoration.borderSide.width / 4.0);
    final RRect rRect = RRect.fromRectAndCorners(
      indicator,
      topLeft: const Radius.circular(5.0),
      topRight: const Radius.circular(5.0),
      bottomRight: Radius.zero,
      bottomLeft: Radius.zero,
    );

    final Paint paint;
    paint = Paint()..shader = gradient.createShader(rRect.outerRect);

    canvas.drawRRect(rRect, paint);
  }
}
