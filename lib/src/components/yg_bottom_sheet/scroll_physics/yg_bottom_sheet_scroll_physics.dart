import 'package:flutter/material.dart';

/// Custom scroll physics for the [YgBottomSheet].
///
/// Allows for integrating the swipe which controls the scroll with the movement
/// of the [YgModalBottomSheet] position.
class YgBottomSheetScrollPhysics extends ScrollPhysics {
  const YgBottomSheetScrollPhysics({
    super.parent,
    required this.handleScrollSwipeUpdate,
    required this.handleScrollSwipeEnd,
  });

  /// Callback for when the user swipes in the scrollable area.
  ///
  /// Gets passed the [ScrollMetrics] and the amount which the swipe would
  /// scroll the page.
  ///
  /// Should return true if the swipe should scroll the page.
  final bool Function(ScrollMetrics metrics, double scrollAmount) handleScrollSwipeUpdate;

  /// Callback for when the user has stopped swiping in the scrollable area.
  ///
  /// Gets passed the [ScrollMetrics] and the average velocity of the swipe.
  ///
  /// Should return true if the the content of the scrollable area should be
  /// flung using the scroll velocity.
  final bool Function(ScrollMetrics metrics, double velocity) handleScrollSwipeEnd;

  @override
  YgBottomSheetScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return YgBottomSheetScrollPhysics(
      parent: buildParent(ancestor),
      handleScrollSwipeUpdate: handleScrollSwipeUpdate,
      handleScrollSwipeEnd: handleScrollSwipeEnd,
    );
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    final double defaultUserOffset = super.applyPhysicsToUserOffset(position, offset);

    final bool shouldScroll = handleScrollSwipeUpdate(
      position,
      defaultUserOffset,
    );

    if (shouldScroll) {
      return defaultUserOffset;
    }

    return 0;
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    final bool shouldDoBallisticsSimulation = handleScrollSwipeEnd(
      position,
      velocity,
    );

    return super.createBallisticSimulation(
      position,
      shouldDoBallisticsSimulation ? velocity : 0,
    );
  }
}
