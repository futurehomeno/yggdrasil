class Transform1D {
  double _translation = 0.0;
  double _scale = 1.0;

  void scale(double scale) {
    _translation *= scale;
    _scale *= scale;
  }

  void translate(double translation) {
    _translation += translation;
  }

  void reset() {
    _translation = 0.0;
    _scale = 1.0;
  }

  double apply(double value) {
    return (value * _scale) + _translation;
  }

  @override
  int get hashCode => Object.hash(
        _translation,
        _scale,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Transform1D && _translation == other._translation && _scale == other._scale);
}
