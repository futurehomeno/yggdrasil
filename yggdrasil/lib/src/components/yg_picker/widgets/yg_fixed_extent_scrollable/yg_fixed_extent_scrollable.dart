import 'package:flutter/material.dart';

/// A [Scrollable] which must be given its viewport children's item extent
/// size so it can pass it on ultimately to the [YgFixedExtentScrollController].
class YgFixedExtentScrollable extends Scrollable {
  const YgFixedExtentScrollable({
    super.key,
    super.controller,
    super.physics,
    required this.itemExtent,
    required super.viewportBuilder,
    super.restorationId,
    super.scrollBehavior,
  });

  final double itemExtent;

  @override
  YgFixedExtentScrollableState createState() => YgFixedExtentScrollableState();
}

/// This [ScrollContext] is used by [YgFixedExtentScrollPosition] to read the
/// prescribed [itemExtent].
class YgFixedExtentScrollableState extends ScrollableState {
  // ignore: prefer-widget-private-members
  double get itemExtent {
    // Downcast because only _FixedExtentScrollable can make _FixedExtentScrollableState.
    final YgFixedExtentScrollable actualWidget = widget as YgFixedExtentScrollable;

    return actualWidget.itemExtent;
  }
}
