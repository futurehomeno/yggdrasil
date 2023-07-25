import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  static final Expando<double> _computedHeightExpando = Expando<double>();

  TextStyle lerp(TextStyle b, double t) {
    return TextStyle.lerp(this, b, t)!;
  }

  /// Computes the actual height of the [TextStyle].
  ///
  /// ! --- WARNING ---
  /// This getter can be very expensive when used for the first time if the
  /// [fontSize] and [height] are not defined, as this will create and compute
  /// the layout of a [TextPainter] and return the computed height.
  ///
  ///
  double get computedHeight {
    final double? height = this.height;
    final double? fontSize = this.fontSize;

    if (height != null && fontSize != null) {
      return height * fontSize;
    }

    // Looks for a previously generated height for this exact textStyle to
    // prevent unnecessary expensive recomputation.
    double? computedHeight = _computedHeightExpando[this];

    if (computedHeight != null) {
      return computedHeight;
    }

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: '', style: this),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );

    computedHeight = textPainter.size.height;

    _computedHeightExpando[this] = computedHeight;

    return computedHeight;
  }
}
