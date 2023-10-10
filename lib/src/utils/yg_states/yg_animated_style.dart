import 'package:flutter/material.dart';

import '_yg_states.dart';

// ignore: avoid-dynamic
typedef YgDynamicAnimatedProperty<T extends Enum> = YgAnimatedProperty<T, dynamic>;
typedef YgStatesResolver<T extends Enum, V> = V Function(Set<T> states);

class YgAnimatedStyle<T extends Enum> extends Animation<double> with AnimationWithParentMixin<double> {
  YgAnimatedStyle({
    required Curve curve,
    required YgStatesController<T> controller,
    required TickerProviderStateMixin vsync,
    required Duration duration,
  })  : _curve = curve,
        _statesController = controller,
        _animationController = AnimationController(
          vsync: vsync,
          duration: duration,
        ),
        _state = vsync {
    _statesController.addListener(_handleStateChange);
  }

  final YgStatesController<T> _statesController;
  final AnimationController _animationController;
  final State _state;
  final Curve _curve;

  final Set<YgDynamicAnimatedProperty<T>> _properties = <YgDynamicAnimatedProperty<T>>{};

  @override
  Animation<double> get parent => _animationController;

  @override
  double get value => _curve.transform(_animationController.value);

  bool registerProperty<V>(YgAnimatedProperty<T, V> property) {
    return _properties.add(property);
  }

  void dispose() {
    _statesController.removeListener(_handleStateChange);
    _animationController.dispose();
  }

  void _handleStateChange() {
    final Set<T> states = _statesController.states;
    final BuildContext context = _state.context;
    bool shouldAnimate = false;

    for (final YgDynamicAnimatedProperty<T> property in _properties) {
      shouldAnimate |= property.resolve(
        context,
        states,
      );
    }

    if (shouldAnimate) {
      _animationController.forward(from: 0);
    }
  }
}
