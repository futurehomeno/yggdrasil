/// A single interval.
class YgInterval {
  const YgInterval({
    required this.position,
    required this.precision,
    this.fade = 1,
  });

  /// The position of this interval on the range of the axis it applies to.
  final double position;

  /// A value which should be used to fade in or out anything using this interval.
  final double fade;

  final int precision;
}
