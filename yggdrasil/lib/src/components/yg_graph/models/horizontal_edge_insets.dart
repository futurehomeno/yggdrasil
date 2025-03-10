class HorizontalEdgeInsets {
  const HorizontalEdgeInsets.only({
    required this.left,
    required this.right,
  });

  const HorizontalEdgeInsets.all(double value)
      : left = value,
        right = value;

  /// The offset from the left.
  final double left;

  /// The offset from the right.
  final double right;
}
