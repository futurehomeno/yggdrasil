import 'package:flutter/material.dart';

/// Metrics for a [YgFixedExtentScrollPosition] to a scroll view with fixed item
/// sizes.
class YgFixedExtentMetrics extends FixedScrollMetrics {
  /// Creates an immutable snapshot of values associated with a
  /// [YgListWheelScrollView].
  YgFixedExtentMetrics({
    required super.minScrollExtent,
    required super.maxScrollExtent,
    required super.pixels,
    required super.viewportDimension,
    required super.axisDirection,
    required this.itemIndex,
    required super.devicePixelRatio,
  });

  @override
  YgFixedExtentMetrics copyWith({
    double? minScrollExtent,
    double? maxScrollExtent,
    double? pixels,
    double? viewportDimension,
    AxisDirection? axisDirection,
    int? itemIndex,
    double? devicePixelRatio,
  }) {
    return YgFixedExtentMetrics(
      minScrollExtent: minScrollExtent ?? (hasContentDimensions ? this.minScrollExtent : null),
      maxScrollExtent: maxScrollExtent ?? (hasContentDimensions ? this.maxScrollExtent : null),
      pixels: pixels ?? (hasPixels ? this.pixels : null),
      viewportDimension: viewportDimension ?? (hasViewportDimension ? this.viewportDimension : null),
      axisDirection: axisDirection ?? this.axisDirection,
      itemIndex: itemIndex ?? this.itemIndex,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
    );
  }

  /// The scroll view's currently selected item index.
  final int itemIndex;
}
