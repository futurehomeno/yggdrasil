part of buttons;


class _YgSegmentedButtonMultiSelect<T extends Object?> extends YgSegmentedButton<T> {
  const _YgSegmentedButtonMultiSelect({
    super.key,
    required super.segments,
    required this.value,
    required this.onValueChanged,
  }) : super._();

  /// The current set of values selected in this segmented button.
  final Set<T> value;

  /// Called when the user changes his selection of segments.
  final ValueChanged<Set<T>>? onValueChanged;

  @override
  bool _isSegmentSelected(YgButtonSegment<T> segment) {
    return value.contains(segment.value);
  }

  @override
  void _onSegmentPressed(YgButtonSegment<T> segment) {
    final ValueChanged<Set<T>>? onValueChanged = this.onValueChanged;

    if (onValueChanged == null) {
      return;
    }

    final Set<T> newSet = Set<T>.of(value);

    if (!newSet.add(segment.value)) {
      newSet.remove(segment.value);
    }

    onValueChanged(newSet);
  }

  @override
  bool get _disabled => onValueChanged == null;
}
