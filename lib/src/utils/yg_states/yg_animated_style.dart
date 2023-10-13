// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '_yg_states.dart';

typedef YgDynamicAnimatedProperty<T extends Enum> = YgAnimatedProperty<T, dynamic>;
typedef YgStatesResolver<T extends Enum, V> = V Function(Set<T> states);

abstract class YgAnimatedStyle<T extends Enum> extends Animation<double> with AnimationWithParentMixin<double> {
  YgAnimatedStyle({
    required YgStatesController<T> controller,
    required YgUpdateMixin vsync,
  })  : _statesController = controller,
        _state = vsync {
    _animationController = AnimationController(
      vsync: vsync,
      duration: duration,
      value: 1,
    );

    _statesController.addListener(_handleStateChange);
    _state.addDependenciesChangedListener(_handleDependenciesChange);
    properties.forEach(_initProperty);
  }

  late AnimationController _animationController;
  late final Curve _curve = curve;
  final YgStatesController<T> _statesController;
  final YgUpdateMixin _state;

  BuildContext get context => _state.context;

  @override
  Animation<double> get parent => _animationController;

  @override
  double get value => _curve.transform(_animationController.value);

  void dispose() {
    _statesController.removeListener(_handleStateChange);
    _state.removeDependenciesChangedListener(_handleDependenciesChange);
    _animationController.dispose();
  }

  void _handleStateChange() {
    bool shouldAnimate = false;

    final List<_UpdateResult<T, dynamic>> results = <_UpdateResult<T, dynamic>>[];

    for (final YgDynamicAnimatedProperty<T> property in properties) {
      final _UpdateResult<T, dynamic> result = _updateProperty(property);

      results.add(result);

      shouldAnimate |= result.changed;
    }

    if (shouldAnimate) {
      for (final _UpdateResult<T, dynamic> result in results) {
        result.animate();
      }
      _animationController.forward(from: 0);
    }
  }

  _UpdateResult<T, V> _updateProperty<V>(YgAnimatedProperty<T, V> property) {
    final Set<T> states = _statesController.value;
    final Set<T> previousStates = _statesController.previous;

    final V previous = property.resolve(
      context,
      previousStates,
    );

    final V target = property.resolve(
      context,
      states,
    );

    final bool changed = previous != target;

    return _UpdateResult<T, V>(
      changed: changed,
      target: target,
      property: property,
    );
  }

  void _handleDependenciesChange() {
    bool shouldUpdate = false;

    for (final YgDynamicAnimatedProperty<T> property in properties) {
      shouldUpdate |= _updatePropertyTarget(property);
    }

    if (shouldUpdate) {
      // We have to update the listeners because the value of on of the child
      // animations changed, even though the animation did not advance.
      // ignore: invalid_use_of_protected_member
      _animationController.notifyListeners();
    }
  }

  bool _updatePropertyTarget<V>(YgAnimatedProperty<T, V> property) {
    final Set<T> states = _statesController.value;

    final V target = property.resolve(
      context,
      states,
    );

    final bool shouldUpdate = property.to != target;

    if (shouldUpdate) {
      property.to = target;
    }

    return shouldUpdate;
  }

  void _initProperty<V>(YgAnimatedProperty<T, V> property) {
    final V initial = property.resolve(
      _state.context,
      _statesController.value,
    );

    property.from = initial;
    property.to = initial;
  }

  Set<YgDynamicAnimatedProperty<T>> get properties;

  Duration get duration;

  Curve get curve;
}

class _UpdateResult<T extends Enum, V> {
  const _UpdateResult({
    required this.property,
    required this.changed,
    required this.target,
  });

  final YgAnimatedProperty<T, V> property;
  final V target;
  final bool changed;

  void animate() {
    property.from = property.value;
    property.to = target;
  }
}
