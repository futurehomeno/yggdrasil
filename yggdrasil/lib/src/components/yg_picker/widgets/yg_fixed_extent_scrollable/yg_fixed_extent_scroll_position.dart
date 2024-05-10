import 'package:flutter/material.dart';

import '_yg_fixed_extent_scrollable.dart';

/// A [ScrollPositionWithSingleContext] that can only be created based on
/// [YgFixedExtentScrollable] and can access its `itemExtent` to derive [itemIndex].
class YgFixedExtentScrollPosition extends ScrollPositionWithSingleContext implements YgFixedExtentMetrics {
  YgFixedExtentScrollPosition({
    required super.physics,
    required super.context,
    required int initialItem,
    super.oldPosition,
  })  : assert(
          context is YgFixedExtentScrollableState,
          'FixedExtentScrollController can only be used with ListWheelScrollViews',
        ),
        super(
          initialPixels: _getItemExtentFromScrollContext(context) * initialItem,
        );

  static double _getItemExtentFromScrollContext(ScrollContext context) {
    final YgFixedExtentScrollableState scrollable = context as YgFixedExtentScrollableState;

    return scrollable.itemExtent;
  }

  double get itemExtent => _getItemExtentFromScrollContext(context);

  @override
  int get itemIndex {
    return YgFixedExtendUtils.getItemFromOffset(
      offset: pixels,
      itemExtent: itemExtent,
      minScrollExtent: minScrollExtent,
      maxScrollExtent: maxScrollExtent,
    );
  }

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
}
