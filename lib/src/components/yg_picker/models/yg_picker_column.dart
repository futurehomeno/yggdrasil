part of '../yg_picker.dart';

/// A [YgPicker] column.
class YgPickerColumn<T extends Object> {
  const YgPickerColumn({
    required this.entries,
    this.onChange,
    this.onEditingComplete,
    this.onRollover,
    this.initialValue,
    this.looping = false,
  });

  /// The initial value selected in the column.
  final T? initialValue;

  /// Called when the value changes.
  final ValueChanged<T>? onChange;

  /// Called once the user has completed editing this column.
  ///
  /// In practice this means when the user has stopped scrolling and the scroll
  /// animation has ended. After this event has been fired it's guaranteed the
  /// value will not change again, unless the user starts a new scroll.
  final ValueChanged<T>? onEditingComplete;

  /// Called with the int 1 when the value loops around from the last to first
  /// value, and called with -1 when the value loops around from the first to
  /// last value.
  final ValueChanged<int>? onRollover;

  /// All the entries shown in the column.
  final List<YgPickerEntry<T>> entries;

  /// Whether the values loop around.
  final bool looping;

  /// Creates a column widget with the correct type argument.
  YgPickerColumnWidget<T> _createWidget({
    required double rowHeight,
    required MainAxisAlignment alignment,
    required String? metric,
  }) {
    return YgPickerColumnWidget<T>(
      rowHeight: rowHeight,
      column: this,
      alignment: alignment,
      metric: metric,
      looping: looping,
    );
  }
}
