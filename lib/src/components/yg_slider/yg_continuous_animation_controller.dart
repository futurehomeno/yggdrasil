import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Creates a animation which can be continuous updated with user input.
class YgContinuousAnimationController extends Animation<double> with ChangeNotifier {
  YgContinuousAnimationController({
    required TickerProvider vsync,
    required Duration duration,
    required Curve curve,
    double value = 0,
  })  : _from = value,
        _to = value,
        _value = value,
        _duration = duration,
        _curve = curve {
    _ticker = vsync.createTicker(_tick);
  }

  /// Status listeners.
  final Set<AnimationStatusListener> _statusListeners = <AnimationStatusListener>{};

  /// The duration of the animation of this widget.
  ///
  /// This duration is assuming the animation does not get updated in between.
  final Duration _duration;

  /// The curve applied to the animation.
  final Curve _curve;

  /// The ticker used to drive this animation.
  late final Ticker _ticker;

  /// The current value.
  double _value;

  /// The target value.
  double _to;

  /// The value to animate from.
  double _from;

  /// The current status of the animation.
  AnimationStatus _status = AnimationStatus.dismissed;

  /// The timestamp of when the animation was last updated.
  Duration _lastUpdate = Duration.zero;

  /// The timestamp of the last tick of the animation.
  Duration _lastTick = Duration.zero;

  @override
  void dispose() {
    _statusListeners.clear();
    super.dispose();
  }

  void _tick(Duration elapsed) {
    _lastTick = elapsed;

    /// Calculate the progress since the last update.
    final Duration elapsedSinceUpdate = elapsed - _lastUpdate;
    final double progress = elapsedSinceUpdate.inMilliseconds / _duration.inMilliseconds;

    if (progress >= 1) {
      /// If the progress is equal or more than 1 the animation has finished and
      /// we update the [_value] to the [_to] value and update the status.
      _value = _to;
      _updateStatus(AnimationStatus.completed);
    } else {
      /// if the progress is not equal to 1 we apply the curve to the progress
      /// and update the value by interpolating between the [_from] and [_to] values.
      final double curvedProgress = _curve.transform(progress);

      _value = lerpDouble(
        _from,
        _to,
        curvedProgress,
      )!;
    }

    notifyListeners();
  }

  /// Jumps to [newValue] without animation.
  void jumpTo(double newValue) {
    _from = newValue;
    _to = newValue;
    _value = newValue;
    _updateStatus(AnimationStatus.dismissed);
    notifyListeners();
  }

  /// Start a new animation from the current value to [newValue].
  void animateTo(double newValue) {
    if (_to == newValue) {
      return;
    }

    _lastUpdate = _lastTick;
    _from = _value;
    _to = newValue;
    _updateStatus(AnimationStatus.forward);
  }

  /// Update the current animation with a new value.
  ///
  /// Will keep the [_from] value within [maxDifference] of [currentValue] to
  /// prevent the [_value] from lagging behind the [currentValue] too much.
  void update({
    required double currentValue,
    required double targetValue,
    required double maxDifference,
  }) {
    if (_to != targetValue) {
      _to = targetValue;
      _lastUpdate = _lastTick;
      _updateStatus(AnimationStatus.forward);
      _from = _value;
    }

    _from = _from.clamp(
      currentValue - maxDifference,
      currentValue + maxDifference,
    );
  }

  @override
  void addStatusListener(AnimationStatusListener listener) {
    _statusListeners.add(listener);
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    _statusListeners.remove(listener);
  }

  /// Updates the status and the ticker based on the status.
  void _updateStatus(AnimationStatus newStatus) {
    if (_status == newStatus) {
      return;
    }

    if (newStatus == AnimationStatus.completed || newStatus == AnimationStatus.dismissed) {
      _ticker.stop();
    } else {
      _ticker.start();
      _lastTick = Duration.zero;
      _lastUpdate = Duration.zero;
    }

    _status = newStatus;

    for (final AnimationStatusListener listener in _statusListeners) {
      listener(newStatus);
    }
  }

  @override
  AnimationStatus get status => _status;

  @override
  double get value => _value;
}
