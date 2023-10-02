// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/yg_gradients.dart';

/// YGG version of [UnderlineTabIndicator].
///
/// The [UnderlineTabIndicator] contains an issue where if
/// the indicator gets too large, it covers up the bottom border
/// of the [TabBar].
class YgUnderlineTabIndicator extends Decoration {
  const YgUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 5.0),
    this.insets = EdgeInsets.zero,
  });

  /// See [UnderlineTabIndicator].
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is YgUnderlineTabIndicator) {
      return YgUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
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
      );
    }

    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _YgUnderlinePainter(this, onChanged);
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
    super.onChanged,
  );

  final YgUnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // Config size is given as 43 by 51.

    assert(configuration.size != null);

    final Rect rect = offset & configuration.size!;

    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration._indicatorRectFor(rect, textDirection).inflate(decoration.borderSide.width / 4.0);
    final RRect rrect = RRect.fromRectAndCorners(
      indicator,
      topLeft: const Radius.circular(5.0),
      topRight: const Radius.circular(5.0),
      bottomRight: Radius.zero,
      bottomLeft: Radius.zero,
    );

    final Paint paint;
    paint = Paint()..shader = YgGradient.professionalLight.actionPrimaryDefault.createShader(rrect.outerRect);

    canvas.drawRRect(rrect, paint);
  }
}
