import 'package:flutter/material.dart';

class YgBottomSheetScrollPhysics extends ScrollPhysics {
  /// Creates scroll physics that does not let the user scroll.
  const YgBottomSheetScrollPhysics({
    super.parent,
    required this.transformScroll,
    required this.handleScrollStop,
  });

  final double Function(double scrollAmount, ScrollMetrics metrics) transformScroll;
  final bool Function(double velocity, ScrollMetrics metrics) handleScrollStop;

  @override
  YgBottomSheetScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return YgBottomSheetScrollPhysics(
      parent: buildParent(ancestor),
      transformScroll: transformScroll,
      handleScrollStop: handleScrollStop,
    );
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return transformScroll(
      super.applyPhysicsToUserOffset(position, offset),
      position,
    );
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if (!handleScrollStop(velocity, position)) {
      return super.createBallisticSimulation(position, 0);
    }

    return super.createBallisticSimulation(position, velocity);
  }
}
