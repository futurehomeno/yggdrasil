part of 'yg_segmented_button.dart';

class _YgSegmentedButtonMultiSelect<T extends Object?> extends YgSegmentedButton<T> {
  const _YgSegmentedButtonMultiSelect({
    super.key,
    required super.segments,
    required this.value,
    required this.onValueChanged,
  }) : super._();

  final Set<T> value;
  final ValueChanged<Set<T>> onValueChanged;

  @override
  bool _isSegmentSelected(YgButtonSegment<T> segment) {
    return value.contains(segment.value);
  }

  @override
  void _onSegmentPressed(YgButtonSegment<T> segment) {
    final Set<T> newSet = Set<T>.of(value);

    if (!newSet.add(segment.value)) {
      newSet.remove(segment.value);
    }

    onValueChanged(newSet);
  }
}
