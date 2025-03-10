abstract interface class YgGraphPoint {
  /// The value of a point, usually rendered on the y axis of the graph.
  double get value;

  /// The index of the value, usually rendered on the x axis of the graph.
  double get index;

  /// Whether the value of this point is a real value.
  ///
  /// For example, when loading real data, fake data may be shown, this data
  /// should not be interactive or be represented as real data.
  bool get real;
}
