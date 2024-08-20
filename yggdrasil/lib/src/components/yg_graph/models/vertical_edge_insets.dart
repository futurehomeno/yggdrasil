class VerticalEdgeInsets {
  const VerticalEdgeInsets.only({
    required this.top,
    required this.bottom,
  });

  const VerticalEdgeInsets.all(double value)
      : top = value,
        bottom = value;

  /// The offset from the top.
  final double top;

  /// The offset from the bottom.
  final double bottom;
}
