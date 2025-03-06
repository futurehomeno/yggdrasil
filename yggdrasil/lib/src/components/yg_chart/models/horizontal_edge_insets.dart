class HorizontalEdgeInsets {
  const HorizontalEdgeInsets.all(double value)
      : left = value,
        right = value;

  const HorizontalEdgeInsets.only({
    required this.left,
    required this.right,
  });

  static const HorizontalEdgeInsets zero = HorizontalEdgeInsets.all(0);

  /// The offset from the left.
  final double left;

  /// The offset from the right.
  final double right;
}
