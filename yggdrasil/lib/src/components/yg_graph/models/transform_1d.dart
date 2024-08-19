/// A simple transform which applies both a scale and translate (in that order).
class Transform1D {
  const Transform1D({
    required this.scale,
    required this.offset,
  });

  static const Transform1D zero = Transform1D(
    scale: 1,
    offset: 0,
  );

  final double scale;
  final double offset;

  double apply(double t) {
    return (scale * t) + offset;
  }
}
