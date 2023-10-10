import 'package:flutter/material.dart';

import '_yg_states.dart';

// ignore: avoid-dynamic
typedef YgDynamicAnimatedProperty<T extends Enum> = YgAnimatedProperty<T, dynamic>;
typedef YgStatesResolver<T extends Enum, V> = V Function(Set<T> states);

abstract class YgAnimatedStyle<T extends Enum> extends Animation<double> with AnimationWithParentMixin<double> {
  YgAnimatedStyle({
    required YgStatesController<T> controller,
    required TickerProviderStateMixin vsync,
  })  : _statesController = controller,
        _state = vsync {
    _animationController = AnimationController(
      vsync: vsync,
      duration: duration,
    );

    _statesController.addListener(_handleStateChange);

    for (final YgDynamicAnimatedProperty<T> property in properties) {
      property.resolve(
        _state.context,
        controller.states,
      );
    }
  }

  late AnimationController _animationController;
  late final Curve _curve = curve;

  final YgStatesController<T> _statesController;
  final State _state;

  BuildContext get context => _state.context;

  @override
  Animation<double> get parent => _animationController;

  @override
  double get value => _curve.transform(_animationController.value);

  void dispose() {
    _statesController.removeListener(_handleStateChange);
    _animationController.dispose();
  }

  void _handleStateChange() {
    final Set<T> states = _statesController.states;
    bool shouldAnimate = false;

    for (final YgDynamicAnimatedProperty<T> property in properties) {
      shouldAnimate |= property.resolve(
        context,
        states,
      );
    }

    if (shouldAnimate) {
      _animationController.forward(from: 0);
    }
  }

  Set<YgDynamicAnimatedProperty<T>> get properties;

  Duration get duration;

  Curve get curve;
}
