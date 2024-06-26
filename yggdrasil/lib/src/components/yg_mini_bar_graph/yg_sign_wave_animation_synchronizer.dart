import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YgSignWaveAnimationSynchronizer {
  YgSignWaveAnimationSynchronizer({required TickerProvider vsync})
      : _transitionController = AnimationController(vsync: vsync),
        _signWaveController = AnimationController(vsync: vsync)
          ..repeat(
            period: const Duration(seconds: 2),
          );

  final AnimationController _signWaveController;
  final AnimationController _transitionController;

  // Animation<double> transform(Animation<double> animation) {}
}

class SynchronizedSignWaveAnimation extends Animation<double> with ChangeNotifier {
  SynchronizedSignWaveAnimation({
    required AnimationController signWaveController,
    required AnimationController transitionController,
    required AnimationController childController,
  })  : _signWaveController = signWaveController,
        _transitionController = transitionController,
        _childController = childController,
        _value = lerpDouble(
          childController.value,
          signWaveController.value,
          transitionController.value,
        )!,
        _status = ValueNotifier<AnimationStatus>(
          transitionController.value > 0 ? signWaveController.status : childController.status,
        ) {
    _transitionController.addListener(_handleTransitionTick);
    _signWaveController.addListener(_handleSingWaveTick);
    _childController.addListener(_handleChildTick);
  }

  final AnimationController _signWaveController;
  final AnimationController _transitionController;
  final AnimationController _childController;
  final ValueNotifier<AnimationStatus> _status;
  final double _value;

  @override
  void addStatusListener(AnimationStatusListener listener) {
    // TODO: implement addStatusListener
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    // TODO: implement removeStatusListener
  }

  @override
  void dispose() {
    _transitionController.removeListener(_handleTransitionTick);
    _signWaveController.removeListener(_handleSingWaveTick);
    _childController.removeListener(_handleChildTick);
    super.dispose();
  }

  void _handleTransitionTick() {}

  void _handleSingWaveTick() {}

  void _handleChildTick() {}

  @override
  AnimationStatus get status => _status.value;

  @override
  double get value => _value;
}
