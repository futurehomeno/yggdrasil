import 'package:flutter/rendering.dart';

class Transform2D {
  double _xTranslation = 0.0;
  double _xScale = 1.0;
  double _yTranslation = 0.0;
  double _yScale = 1.0;

  // Scale both x and y
  void scale(double x, double y) {
    _xTranslation *= x;
    _yTranslation *= y;
    _xScale *= x;
    _yScale *= y;
  }

  // Translate both x and y
  void translate(double x, double y) {
    _xTranslation += x;
    _yTranslation += y;
  }

  void reset() {
    _xTranslation = 0.0;
    _xScale = 1.0;
    _yTranslation = 0.0;
    _yScale = 1.0;
  }

  Offset apply(Offset value) {
    return Offset(
      (value.dx * _xScale) + _xTranslation,
      (value.dy * _yScale) + _yTranslation,
    );
  }

  @override
  int get hashCode => Object.hash(
        _xTranslation,
        _yTranslation,
        _xScale,
        _yScale,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transform2D &&
          _xTranslation == other._xTranslation &&
          _yTranslation == other._yTranslation &&
          _xScale == other._xScale &&
          _yScale == other._yScale);
}
