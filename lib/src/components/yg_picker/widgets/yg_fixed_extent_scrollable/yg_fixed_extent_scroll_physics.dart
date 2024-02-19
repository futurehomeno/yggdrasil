import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '_yg_fixed_extent_scrollable.dart';

/// A snapping physics that always lands directly on items instead of anywhere
/// within the scroll extent.
///
/// Behaves similarly to a slot machine wheel except the ballistics simulation
/// never overshoots and rolls back within a single item if it's to settle on
/// that item.
///
/// Must be used with a scrollable that uses a [ViewportOffset].
///
/// Defers back to the parent beyond the scroll extents.
class YgFixedExtentScrollPhysics extends ScrollPhysics {
  /// Creates a scroll physics that always lands on items.
  const YgFixedExtentScrollPhysics({super.parent});

  @override
  YgFixedExtentScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return YgFixedExtentScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    assert(
      position is YgFixedExtentScrollPosition,
      'FixedExtentScrollPhysics can only be used with Scrollables that uses '
      'the FixedExtentScrollController',
    );

    final YgFixedExtentScrollPosition metrics = position as YgFixedExtentScrollPosition;

    // Scenario 1:
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at the scrollable's boundary.
    if ((velocity <= 0.0 && metrics.pixels <= metrics.minScrollExtent) ||
        (velocity >= 0.0 && metrics.pixels >= metrics.maxScrollExtent)) {
      return super.createBallisticSimulation(metrics, velocity);
    }

    // Create a test simulation to see where it would have ballistically fallen
    // naturally without settling onto items.
    final Simulation? testFrictionSimulation = super.createBallisticSimulation(metrics, velocity);

    // Scenario 2:
    // If it was going to end up past the scroll extent, defer back to the
    // parent physics' ballistics again which should put us on the scrollable's
    // boundary.
    if (testFrictionSimulation != null &&
        (testFrictionSimulation.x(double.infinity) == metrics.minScrollExtent ||
            testFrictionSimulation.x(double.infinity) == metrics.maxScrollExtent)) {
      return super.createBallisticSimulation(metrics, velocity);
    }

    // From the natural final position, find the nearest item it should have
    // settled to.
    final int settlingItemIndex = YgFixedExtendUtils.getItemFromOffset(
      offset: testFrictionSimulation?.x(double.infinity) ?? metrics.pixels,
      itemExtent: metrics.itemExtent,
      minScrollExtent: metrics.minScrollExtent,
      maxScrollExtent: metrics.maxScrollExtent,
    );

    final double settlingPixels = settlingItemIndex * metrics.itemExtent;

    // Scenario 3:
    // If there's no velocity and we're already at where we intend to land,
    // do nothing.
    if (velocity.abs() < toleranceFor(position).velocity &&
        (settlingPixels - metrics.pixels).abs() < toleranceFor(position).distance) {
      return null;
    }

    // Scenario 4:
    // If we're going to end back at the same item because initial velocity
    // is too low to break past it, use a spring simulation to get back.
    if (settlingItemIndex == metrics.itemIndex) {
      return SpringSimulation(
        spring,
        metrics.pixels,
        settlingPixels,
        velocity,
        tolerance: toleranceFor(position),
      );
    }

    // Scenario 5:
    // Create a new friction simulation except the drag will be tweaked to land
    // exactly on the item closest to the natural stopping point.
    return FrictionSimulation.through(
      metrics.pixels,
      settlingPixels,
      velocity,
      toleranceFor(position).velocity * velocity.sign,
    );
  }
}
