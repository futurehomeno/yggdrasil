import 'package:flutter/material.dart';

/// Data used by the [YgPickerColumn] to render correctly.
class YgPickerColumnInheritedData extends InheritedWidget {
  const YgPickerColumnInheritedData({
    super.key,
    required super.child,
    required this.rowHeight,
    required this.alignment,
    required this.metric,
  });

  /// The height of a row.
  final double rowHeight;

  /// The alignment of the column values.
  final MainAxisAlignment alignment;

  /// Whether the column has a metric.
  final String? metric;

  @override
  bool updateShouldNotify(covariant YgPickerColumnInheritedData oldWidget) {
    return rowHeight != oldWidget.rowHeight || alignment != oldWidget.alignment || metric != oldWidget.metric;
  }

  // ignore: prefer-widget-private-members
  static YgPickerColumnInheritedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgPickerColumnInheritedData>()!;
  }
}
