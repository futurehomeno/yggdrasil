import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  final Set<AnimationStatusListener> _statusListeners = <AnimationStatusListener>{};
  final Duration _duration;
  final Curve _curve;
  late final Ticker _ticker;
  double _value;
  double _to;
  double _from;
  AnimationStatus _status = AnimationStatus.dismissed;
  Duration _lastUpdate = Duration.zero;
  Duration _lastTick = Duration.zero;

  @override
  void dispose() {
    _statusListeners.clear();
    super.dispose();
  }

  void _tick(Duration elapsed) {
    _lastTick = elapsed;

    final Duration elapsedSinceUpdate = elapsed - _lastUpdate;
    final double progress = (elapsedSinceUpdate.inMilliseconds / _duration.inMilliseconds).clamp(0, 1);

    if (progress == 1) {
      _value = _to;
      _updateStatus(AnimationStatus.completed);
    } else {
      final double curvedProgress = _curve.transform(progress);

      _value = lerpDouble(
        _from,
        _to,
        curvedProgress,
      )!;
    }

    notifyListeners();
  }

  void update({
    required double currentValue,
    required double targetValue,
    required double maxDifference,
  }) {
    if (_to != targetValue) {
      _to = targetValue;
      _lastUpdate = _lastTick;
      _updateStatus(AnimationStatus.forward);
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

  set value(double value) {
    _from = value;
    _to = value;
    _value = value;
    _updateStatus(AnimationStatus.dismissed);
    notifyListeners();
  }
}
