part of buttons;


class _YgSegmentedButtonSingleSelect<T extends Object?> extends YgSegmentedButton<T> {
  const _YgSegmentedButtonSingleSelect({
    super.key,
    required super.segments,
    required this.value,
    required this.onValueChanged,
  }) : super._();

  /// The current value of this segmented button.
  final T value;

  /// Called when the user selected a different segment.
  final ValueChanged<T>? onValueChanged;

  @override
  bool _isSegmentSelected(YgButtonSegment<T> segment) {
    return segment.value == value;
  }

  @override
  void _onSegmentPressed(YgButtonSegment<T> segment) {
    onValueChanged?.call(segment.value);
  }

  @override
  bool get _disabled => onValueChanged == null;
}
