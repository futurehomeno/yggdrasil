class DataPoint<N extends num> {
  const DataPoint({
    required this.index,
    required this.value,
  });

  final N index;
  final double value;
}
