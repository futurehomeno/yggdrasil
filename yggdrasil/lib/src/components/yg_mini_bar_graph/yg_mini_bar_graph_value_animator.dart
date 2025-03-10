import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YgMiniBarGraphValueAnimator extends ChangeNotifier {
  YgMiniBarGraphValueAnimator({
    required List<double>? values,
    required TickerProvider vsync,
  })  : _values = values,
        _loadingAnimation = AnimationController(vsync: vsync),
        _transitionAnimation = AnimationController(vsync: vsync),
        _updateAnimation = AnimationController(vsync: vsync);

  final AnimationController _loadingAnimation;
  final AnimationController _transitionAnimation;
  final AnimationController _updateAnimation;

  List<YgMiniBarGraphBar>? _previousValues;
  List<YgMiniBarGraphBar>? _values;

  void updateValues(List<double>? values) {
    if (values == null) {
      _values = <YgMiniBarGraphBar>[];

      return;
    }

    double maxValue = 0;
    for (final double value in values) {
      maxValue = max(value, maxValue);
    }
  }

  List<YgMiniBarGraphBar> getBars(int amount) {
    final List<YgMiniBarGraphBar> bars = <YgMiniBarGraphBar>[];
    double maxValue = 0;

    if (_values != null) {
      for (final double value in _values) {
        if (value > maxValue) {
          maxValue = value;
        }
      }
    }

    for (int i = 0; i < amount; i++) {
      final double baseLoadingValue = _loadingAnimation.value;

      final double offsetLoadingValue = (baseLoadingValue + (0.05 * i)) % 1;
      final double loadingValue;
      if (offsetLoadingValue < 0.5) {
        loadingValue = Curves.bounceOut.transform(offsetLoadingValue / 0.5);
      } else {
        loadingValue = Curves.bounceOut.transform(1 - ((offsetLoadingValue - 0.5) / 0.5));
      }

      final double transitionValue = _transitionAnimation.value;
      final double updateValue = _updateAnimation.value;

      final double? fromValue = _previousValues?[i];
      final double? toValue = _values?[i];

      final double valueBase = lerpDouble(
        fromValue ?? 0.5,
        toValue ?? 0.5,
        updateValue,
      )!;

      final double value = lerpDouble(
        loadingValue,
        valueBase,
        transitionValue,
      )!;

      bars.add(YgMiniBarGraphBar(
        value: value,
        color: color,
        borderColor: borderColor,
      ));
    }

    return bars;
  }
}

class YgMiniBarGraphBar {
  YgMiniBarGraphBar({
    required this.value,
    required this.color,
    required this.borderColor,
  });

  final double value;
  final Color color;
  final Color borderColor;
}
