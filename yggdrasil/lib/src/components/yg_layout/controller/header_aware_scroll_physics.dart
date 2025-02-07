import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

import 'yg_layout_header_controller.dart';

class HeaderAwareScrollPhysics extends ScrollPhysics {
  const HeaderAwareScrollPhysics({
    required this.controller,
    super.parent,
  });

  final YgLayoutBodyController controller;

  @override
  HeaderAwareScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return HeaderAwareScrollPhysics(
      parent: buildParent(ancestor),
      controller: controller,
    );
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Scenario 1:
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at the scrollable's boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    // Create a test simulation to see where it would have ballistically fallen
    // naturally.
    final Simulation? defaultSimulation = super.createBallisticSimulation(position, velocity);
    final double naturalEndPosition = defaultSimulation?.x(double.infinity) ?? position.pixels;

    // Scenario 2:
    // If it was going to end up past the scroll extent, defer back to the
    // parent physics' ballistics again which should put us on the scrollable's
    // boundary.
    if (defaultSimulation != null &&
        (naturalEndPosition == position.minScrollExtent || naturalEndPosition == position.maxScrollExtent)) {
      return defaultSimulation;
    }

    final Tolerance tolerance = toleranceFor(position);

    // Scenario 3:
    // If there's no velocity and we're already at where we intend to land,
    // do nothing.
    if (velocity.abs() < tolerance.velocity && controller.getDesiredOffsetFromDelta(0).abs() < tolerance.distance) {
      return null;
    }

    final double defaultDelta = naturalEndPosition - position.pixels;
    final double desiredOffsetFromNaturalEndPosition = controller.getDesiredOffsetFromDelta(defaultDelta);
    final double desiredEndPosition = naturalEndPosition + desiredOffsetFromNaturalEndPosition;
    final double desiredDelta = desiredEndPosition - position.pixels;

    // There is no desired offset from the default simulation, so we can just
    // use the default simulation.
    if (desiredOffsetFromNaturalEndPosition.abs() < tolerance.distance) {
      return defaultSimulation;
    }

    // The velocity is going in to the opposite direction from the desired delta,
    // so we create a spring to go back to the desired position
    if (velocity.sign != desiredDelta.sign) {
      return SpringSimulation(
        spring,
        position.pixels,
        desiredEndPosition,
        velocity,
        tolerance: toleranceFor(position),
      );
    }

    return FrictionSimulation.through(
      position.pixels,
      desiredEndPosition,
      velocity,
      toleranceFor(position).velocity * velocity.sign,
    );
  }
}
