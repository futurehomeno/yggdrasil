import 'package:flutter/material.dart';

import 'yg_animated_style.dart';

// ignore: avoid-dynamic
typedef DynamicAnimation = Animation<dynamic>;
typedef YgPropertyResolver<T extends Enum, V> = V Function(BuildContext context, Set<T> states);
typedef Interpolator<T> = T Function(double t, T from, T to);

class YgAnimatedProperty<T extends Enum, V> extends Animation<V> with AnimationWithParentMixin<double> {
  YgAnimatedProperty.fromStyle(
    YgAnimatedStyle<T> style,
    this._resolve, [
    this._interpolator,
  ]) : parent = style {
    style.registerProperty<V>(this);
  }

  @override
  final Animation<double> parent;

  /// Resolves the value of the property given a set of states and a context.
  final YgPropertyResolver<T, V> _resolve;

  /// Interpolates between 2 values.
  final Interpolator<V>? _interpolator;

  /// The value this property animates from.
  V? _from;

  /// The value this property animates to.
  V? _to;

  /// Interpolate between 2 values.
  ///
  /// This method may be overwritten to implement custom typed properties.
  V lerp(double t, V from, V to) {
    final Interpolator<V>? interpolator = this._interpolator;

    // Fall back on simple interpolation when there is no user specified one.
    if (interpolator == null) {
      if (to == null) {
        return from;
      } else if (from == null) {
        return to;
      }

      if (t > 0.5) {
        return to;
      }

      return from;
    }

    return interpolator(t, from, to);
  }

  /// Resolves the target value.
  ///
  /// Returns true when the target value is different from the current target
  /// value.
  bool resolve(
    BuildContext context,
    Set<T> states,
  ) {
    final V target = _resolve(
      context,
      states,
    );

    if (_to == target || _from == null) {
      _from = target;
      _to = target;

      return false;
    }

    _from = value;
    _to = target;

    return true;
  }

  @override
  V get value {
    assert(
      _from != null && _to != null,
      'value was accessed before ${toString()} was initialized',
    );

    return lerp(
      parent.value,
      _from as V,
      _to as V,
    );
  }
}
