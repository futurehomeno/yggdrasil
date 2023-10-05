import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/yg_states_controller.dart';
import 'package:yggdrasil/src/utils/yg_states/yg_states_property.dart';

class YgAnimatedStatesProperty<T extends Enum, V> extends Animation<V> with AnimationWithParentMixin<double> {
  YgAnimatedStatesProperty({
    required this.property,
    required this.controller,
    required this.curve,
    required this.duration,
    required TickerProvider vsync,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: duration,
        ) {
    // Initially the value is static, so everything is set to the same value.
    final V initial = property.resolve(
      controller.states,
    );

    _begin = initial;
    _end = initial;
    _current = initial;

    controller.addListener(
      _handleStatesUpdate,
    );

    _animationController.addListener(
      _handleAnimationTick,
    );
  }

  /// The property that will be animated.
  final YgStatesProperty<T, V> property;

  /// The states controller.
  final YgStatesController<T> controller;

  /// The curve of the animation.
  final Curve curve;

  /// The duration of the animation.
  final Duration duration;

  /// The animation controller used to drive this animation.
  final AnimationController _animationController;

  /// The value this animation will animate to.
  late V _end;

  /// The value this animation will animate form.
  late V _begin;

  /// The current value of this animation.
  late V _current;

  void dispose() {
    controller.removeListener(_handleStatesUpdate);
    _animationController.removeListener(_handleAnimationTick);
    _animationController.dispose();
  }

  void _handleStatesUpdate() {
    final V newEnd = property.resolve(controller.states);

    if (_end == newEnd) {
      return;
    }

    _begin = _current;
    _end = newEnd;
    _animationController.value = 0;
    _animationController.forward();
  }

  void _handleAnimationTick() {
    final double t = curve.transform(
      _animationController.value,
    );

    _current = property.lerp(
      t,
      _begin,
      _end,
    );
  }

  @override
  Animation<double> get parent => _animationController;

  @override
  V get value => _current;
}
