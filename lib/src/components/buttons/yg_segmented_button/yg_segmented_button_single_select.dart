part of 'yg_segmented_button.dart';

class _YgSegmentedButtonSingleSelect<T extends Object?> extends YgSegmentedButton<T> {
  const _YgSegmentedButtonSingleSelect({
    super.key,
    required super.segments,
    required this.value,
    required this.onValueChanged,
  }) : super._();

  final T value;
  final ValueChanged<T> onValueChanged;

  @override
  bool _isSegmentSelected(YgButtonSegment<T> segment) {
    return segment.value == value;
  }

  @override
  void _onSegmentPressed(YgButtonSegment<T> segment) {
    onValueChanged(segment.value);
  }
}
