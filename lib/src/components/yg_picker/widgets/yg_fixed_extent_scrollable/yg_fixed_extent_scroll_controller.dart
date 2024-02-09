import 'package:flutter/material.dart';

import '_yg_fixed_extent_scrollable.dart';

/// A controller for scroll views whose items have the same size.
///
/// Similar to a standard [ScrollController] but with the added convenience
/// mechanisms to read and go to item indices rather than a raw pixel scroll
/// offset.
///
/// See also:
///
///  * [YgListWheelScrollView], a scrollable view widget with fixed size items
///    that this widget controls.
///  * [YgFixedExtentMetrics], the `metrics` property exposed by
///    [ScrollNotification] from [YgListWheelScrollView] which can be used
///    to listen to the current item index on a push basis rather than polling
///    the [YgFixedExtentScrollController].
class YgFixedExtentScrollController extends ScrollController {
  /// Creates a scroll controller for scrollables whose items have the same size.
  ///
  /// [initialItem] defaults to zero.
  YgFixedExtentScrollController({
    this.initialItem = 0,
    super.onAttach,
    super.onDetach,
  });

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to zero.
  int initialItem;

  /// The currently selected item index that's closest to the center of the viewport.
  ///
  /// There are circumstances that this [YgFixedExtentScrollController] can't know
  /// the current item. Reading [selectedItem] will throw an [AssertionError] in
  /// the following cases:
  ///
  /// 1. No scroll view is currently using this [YgFixedExtentScrollController].
  /// 2. More than one scroll views using the same [YgFixedExtentScrollController].
  ///
  /// The [hasClients] property can be used to check if a scroll view is
  /// attached prior to accessing [selectedItem].
  int get selectedItem {
    assert(
      positions.isNotEmpty,
      'FixedExtentScrollController.selectedItem cannot be accessed before a '
      'scroll view is built with it.',
    );
    assert(
      positions.length == 1,
      'The selectedItem property cannot be read when multiple scroll views are '
      'attached to the same FixedExtentScrollController.',
    );
    final YgFixedExtentScrollPosition position = this.position as YgFixedExtentScrollPosition;

    return position.itemIndex;
  }

  /// Animates the controlled scroll view to the given item index.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToItem(
    int itemIndex, {
    required Duration duration,
    required Curve curve,
  }) async {
    if (!hasClients) {
      return;
    }

    await Future.wait<void>(<Future<void>>[
      for (final YgFixedExtentScrollPosition position in positions.cast<YgFixedExtentScrollPosition>())
        position.animateTo(
          itemIndex * position.itemExtent,
          duration: duration,
          curve: curve,
        ),
    ]);
  }

  /// Changes which item index is centered in the controlled scroll view.
  ///
  /// Jumps the item index position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToItem(int itemIndex) {
    for (final YgFixedExtentScrollPosition position in positions.cast<YgFixedExtentScrollPosition>()) {
      position.jumpTo(itemIndex * position.itemExtent);
    }
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics, ScrollContext context, ScrollPosition? oldPosition) {
    return YgFixedExtentScrollPosition(
      physics: physics,
      context: context,
      initialItem: initialItem,
      oldPosition: oldPosition,
    );
  }
}
